# Flocode Python Starter Kit

A pragmatic starter kit for professional engineers and motivated beginners building computational tools on Windows.

This repository gives you a durable, repeatable Python environment. It installs and validates the core tooling you need before you write a single line of code.

## What the setup script covers

| Tool | Why it matters | Learn more |
| --- | --- | --- |
| Visual Studio Code | Friendly editor with debugging, linting, and notebook support. | https://code.visualstudio.com |
| Python (via Microsoft Store) | The runtime for all of your scripts and automations. | https://www.python.org/downloads |
| Git | Tracks file history and lets you collaborate safely. | https://git-scm.com |
| pip | Python's package installer for grabbing libraries. | https://pip.pypa.io |
| uv | Fast package/dependency manager from Astral. | https://docs.astral.sh/uv |
| Cookiecutter *(optional)* | Project templating tool that jump-starts new repos. | https://cookiecutter.readthedocs.io |
| VS Code Python & Jupyter extensions | Adds Python language smarts and notebook UX to VS Code. | https://marketplace.visualstudio.com |

## Before you run `flocode_python_setup.bat`

- Use an elevated PowerShell or right-click **Run as administrator** so installers can make system changes.
- Expect to re-run the script after winget/Store installs finish. Two or three passes are normal on a fresh machine.
- If Windows asks for a reboot, restart, reopen an elevated terminal, and run the script again until everything passes.

## Run the setup script

1. Download or clone this repository.
2. Right-click `flocode_python_setup.bat` -> **Run as administrator**.
3. Follow the prompts. You will be asked for your Git name/email, and whether to install Cookiecutter.
4. When the script finishes, re-run it (still elevated) until you see no warnings.

Once the script completes cleanly you have a ready-to-use Python workspace.

### About Cookiecutter

Cookiecutter helps you spin up consistent project scaffolding. The setup script offers to install it via `pip --user`. Choose **Yes** to install it automatically, or **No** to skip for now. You can always run `pip install --user cookiecutter` later.

## Confirm `uv` is ready

The script installs `uv` with `pip --user`, which drops the executable into `%USERPROFILE%\.local\bin`. If the command is missing after installation, the script now tries to add that folder to your user `PATH`. Open a new PowerShell window and run:

```powershell
uv --version
```

- If it prints a version, you are set.
- If PowerShell still cannot find `uv`, add `%USERPROFILE%\.local\bin` manually:
  - **PowerShell:**
    ```powershell
    $localBin = "$env:USERPROFILE\.local\bin"
    if (-not ($env:PATH -split ';' | Where-Object { $_ -eq $localBin })) {
        [Environment]::SetEnvironmentVariable('PATH', $env:PATH.TrimEnd(';') + ';' + $localBin, 'User')
    }
    ```
  - **GUI:** Settings -> System -> About -> Advanced system settings -> Environment Variables -> edit the **User** `Path`.
  - Open a fresh terminal afterwards and retry `uv --version`.

## Troubleshooting

- **`winget` not found:** Install the *App Installer* from the Microsoft Store, then rerun the script.
- **Installs keep failing:** Re-run the script between each installer, and reboot if prompted. `winget` jobs often need a second pass to finish registration.
- **`uv` still missing after PATH update:** Verify `%USERPROFILE%\.local\bin` exists. If it does, manually add it to `PATH` (see above) and restart PowerShell.
- **`setx` PATH conflicts / corporate policies:** Some managed devices block PATH edits. Ask your IT administrator or use a per-project virtual environment where you call `uv` via its full path.
- **Git config typo:** Run `git config --global user.name "Your Name"` or `git config --global user.email "you@example.com"` to fix mistakes.

## Learn more

- Python: https://docs.python.org/3/
- Git: https://git-scm.com/doc
- VS Code Python docs: https://code.visualstudio.com/docs/python/python-tutorial
- uv guide: https://docs.astral.sh/uv/guides/
- Cookiecutter tutorial: https://cookiecutter.readthedocs.io/en/stable/first_steps.html

## Keep leveling up

- Subscribe to the [Flocode newsletter](https://flocode.substack.com/) for concise, high-signal updates.
- Share feedback or improvements by opening an issue or PR; Flocode thrives on collaboration.

