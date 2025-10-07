# 04 | Jupyter Notebooks 101

## Modules

- [01 - Housekeeping](01-housekeeping.md)
- [02 - Python the Language](02-python-the-language.md)
- [03 - Your Engineering System](03-your-engineering-system.md)
- [04 - Jupyter Notebooks 101](04-jupyter-notebooks-101.md)
- [05 - Basic Syntax](05-basic-syntax.md)
- [06 - Data Structures](06-data-structures.md)
- [07 - Control Flow](07-control-flow.md)
- [08 - Functions](08-functions.md)

---

## Why Notebooks Matter

Jupyter notebooks let you mix code, narrative, math, and plots in a single document. That makes them perfect for exploratory work, design calculations, and sharing results with teammates who do not want to trawl through raw Python files.

I start most of my work in a notebook because it allows for easy modularization of code. Once I'm happy with it, I might turn it into a script for automating something or I may keep it as a notebook to document my design process with commentary and notes and outputs, so they are all in one place

## Installing the Pieces

I run notebooks inside VS Code, backed by environments managed with uv. Adjust the workflow if you prefer another editor, but the core steps stay the same.

1. **Install uv** (once per machine):

    ```powershell
    Invoke-WebRequest -Uri https://astral.sh/uv/install.ps1 -OutFile install.ps1
    powershell -ExecutionPolicy Bypass -File .\install.ps1
    ```

2. **Install Python via uv**:

    ```powershell
    uv python install 3.12
    ```

3. **Create a project folder and initialise it**:

    ```powershell
    mkdir python-essentials-demo
    cd python-essentials-demo
    uv init
    ```

    This creates a `.venv` folder tied to the project and a `pyproject.toml` you can grow into later.

4. **Add Jupyter tooling inside the environment**:

    ```powershell
    uv pip install ipykernel jupyterlab
    ```

    `ipykernel` exposes the environment to notebooks. `jupyterlab` gives you the CLI tooling even if you work inside VS Code.

5. **Install the VS Code extensions**: "Python" and "Jupyter" by Microsoft.

6. **Select the environment**: `Ctrl+Shift+P` -> "Python: Select Interpreter" -> choose the `.venv` that uv created.

## Starting a Notebook in VS Code

- `Ctrl+Shift+P` -> "Jupyter: Create New Blank Notebook"
- Set the kernel to your `.venv` (top-right of the window)
- Name the notebook and save it into the project

You are now ready to run code cells, document your thinking, and version the notebook with Git.

## Notebook Anatomy

- **Code cells** run Python (or any supported language) and show the output directly beneath the cell.
- **Markdown cells** allow headings, bullet lists, equations, images, and explanations. Treat them like the engineering notes that make your math readable.

Common shortcuts (command mode in VS Code notebooks):

| Action | Shortcut |
| --- | --- |
| Run selected cell | `Shift+Enter` |
| Run cell, advance | `Ctrl+Enter` |
| Insert cell above | `A` |
| Insert cell below | `B` |
| Delete cell | `D D` (press `D` twice) |
| Change to code cell | `Y` |
| Change to markdown cell | `M` |
| Save notebook | `Ctrl+S` |

Markdown quick reference:

```markdown
# H1 heading
## H2 heading

**Bold text**
_Italic text_

- Bullet list item
1. Numbered item
```

## Code formatting:
- `inline code` wraps code snippets in single backticks
- Code blocks use triple backticks with language name:

```python
# Python code block
x = 42
print(f"Value: {x}")
```

## Magic Commands - I don't use these often but they can be handy

- `%matplotlib inline` - Renders Matplotlib plots inside the notebook.
- `%timeit expression` - Profiles a quick calculation.
- `%lsmagic` - Lists every available magic command.
- `%%capture` - Runs a cell but suppresses the output (handy when a library is noisy).

Remember the leading `%` is required. Two percent signs (`%%`) apply the magic to the entire cell.

## Exporting and Sharing

- **VS Code export**: `File -> Export` then choose HTML (most reliable). PDF export is hit-or-miss when charts are involved, trust me, I've lost hours trying to debug it. Stick with HTML and attach the file if you need to share.
- **GitHub** renders `.ipynb` files directly in the browser. Commit the notebook and share the link.
- **nbconvert** (optional):

    ```powershell
    jupyter nbconvert --to html your_notebook.ipynb
    ```

## Practice Routines

You can load the companion notebook at `examples/00-jupyter-notebooks-101.ipynb` if you want a head start.

1. **Warm-up notebook**
    - Create a new notebook.
    - Add a markdown cell with a heading and summary of the task.
    - Write a code cell that calculates tributary areas for a simple slab, then plot the loading diagram.

2. **Documentation drill**
    - Re-run the previous calculations but add commentary, section headings, and references to design clauses.

3. **Performance check**
    - Write a small function, then use `%timeit` to compare two different approaches.

## Troubleshooting Tips

- Kernel stuck on "Connecting"? Re-select the interpreter or restart VS Code.
- Library not found? Confirm you installed it with `uv pip install` inside the project directory.
- Notebook renders strangely on GitHub? Export to HTML and attach the file alongside the notebook.

## Additional Resources

- [Official Jupyter documentation](https://jupyter.org/documentation)
- [VS Code Jupyter docs](https://code.visualstudio.com/docs/datascience/jupyter-notebooks)
- [JupyterLab user guide](https://jupyterlab.readthedocs.io/en/stable/)
- [Matplotlib inline plotting guide](https://matplotlib.org/stable/users/explain/quick_start.html)

(c) Flocode, 2025
