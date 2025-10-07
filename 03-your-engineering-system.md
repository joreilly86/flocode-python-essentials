# 03 | Your Engineering System

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

Getting the tooling right is the difference between momentum and frustration. I learned that the hard way. If you've dabbled in Python before and hit setup walls, this is where we fix that. If you're itching to write code immediately, I respect that—follow the Lean Startup walkthrough first, then circle back here for the full setup.

This module lays out the environment that keeps my projects tidy and repeatable.

## My Everyday Stack

- **VS Code** for editing and notebooks.
- **uv** for Python installs, virtual environments, and dependency management.
- **Jupyter** for exploratory work and reporting.
- **Git + GitHub** for version control and sharing work.

Tweak the stack to suit your workflow, but keep the principles: isolate dependencies, automate setup, and document everything.

## Hit the Ground Running

If you want to start coding immediately, follow the [Lean Startup walkthrough](python-for-engineers-lean-startup.md) or watch the companion video: [Python for Engineers - Lean Startup](https://www.youtube.com/watch?v=kUAJ1WoGsFk). The script installs uv, spins up a project folder, and gets a notebook running without touching the system Python.

You can also explore the [Python Starter Kit repo](https://github.com/joreilly86/Python-Starter-Kit). It automatically installs and validates the core tooling before you write a single line of code.

## Cloud-Based Alternatives

Not ready to install locally? These free cloud platforms let you start immediately:

- **[Google Colab](https://colab.research.google.com/)** - Free notebooks with GPU access, saves to Google Drive
- **[Kaggle Notebooks](https://www.kaggle.com/code)** - Built-in datasets and community
- **[Marimo](https://marimo.io/)** - Modern reactive notebooks that auto-update
- **[Quarto](https://quarto.org/)** - Publish notebooks as websites, PDFs, or presentations

These are excellent for learning and sharing work without local setup.

## Interactive Prompt vs Scripts

There are two main ways to interact with Python:

- **Interactive prompt** - Great for testing ideas quickly. Launch Python and you will see the triple chevron `>>>` prompt ready for commands.

    ```python
    >>> print('Hello, World!')
    Hello, World!
    >>> 1 + 1
    2
    ```

    Handy, but nothing is saved. Once the session closes, the work is gone.

- **Scripts** - Save your code in a `.py` file so you can rerun it, share it, and version it with Git. Even the simplest script teaches you the workflow of running Python from a file.

- **Notebooks** - Combine code, output, and documentation in one file (`.ipynb`). Perfect for exploratory work and technical reports. See [04-jupyter-notebooks-101.md](04-jupyter-notebooks-101.md) for details.

## How Python Thinks About Programs

Python code is just operations performed on objects. Modules contain statements, statements contain expressions, and expressions create or transform objects. Keep that mental model close—it will help when we dissect logic in later modules.

## Keep Going

With your environment in place and a couple of test commands under your belt, you are ready for the deep dive into notebooks and syntax. Stay patient. Smooth environments turn into smooth projects.

(c) Flocode, 2025
