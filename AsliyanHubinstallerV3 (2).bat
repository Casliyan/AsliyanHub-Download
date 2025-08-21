@echo off
:: ----------------------------
:: ASLIYANHUB Launcher for Windows (No PowerShell)
:: ----------------------------

:: Check for Python
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo [!] Python not found. Please install Python manually from https://www.python.org/downloads/
    pause
    exit /b 1
) ELSE (
    echo [✓] Python is installed.
)

:: Upgrade pip
echo [*] Upgrading pip...
python -m pip install --upgrade pip

:: Install required packages
echo [*] Installing required packages...
python -m pip install --upgrade requests pyperclip PyGithub customtkinter pillow pystray pyserial keyboard

:: Download latest ASLIYANHUB script
set "SCRIPT_URL=https://raw.githubusercontent.com/Casliyan/SERVER/main/ASLIYANHUB.PY"
set "SCRIPT_NAME=asliyanhub.py"

echo [*] Downloading ASLIYANHUB script...
bitsadmin /transfer downloadASLIYANHUB /priority normal "%SCRIPT_URL%" "%CD%\%SCRIPT_NAME%"

if exist "%SCRIPT_NAME%" (
    echo [✓] Script downloaded successfully.
) ELSE (
    echo [✗] Failed to download script. Exiting.
    pause
    exit /b 1
)

:: Run the script
echo [*] Launching ASLIYANHUB...
python "%SCRIPT_NAME%"

pause
