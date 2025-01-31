# WSL Setup Script

This repository contains a Windows batch script that installs the Windows Subsystem for Linux (WSL), sets the default Linux distribution, and configures WSL to start automatically on Windows login.

## Overview

The script performs the following tasks:

1. **Install WSL:** Uses the `wsl --install` command to install WSL if it is not already installed.
2. **Set the Default Distribution:** Configures Ubuntu as the default Linux distribution. (You can change this to your preferred distro.)
3. **Auto-Start on Login:** Adds a registry entry to start `wsl.exe` automatically when you log in to Windows.

> **Note:**  
> - **Administrator Rights Required:** The script must be run as an administrator to properly install WSL and modify the registry.  
> - **Reboot May Be Required:** If WSL is being installed for the first time, a reboot may be necessary to complete the installation.  
> - **Customization:** You can modify the script to change the default distribution or to run custom startup commands.

## Files

- **SetupWSL.bat**: The batch script that installs and configures WSL.
- **README.md**: This file.

## Prerequisites

- **Windows 11:** The script is designed for Windows 11 systems.
- **Administrator Privileges:** Ensure you run the script as an administrator. Right-click the script and choose "Run as Administrator".

## How to Use

1. **Download or Clone the Repository**  
   Clone or download the repository containing the `SetupWSL.bat` script.

2. **Review the Script**  
   Open `SetupWSL.bat` in your favorite text editor to review or customize settings, such as changing the default Linux distribution (currently set to Ubuntu).

3. **Run the Script as Administrator**  
   - Right-click `SetupWSL.bat`.
   - Select **Run as administrator**.
   - Follow any on-screen prompts.

   > **Tip:** If you see a message indicating that WSL requires a reboot, please restart your computer and run the script again if necessary.

4. **Verify WSL Installation and Startup**  
   - After the script completes (and after rebooting if required), WSL should be installed, and Ubuntu (or your chosen distribution) will be set as the default.
   - WSL will start automatically upon login due to the registry entry added by the script.

## Customization

- **Changing the Default Distribution:**  
  To change the default Linux distribution, open `SetupWSL.bat` in a text editor and modify the following line:  
  ```bat
  wsl --set-default Ubuntu
  ```  
  Replace `Ubuntu` with the name of your desired distribution.

- **Running Custom Startup Commands:**  
  If you want to run specific commands or scripts on startup within your Linux environment, you can modify the registry entry line to include your commands. For example:  
  ```bat
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WSL" /t REG_SZ /d "wsl -e /path/to/your/script.sh" /f
  ```
  Ensure that the script exists and is executable in your WSL environment.

## Troubleshooting

- **Script Not Running as Administrator:**  
  If the script does not run with administrator privileges, it will exit with a prompt. Ensure you right-click and select **Run as administrator**.

- **Reboot Required:**  
  If WSL is being installed for the first time, a reboot is necessary. Follow the instructions on the screen, then re-run the script if needed.

- **WSL Not Starting Automatically:**  
  Verify that the registry key was added correctly by checking the following registry path:
  ```
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
  ```
  The key `WSL` should have the value `wsl.exe`.

## License

This project is provided under the [MIT License](LICENSE) (if applicable).

## Acknowledgments

- Thanks to the [Microsoft WSL Documentation](https://docs.microsoft.com/en-us/windows/wsl/) for guidance on WSL setup.
- Contributions and improvements are welcome!

