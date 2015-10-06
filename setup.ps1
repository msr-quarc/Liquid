<#
.SYNOPSIS
   Create and connects to an Azure VM with LIQUi|> installed.
.DESCRIPTION
   Creates a new VM image, based on the VS 2015 Community Edition stock image. 
   Copies LIQUi|> up to the image.
.EXAMPLE
   New-AzureVmImageWithWebPiApp.ps1 `
       -WebPIApplicationName blogengineNET -WebPIApplicationAnswerFile .\BlogengineNet.app `
       -ImageName bengineimage -ImageLabel bengineimagelabel 
.OUTPUTS
   Microsoft.WindowsAzure.Management.ServiceManagement.Model.OSImageContext
#>

param
(
    # Name of the new virtual machine.
    [Parameter(Mandatory = $true)]
    [String]
    $hostName
    )

# The script has been tested on Powershell 3.0
Set-StrictMode -Version 3

# Following modifies the Write-Verbose behavior to turn the messages on globally for this session
$VerbosePreference = "Continue"


# Check if Windows Azure Powershell is avaiable
if (((Get-Module -ListAvailable Azure) -eq $null) -and ((Get-Module Azure) -eq $null))
{
    throw "Windows Azure Powershell not found! Please make sure to install them from http://www.windowsazure.com/en-us/downloads/#cmd-line-tools"
}

Add-AzureAccount


<#
.SYNOPSIS
  Returns the latest image for a given image family name filter.
.DESCRIPTION
  Will return the latest image based on a filter match on the ImageFamilyName and
  PublisedDate of the image.  The more specific the filter, the more control you have
  over the object returned.
.EXAMPLE
  The following example will return the latest SQL Server image.  It could be SQL Server
  2014, 2012 or 2008
    
    Get-LatestImage -ImageFamilyNameFilter "*SQL Server*"


  The following example will return the latest SQL Server 2014 image. This function will
  also only select the image from images published by Microsoft.  
   
    Get-LatestImage -ImageFamilyNameFilter "*SQL Server 2014*" -OnlyMicrosoftImages


  The following example will return $null because Microsoft doesn't publish Ubuntu images.
   
    Get-LatestImage -ImageFamilyNameFilter "*Ubuntu*" -OnlyMicrosoftImages
