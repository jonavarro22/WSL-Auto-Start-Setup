@echo off
:: ============================================================
:: WSL Setup Script for Windows 11
:: 1. Installs WSL (if not installed)
:: 2. Sets the default distribution to Ubuntu (change as needed)
:: 3. Adds WSL to the startup sequence via the registry
:: ============================================================

:: ----- Check for Administrator Privileges -----
:: (This method tries to perform an admin-only command)
openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    echo This script must be run as Administrator.
    pause
    exit /b
)

:: ----- Install WSL (if not already installed) -----
echo Installing Windows Subsystem for Linux...
wsl --install

:: Note: If WSL was not previously installed, the above command may download
:: components and then require you to reboot your computer to complete installation.
:: You may need to run this script again after reboot.

:: ----- Set Default Distribution -----
:: Change "Ubuntu" to your preferred distro if necessary.
echo Setting default distribution to Ubuntu...
wsl --set-default Ubuntu

:: ----- Add WSL to the Startup Sequence -----
echo Adding WSL to startup...
:: This command adds an entry in the current user’s Run registry key.
:: When you log in, Windows will automatically launch wsl.exe.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WSL" /t REG_SZ /d "wsl.exe" /f

echo.
echo WSL has been installed (or is already installed), the default distribution has been set,
echo and WSL will now start automatically when you log in.
echo If WSL was just installed, please reboot your computer to complete the setup.
pause
