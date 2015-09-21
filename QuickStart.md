# LIQUi|> Quick Start Guide

1. Get a free [Microsoft account](http://windows.microsoft.com/en-US/windows-live/sign-up-create-account-how) if you don't already have one. You can use an existing email address for this, if you want, such as your institutional account or an existing Gmail or Yahoo! email account.
2. Sign up for a free [Azure trial](https://azure.microsoft.com/en-us/pricing/free-trial/) account.
3. Go to the [Visual Studio Community 2015](http://azure.microsoft.com/en-us/marketplace/partners/microsoft/visualstudiocommunity2015withazuresdk27onwindowsserver2012r2/) page in the Azure Virtual Machine Marketplace, and click on the "Create Virtual Machine" link. If requested, log in to the Microsoft account you set up in step 1.

![Azure Portal](/img/CreateVM.jpg)

4. This should bring you to the Azure Portal, pictured here. Clck on the "Create" button as indicated in the picture above. This will open the "Create VM" panel, pictured below.

![Create VM Panel](/img/CreateVMPanel.jpg)

5. Fill in a host name, user name, and password in the Create VM panel. The host name will be the name of your new VM; the user name and password will be for a new administrator account set up on the machine. Make sure you know the name and password because you will use them to log in to your VM later.
6. Click on the "Pricing Tier" item in the panel to open up the "Choose your pricing tier" panel, and click on the "View all" link to see all virtual machine options:

![Pricing Tier Panel](/img/PricingTierPanel.jpg)

7. Scroll down and click on the "A2 Basic" entry to select it, and then click on the "Select" button at the bottom of the panel. This will close the pricing tier panel.

![A2 Basics](/img/SelectA2Basic.jpg)

8. Click on the "Create" button at the Create VM panel to create and start your virtual machine. This will close the Create VM panel and bring you to the Azure Portal front page.

![Click to create](/img/ClickToCreate.jpg)

9. Click on the "Virtual machines (classic)" link on in the portal navigation menu. This will open the "Virtual machines (classic)" panel.

![Portal navigation](/img/PortalNav.jpg)

10. In the Virtual machines panel, click on the row with the virtual machine name you used in step 5. This will open the management panel for your VM.

![VM Panel](/img/VMPanel.jpg)

11. Wait until the Status field says "Running" (it might say Provisioning or Starting or another variation when you first navigate to this panel).

![Status: Running](/img/StatusRunning.jpg)

12. Click on the "Connect" icon at the top of the panel:

![Connect](/img/Connect.jpg)

13. At the bottom of your browser window, you should get a notification asking you if you want to open or save an RDP file from ms.portal.azure.com. CLick on the "Open" button.

14. Windows will pop up a notification from Remote Desktop COnnection, "The publisher of this remote connection can't be identified. Do you want to connect anyway?". Click on the "Connect" button.

15. Windows will pop up a login dialog from WIndows Security asking you to enter your credentials for the VM. Select "Use another account" and enter the user name and password you entered in step 5. A progress window will pop up, then that will close and another notification will appear from Remote Desktop Connection, "The identity of the remote computer cannot be verified. Do you want to connect anyway?". Click on the "Yes" button. The progress will reappear until your remote desktop session starts.
16. Once the remote desktop session starts, you'll get a notification on the right-hand side of the screen asking whether you want to enable network discovery. CLick on the "No" button.
17. Open up a web browser on the VM by hitting the Windows key and then clicking on the IE icon. Click on the OK button to use recommended settings. Navigate to GitHub to sign in to your account, and then go to https://desktop.github.com/ to download and install the GitHub Desktop client; installation may require clicking through multiple dialogs. Open the GitHub client and log in to GitHub.
18. In your browser, open the LIQUi|> GitHub site, https://github.com/msr-quarc/Liquid. Click on the "Clone in Desktop" button on the right-hand side of the window. Accept the default file location and any security notifications that open up.

![Clone in Desktop](/img/CloneInDesktop.jpg)

19. Open up a command prompt by right-clicking on the WIndows icon in the bottom-left corner of the VM remote desktop. Change directory to "Documents\GitHub\Liquid\bin" and type "Liquid.exe __Entangle1(12)". YOu should see output similar to the following:

![Command Prompt](/img/Command.jpg)

**That's it -- LIQUi|> is now installed on your virtual machine.**