#>
function Get-LatestImage
{
    param
    (
        # A filter for selecting the image family.
        # For example, "Windows Server 2012*", "*2012 Datacenter*", "*SQL*, "Sharepoint*"
        [Parameter(Mandatory = $true)]
        [String]
        $ImageFamilyNameFilter,


        # A switch to indicate whether or not to select the latest image where the publisher is Microsoft.
        # If this switch is not specified, then images from all possible publishers are considered.
        [Parameter(Mandatory = $false)]
        [switch]
        $OnlyMicrosoftImages
    )


    # Get a list of all available images.
    $imageList = Get-AzureVMImage


    if ($OnlyMicrosoftImages.IsPresent)
    {
        $imageList = $imageList |
                         Where-Object { `
                             ($_.PublisherName -ilike "Microsoft*" -and `
                              $_.ImageFamily -ilike $ImageFamilyNameFilter ) }
    }
    else
    {
        $imageList = $imageList |
                         Where-Object { `
                             ($_.ImageFamily -ilike $ImageFamilyNameFilter ) } 
    }


    $imageList = $imageList | 
                     Sort-Object -Unique -Descending -Property ImageFamily |
                     Sort-Object -Descending -Property PublishedDate


    $imageList | Select-Object -First(1)
}


<#
.SYNOPSIS
   Installs a WinRm certificate to the local store
.DESCRIPTION
   Gets the WinRM certificate from the Virtual Machine in the Service Name specified, and 
   installs it on the Current User's personal store.
.EXAMPLE
    Install-WinRmCertificate -ServiceName testservice -vmName testVm
.INPUTS
   None
.OUTPUTS
   None
#>
function Install-WinRmCertificate($ServiceName, $VMName)
{
    $vm = Get-AzureVM -ServiceName $ServiceName -Name $VMName
    $winRmCertificateThumbprint = $vm.VM.DefaultWinRMCertificateThumbprint
    
    $winRmCertificate = Get-AzureCertificate -ServiceName $ServiceName -Thumbprint $winRmCertificateThumbprint -ThumbprintAlgorithm sha1
    
    $installedCert = Get-Item Cert:\CurrentUser\My\$winRmCertificateThumbprint -ErrorAction SilentlyContinue
    
    if ($installedCert -eq $null)
    {
        $certBytes = [System.Convert]::FromBase64String($winRmCertificate.Data)
        $x509Cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate
        $x509Cert.Import($certBytes)
        
        $store = New-Object System.Security.Cryptography.X509Certificates.X509Store "Root", "LocalMachine"
        $store.Open("ReadWrite")
        $store.Add($x509Cert)
        $store.Close()
    }
}


<#
.SYNOPSIS
  Sends a file to a remote session.
.EXAMPLE
  $remoteSession = New-PSSession -ConnectionUri $remoteWinRmUri.AbsoluteUri -Credential $credential
  Send-File -Source "c:\temp\myappdata.xml" -Destination "c:\temp\myappdata.xml" $remoteSession
#>
function Send-File
{
    param (
        
        # The path on the local computer
        [Parameter(Mandatory = $true)]
        $Source,
        
        # The target path on the remote computer
        [Parameter(Mandatory = $true)]
        $Destination,
        
        # The session that represents the remote computer
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.Runspaces.PSSession] $Session)
    
    $remoteScript = 
    {
        param ($destination, $bytes)
        
        # Convert the destination path to a full filesystem path (to support relative paths)
        $destination = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($destination)
        
        # Write the content to the new file
        $file = [IO.File]::Open($destination, "OpenOrCreate")
        $null = $file.Seek(0, "End")
        $null = $file.Write($bytes, 0, $bytes.Length)
        $file.Close()
    }
    
    # Get the source file, and then start reading its content
    $sourceFile = Get-Item $Source
    
    # Delete the previously-existing file if it exists
    Invoke-Command -Session $Session {
        if (Test-Path $args[0])
        {
            Remove-Item $args[0]
        }
        
        $destinationDirectory = Split-Path -LiteralPath $args[0]
        if (!(Test-Path $destinationDirectory))
        {
            New-Item -ItemType Directory -Force -Path $destinationDirectory | Out-Null
        }
    } -ArgumentList $Destination
    
    # Now break it into chunks to stream
    Write-Progress -Activity "Sending $Source" -Status "Preparing file"
    $streamSize = 1MB
    $position = 0
    $rawBytes = New-Object byte[] $streamSize
    $file = [IO.File]::OpenRead($sourceFile.FullName)
    while (($read = $file.Read($rawBytes, 0, $streamSize)) -gt 0)
    {
        Write-Progress -Activity "Writing $Destination" `
        -Status "Sending file" `
        -PercentComplete ($position / $sourceFile.Length * 100)
        
        # Ensure that our array is the same size as what we read
        
        # from disk
        if ($read -ne $rawBytes.Length)
        {
            [Array]::Resize( [ref] $rawBytes, $read)
        }
        
        # And send that array to the remote system
        Invoke-Command -Session $session $remoteScript `
        -ArgumentList $destination, $rawBytes
        
        # Ensure that our array is the same size as what we read
        
        # from disk
        if ($rawBytes.Length -ne $streamSize)
        {
            [Array]::Resize( [ref] $rawBytes, $streamSize)
        }
        [GC]::Collect()
        $position += $read
    }
    
    $file.Close()
    
    # Show the result
    Invoke-Command -Session $Session { Get-Item $args[0] } -ArgumentList $Destination
}

function Send-Dir 
{
    param (
        
        # The path on the local computer
        [Parameter(Mandatory = $true)]
        $Source,
        
        # The target path on the remote computer
        [Parameter(Mandatory = $true)]
        $Destination,
        
        # The session that represents the remote computer
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.Runspaces.PSSession] $Session)
		
	$files = Get-ChildItem $Source -Recurse -File -Name
	$n = $files.Length
	$i = 1
	foreach ($file in $files)
	{
		$src = $Source + "\\" + $file
		$dest = $Destination + "\\" + $file
		Write-Progress -Activity "Writing $Destination" -Status "Sending" -PercentComplete ($i / $n * 100)
		Send-File $src $dest $Session
		$i += 1
	}
	
	Write-Progress -Activity "Writing $Destination" -Completed
}

