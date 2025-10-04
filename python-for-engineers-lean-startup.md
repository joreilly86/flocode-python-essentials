# Python for Engineers | Lean Startup

This walkthrough gets you from zero to a working Jupyter notebook with the exact tooling used throughout the course. Follow it straight through and you will have a clean environment managed by uv, ready for real work.

## 1. Install PowerShell 7 (if needed)

Grab the latest version from Microsoft: <https://learn.microsoft.com/powershell/scripting/install/installing-powershell-on-windows>.

```powershell
winget install --id Microsoft.PowerShell --source winget
```

## 2. Install uv and Python

```powershell
Invoke-WebRequest -Uri https://astral.sh/uv/install.ps1 -OutFile install.ps1
powershell -ExecutionPolicy Bypass -File .\install.ps1
uv python install 3.12
uv python --version
```

uv now manages your Python installs, virtual environments, and dependencies.

## 3. Install Visual Studio Code

Download from <https://code.visualstudio.com/> and install the "Python" and "Jupyter" extensions (Ctrl+Shift+X inside VS Code to open the Extensions view).

## 4. Create a Project

```powershell
mkdir flocode-lean-startup
cd flocode-lean-startup
uv init
```

`uv init` creates a project structure plus a `.venv` folder scoped to this directory.

## 5. Add Notebook Tooling

```powershell
uv pip install ipykernel jupyterlab
```

`ipykernel` exposes the environment to notebooks. `jupyterlab` provides the command-line utilities and is handy even inside VS Code.

## 6. Open VS Code and Create a Notebook

- `Ctrl+Shift+P` → "Jupyter: Create New Blank Notebook"
- Save the notebook in the project folder
- Click the kernel selector (top-right) and choose the `.venv` interpreter that uv created (usually `.venv\\Scripts\\python.exe` on Windows)

## 7. Run Your First Cell

```python
print("Ready for liftoff")
```

If the output appears beneath the cell, the environment is wired up correctly. From here you can install libraries with `uv pip install`, commit the project to Git, and start building.

Stay curious, take notes, and refine this setup as you grow. The smoother your tooling, the more energy you can spend on engineering.
