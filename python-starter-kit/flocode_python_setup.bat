@echo off
setlocal enabledelayedexpansion

echo.
echo Flocode's setup assistant configures a repeatable Python workspace for professional engineers.
echo It verifies and, when needed, installs:
echo   - VS Code (IDE)
echo   - Python (programming language)
echo   - Git (version control)
echo   - pip (Python package installer)
echo   - Essential Python packages (uv, cookiecutter)
echo.
echo The walkthrough explains why each tool matters and handles prerequisites automatically.
echo Run this script with Administrator privileges if software installation is required.
echo Expect to re-run this script as installations complete. Keep running it as Administrator until every dependency verifies.
echo If Windows requests a restart, reboot and launch this script again to finish configuration.
echo.
pause

REM --- Configuration ---
set "PYTHON_VERSION_TARGET=3.10"
set "PYTHON_WINGET_ID=Python.Python.3.10"
set "VSCODE_WINGET_ID=Microsoft.VisualStudioCode"
set "GIT_WINGET_ID=Git.Git"
set "VSCODE_PYTHON_EXT_ID=ms-python.python"
set "VSCODE_JUPYTER_EXT_ID=ms-toolsai.jupyter"
set "VSCODE_DEFAULT_CODE_CMD=%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd"
set "WINGET_AVAILABLE=0"
set "PIP_AVAILABLE=0"

goto :start_main_logic

:echo_title
echo.
echo -------------------------------------------------------------------------------
echo %~1
echo -------------------------------------------------------------------------------
goto :eof

:check_command
set "CMD_TO_CHECK=%~1"
where %CMD_TO_CHECK% 1>nul 2>nul
if %ERRORLEVEL% == 0 (
    echo [INFO] %CMD_TO_CHECK% found.
    exit /b 0
) else (
    echo [INFO] %CMD_TO_CHECK% not found.
    exit /b 1
)

:install_tool
REM Parameters: display name, winget ID, additional args, check command
if "%WINGET_AVAILABLE%" == "0" (
    echo [WARN] Cannot install %~1 automatically. Please install it manually.
    exit /b 1
)

echo [INFO] Installing %~1...
winget install --accept-source-agreements --accept-package-agreements %~2 %~3
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Failed to install %~1.
    exit /b 1
)

echo [INFO] Checking if %~1 was installed...
where %~4 1>nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [WARN] %~1 command not found after installation. You may need to restart your terminal or computer.
    echo [WARN] Please restart and run this script again.
    exit /b 1
)

echo [INFO] %~1 installed successfully.
exit /b 0

:start_main_logic
REM --- Check for Administrator Privileges ---
call :echo_title "Step 1: Checking Administrator Privileges"
net session >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Administrator privileges are required to install software.
    echo Please re-run this script as an Administrator.
    goto :end_script_pause
) else (
    echo [INFO] Administrator privileges detected.
)

REM --- Check for winget availability ---
call :echo_title "Step 2: Checking for winget package manager"
where winget >nul 2>nul
if %ERRORLEVEL% == 0 (
    echo [INFO] winget found.
    set "WINGET_AVAILABLE=1"
) else (
    echo [WARN] winget not found.
    echo [INFO] VS Code, Python, and Git installations will need to be performed manually if they are not already present.
    echo [INFO] You can get winget by installing the 'App Installer' from the Microsoft Store.
)
echo.

REM --- Prerequisite Checks ---
call :echo_title "Step 3: Checking Core Prerequisites"

REM Check for VS Code
call :check_command code
if %ERRORLEVEL% NEQ 0 (
    call :install_tool "VS Code" "%VSCODE_WINGET_ID%" "" "code" || (
        echo [FATAL] VS Code is required. Exiting.
        goto :end_script_pause
    )
)

REM Check for Python
call :check_command py
if %ERRORLEVEL% NEQ 0 (
    call :install_tool "Python" "%PYTHON_WINGET_ID%" "" "py" || (
        echo [FATAL] Python is required. Exiting.
        goto :end_script_pause
    )
) else (
    REM Basic Python version check (optional, can be more robust)
    for /F "tokens=2" %%v in ('py --version 2^>^&1') do set PYTHON_VER=%%v
    echo [INFO] Python version !PYTHON_VER! found. Recommended: 3.10 or newer.
)

REM Check for Git
call :check_command git
if %ERRORLEVEL% NEQ 0 (
    call :install_tool "Git" "%GIT_WINGET_ID%" "" "git" || (
        echo [FATAL] Git is required. Exiting.
        goto :end_script_pause
    )
)

REM --- Configure Git ---
call :echo_title "Step 4: Configuring Git"
set /p "GIT_USER_NAME=Enter your full name for Git: "
set /p "GIT_USER_EMAIL=Enter your email for Git: "
git config --global user.name "%GIT_USER_NAME%"
git config --global user.email "%GIT_USER_EMAIL%"
echo [INFO] Git has been configured with your name and email.

REM Check for pip (needed for UV and Cookiecutter)
echo [INFO] Checking for pip...
set "PIP_AVAILABLE=1"
echo [INFO] Assumes pip is available following Python installation.