Write-Progress -Activity "Creating Liquid VM" -Status "Logged into Azure account" -PercentComplete 1


# Get an image to provision virtual machines from.
$imageFamilyNameFilter = "Visual Studio Community 2015*"
$image = Get-LatestImage -ImageFamilyNameFilter $imageFamilyNameFilter -OnlyMicrosoftImages
if ($image -eq $null)
{
    throw "Unable to find an image for $imageFamilyNameFilter to provision Virtual Machine."
}

Write-Progress -Activity "Creating Liquid VM" -Status "Found VM base image" -PercentComplete 5


$serviceName = "Liquid-" + [guid]::NewGuid().ToString()

Write-Verbose "Prompt user for admininstrator credentials to use when provisioning the virtual machine(s)."
$credential = Get-Credential -Message "Please enter a user name and password for the admin account on your new virtual machine"
Write-Information "Administrator credentials captured.  Use these credentials to login to the virtual machine(s) when the script is complete."

Write-Progress -Activity "Creating Liquid VM" -Status "Received administrator credentials" -PercentComplete 10

Write-Progress -Activity "Creating Liquid VM" -Status "Checking for an existing VM" -PercentComplete 11
$existingVm = Get-AzureVM -ServiceName $serviceName -Name $hostName -ErrorAction SilentlyContinue
if ($existingVm -ne $null)
{
    throw "A VM with name $hostName already exists on $serviceName. Please use a different name."
}

Write-Progress -Activity "Creating Liquid VM" -Status "Creating a new Azure storage account." -PercentComplete 13
$storageName = [guid]::NewGuid().ToString().Replace("-","").Substring(0,24)
$storageAccount = New-AzureStorageAccount -Description "For Liquid VM use" -StorageAccountName $storageName -Location "South Central US"

Write-Progress -Activity "Creating Liquid VM" -Status "Creating the temporary VM." -PercentComplete 20

New-AzureQuickVM -Name $hostName -InstanceSize Basic_A2 -ImageName $image.ImageName -MediaLocation "$storageName" `
			-Windows -AdminUsername  $credential.GetNetworkCredential().username -Password $credential.GetNetworkCredential().password `
			 -Location "South Central US" -ServiceName $serviceName -WaitForBoot | Out-Null

Write-Progress -Activity "Creating Liquid VM" -Status "Created the VM" -PercentComplete 60

if ($?)
{
	Write-Verbose "Created the VM and the cloud service $serviceName"
}

# prepare to run the remote execution

# Get the RemotePS/WinRM Uri to connect to
$winRmUri = Get-AzureWinRMUri -ServiceName $serviceName -Name $hostName


Install-WinRmCertificate $serviceName $hostName
Write-Progress -Activity "Creating Liquid VM" `
    -Status "Configured WinRM access. Now will start copying the Liquid files to the VM." `
    -PercentComplete 65


$remoteDirectory = "c:\Liquid"

# Copy the required files to the remote server
$remoteSession = New-PSSession -ConnectionUri $winRmUri.AbsoluteUri -Credential $credential
$sourcePath = "$PSScriptRoot"
$remoteScriptFilePath = "$remoteDirectory"
Send-File $sourcePath $remoteScriptFilePath $remoteSession


$answerFileName = Split-Path -Leaf $WebPIApplicationAnswerFile
$answerFilePath = "$remoteScriptsDirectory\$answerFileName"
Send-File $WebPIApplicationAnswerFile $answerFilePath $remoteSession
Remove-PSSession -InstanceId $remoteSession.InstanceId


Write-Progress -Activity "Creating Liquid VM" -Status "Copied the files to VM." -PercentComplete 95

# Write a local RDP file
Write-Progress -Activity "Creating Liquid VM" -Status "Creating RDP file." -PercentComplete 96

$rdpPath = "$HOME\Desktop\Liquid.rdp"
Get-AzureRemoteDesktopFile -Name "$hostName" -ServiceName "$serviceName" -LocalPath "$rdpPath" -Launch

Write-Progress -Activity "Creating Liquid VM" -Completed







