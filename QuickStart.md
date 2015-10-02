# LIQUi|> Quick Start Guide

**SUMMARY**
This guide takes you through the steps of 
- creating an Azure VM, 
- remote connect to the VM
- acquire the GitHub Desktop, 
- clone the Liquid repository
- run a test, 
- stopping the VM
- restarting the VM

**WHAT YOU WILL NEED** 
If you are using a non-Windows computer, you will need to install a Remote Desktop Client to complete this Quick Start. Links to supported clients are available [here for Mac, iOS, and Android](https://technet.microsoft.com/en-us/library/dn473009.aspx). For Linux, you might try [FreeRDP](http://www.freerdp.com/), but we haven't tested it yet.
One of the following browsers: xxxxxxx
About 45 minutes, though you can carry on working while things happen in the background.

**STAY UP TO DATE**
Please watch our repository and sign up for the LIQUi|> email list liquid@lists.research.microsoft.com] with a one-line body reading "SUB Liquid *your name*".

**CREATE A VIRTUAL MACHINE (VM)**
1. Get a free <a href="http://windows.microsoft.com/en-US/windows-live/sign-up-create-account-how" target="_blank">Microsoft account</a> if you don't already have one. 

TIP: You can use an existing email address for this, if you want, such as your institutional account or an existing Gmail or Yahoo! email account.

2. Sign up for a free <a href="https://azure.microsoft.com/en-us/pricing/free-trial/" target="_blank">Azure trial</a> account.

3. Go to the <a href="http://azure.microsoft.com/en-us/marketplace/partners/microsoft/visualstudiocommunity2015withazuresdk27onwindowsserver2012r2/" target="_blank">Visual Studio Community 2015</a> page in the Azure Virtual Machine Marketplace, and click on the "Create Virtual Machine" link. If requested, log in to the Microsoft account you set up in step 1.  This brings you to the Azure Portal.

TIP: If you are using a different log in for Azure to the one you are using on your machine, then you might need to ensure you have a "clean" browser window in order to sign in. On the Edge browser, click the ... on the right and select New InPrivate Window". For IE, close all windows, the shift-right click on the IE icon and choose “Run as different user”.
![Azure Portal](/img/CreateVM.jpg)

4. Click on the "Create" button as indicated in the picture above. This will open the "Create VM" panel, pictured below.  
![Create VM Panel](/img/CreateVMPanel.jpg)

5. Fill in a host name, user name, and password in the Create VM panel. The host name will be the name of your new VM; the user name and password will be for a new administrator account set up on the machine. The Location is the data center where your VM will reside and you should choose somewhere close to you.

TIP: Make a note of the name and password you choose because you will use them to log in to your VM later.

6. Click on the "Pricing Tier" item in the panel which opens up the "Choose your pricing tier" panel, and click on the "View all" link to see all virtual machine options:  
![Pricing Tier Panel](/img/PricingTierPanel.jpg)

7. Scroll down and click on the "A2 Basic" entry to select it, and then click on the "Select" button at the bottom of the panel. This will close the pricing tier panel.  
![A2 Basics](/img/SelectA2Basic.jpg)

8. Click on the "Create" button at the Create VM panel to create and start your virtual machine. After the creation process has finished, this will close the Create VM panel and bring you back to the Azure Portal front page. 
TIP: Creation could take anything from 2-20 minutes depending on load. Be patient. You can use your computer for other work while waiting.
![Click to create](/img/ClickToCreate.jpg)

9. Click on the "Virtual machines (classic)" link on in the portal navigation menu. This will open the "Virtual machines (classic)" panel.  
![Portal navigation](/img/PortalNav.jpg)

10. In the Virtual machines panel, click on the row with the virtual machine name you used in step 5. This will open the management panel for your VM.  
![VM Panel](/img/VMPanel.jpg)

11. Wait until the Status field says "Running" (it might say Provisioning or Starting or another variation when you first navigate to this panel).
TIP: You might need to wait several minutes for this status.  
![Status: Running](/img/StatusRunning.jpg)


**REMOTE CONNECT TO THE VM**
12. Click on the "Connect" icon at the top of the panel:  
![Connect](/img/Connect.jpg)
13. At the bottom of your browser window, you should get a notification asking you if you want to open or save an RDP file from ms.portal.azure.com. Click on the "Open" button.  
**NOTE**: If you are not on a Windows client, the next two steps may be slightly different.
14. Windows will pop up a notification from Remote Desktop Connection, "The publisher of this remote connection can't be identified. Do you want to connect anyway?". Click on the "Connect" button.
15. Windows will pop up a login dialog from Windows Security asking you to enter your credentials for the VM. Select "Use another account" and enter the user name and password you entered in step 5. A progress window will pop up, then that will close and another notification will appear from Remote Desktop Connection, "The identity of the remote computer cannot be verified. Do you want to connect anyway?". Click on the "Yes" button. The progress will reappear until your remote desktop session starts.
16. The remote desktop session will start full screen. While your login is being set up, the screen may be black for several minutes. Once the remote desktop session starts, you may get a notification on the right-hand side of the screen asking whether you want to enable network discovery. Click on the "No" button.

**ACQUIRE THE GITHUB DESKTOP**
17. Open up a web browser on the VM by hitting the Windows key and then clicking on the IE icon. Click on the OK button to use recommended settings. Navigate to <a href="http://github.com" target="_blank">github.com</a> to sign in to your GitHub account, and then go to <a href="http://desktop.github.com/" target="_blank">desktop.github.com</a> to download and install the GitHub Desktop client; installation may require clicking through multiple dialogs. 
18. Open the GitHub client on your VM and log in to GitHub.

**CLONE THE LIQUID REPOSITORY**
19. Click on the "+" in the top left corner of the client, click on "Clone", and then selecting "msr-quarc" on the left and "Liquid" from the lst of repositories, and then clicking on "Clone repository".

**RUN A TEST**
20. Open up a command prompt by right-clicking on the Windows icon in the bottom-left corner of the VM remote desktop. Change directory to "Documents\GitHub\Liquid\bin" and type "Liquid.exe __Entangle1(12)" (*Note*: there are **two** underscores before the E). You should see output similar to the following:  
![Command Prompt](/img/Command.jpg)
21. To see all of the available samples, just type "Liquid.exe" at the command prompt.

**That's it -- LIQUi|> is now installed on your virtual machine.**

**STOP THE VM**
22. When you're done with your session, log out of your remote desktop session and stop your VM in the Azure Portal by clicking on the "Stop" icon.
TIP: That way your account won't be charged for your VM when you're not using it.

**RESTARTING THE VM**
23. You can restart your VM by going to the management panel and clicking on the "Start" icon again, and then on the "Connect" icon once the VM is running.
TIP: If you've closed the portal in your browser, you can always get to it as <a href="http://azure.com/portal" target="_blank">azure.com/portal</a>.
TIP: The disk image is saved when you stop and restart, so you will not need to reinstall GitHub or LIQUi|>.