REM Check for UV and Cookiecutter
call :echo_title "Step 5: Installing Python Tools"
if "%PIP_AVAILABLE%" == "1" (
    echo [INFO] Installing UV...
    py -3 -m pip install --user uv

    if %ERRORLEVEL% NEQ 0 (

        echo [WARN] Failed to install UV. You may need to install it manually.

    ) else (

        set "UV_LOCAL_BIN=%USERPROFILE%\.local\bin"

        where uv >nul 2>nul

        if %ERRORLEVEL% NEQ 0 (

            echo [WARN] uv was installed, but the command is not yet available on PATH.
            echo [INFO] Attempting to add "%UV_LOCAL_BIN%" to your user PATH automatically...

            powershell -NoLogo -NoProfile -Command "$localBin = Join-Path $env:USERPROFILE '.local\bin'; $current = [Environment]::GetEnvironmentVariable('PATH','User'); if ([string]::IsNullOrEmpty($current)) { [Environment]::SetEnvironmentVariable('PATH', $localBin, 'User'); exit 0 } elseif (-not ($current -split ';' | Where-Object { $_ -eq $localBin })) { $updated = $current.TrimEnd(';') + ';' + $localBin; [Environment]::SetEnvironmentVariable('PATH', $updated, 'User'); exit 0 } else { exit 3 }"

            set "PS_EXIT=!ERRORLEVEL!"

            if "!PS_EXIT!"=="0" (

                echo [INFO] User PATH updated. Restart this terminal before running uv.

            ) else if "!PS_EXIT!"=="3" (

                echo [INFO] "%UV_LOCAL_BIN%" already present in user PATH. Restart this terminal before running uv.

            ) else (

                echo [WARN] Automatic PATH update failed. Add "%UV_LOCAL_BIN%" to your PATH manually and restart this terminal.

            )

        ) else (

            echo [INFO] uv command detected on PATH.

        )

    )

    set "INSTALL_COOKIECUTTER=Y"

    set /p "INSTALL_COOKIECUTTER=Install Cookiecutter to streamline project templates? (Y/N) [Y]: "

    if not defined INSTALL_COOKIECUTTER set "INSTALL_COOKIECUTTER=Y"

    if /I "!INSTALL_COOKIECUTTER!"=="Y" (

        echo [INFO] Installing Cookiecutter...

        py -3 -m pip install --user cookiecutter

        if !ERRORLEVEL! NEQ 0 (

            echo [WARN] Failed to install Cookiecutter. You may need to install it manually.

        ) else (

            echo [INFO] Cookiecutter installed.

        )

    ) else (

        echo [INFO] Skipping Cookiecutter install at your request.

    )
) else (
    echo [WARN] pip not available. Cannot install UV and Cookiecutter.
)

REM --- Install VS Code Extensions ---
call :echo_title "Step 6: Setting up VS Code Extensions"
set "CODE_CLI="
for /f "delims=" %%i in ('where code 2^>nul') do (
    if not defined CODE_CLI (
        set "CODE_CLI=%%i"
    )
)
if not defined CODE_CLI (
    if exist "%VSCODE_DEFAULT_CODE_CMD%" (
        set "CODE_CLI=%VSCODE_DEFAULT_CODE_CMD%"
    )
)
if defined CODE_CLI (
    echo [INFO] Installing VS Code extensions using "!CODE_CLI!"...
    set "EXT_INSTALL_ERROR=0"
    "!CODE_CLI!" --install-extension %VSCODE_PYTHON_EXT_ID% --force
    if !ERRORLEVEL! NEQ 0 (
        echo [WARN] Failed to install extension %VSCODE_PYTHON_EXT_ID%.
        set "EXT_INSTALL_ERROR=1"
    )
    "!CODE_CLI!" --install-extension %VSCODE_JUPYTER_EXT_ID% --force
    if !ERRORLEVEL! NEQ 0 (
        echo [WARN] Failed to install extension %VSCODE_JUPYTER_EXT_ID%.
        set "EXT_INSTALL_ERROR=1"
    )
    if !EXT_INSTALL_ERROR! EQU 0 (
        echo [INFO] Extensions installed.
    ) else (
        echo [WARN] One or more extensions failed to install. Install them manually if needed.
    )
) else (
    echo [WARN] VS Code CLI not found. Extensions must be installed manually.
    echo [INFO] Please install the following VS Code extensions manually:
    echo - Python Extension (%VSCODE_PYTHON_EXT_ID%)
    echo - Jupyter Extension (%VSCODE_JUPYTER_EXT_ID%)
)

REM --- Conclusion Message ---
call :echo_title "Prerequisite Checks Complete"
echo.
echo [SUCCESS] All prerequisite tools have been verified:
echo  - VS Code: Installed
echo  - Python: Installed (Version !PYTHON_VER!)
echo  - Git: Installed and configured
echo  - pip: Available
echo  - VS Code Extensions: Configured
echo  - UV: Installed
echo  - Cookiecutter: Installed
echo [NOTE] Resolve any warnings or restart prompts, then run this script again as Administrator until every check passes without errors.
echo.
echo Your development environment is now dialed in for Flocode workflows.
echo Explore playbooks and frameworks through the newsletter at https://flocode.substack.com/.
echo.
echo Happy building!

:end_script_pause
echo.
pause



