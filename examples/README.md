# Practice Notebooks

This folder contains hands-on exercises and engineering examples to practice the Python essentials covered in the course modules.

## Setup

Before running these notebooks, install the project dependencies:

```powershell
# Install uv (if not already installed)
Invoke-WebRequest -Uri https://astral.sh/uv/install.ps1 -OutFile install.ps1
powershell -ExecutionPolicy Bypass -File .\install.ps1

# Navigate to project root
cd flocode-python-essentials

# Sync dependencies
uv sync
```

## Notebooks

### [01-basic-syntax-exercises.ipynb](01-basic-syntax-exercises.ipynb)
**Module 05 Practice**

- Variables and data types
- Arithmetic operations
- Order of operations
- String formatting
- Material stress calculations

### [02-data-structures-practice.ipynb](02-data-structures-practice.ipynb)
**Module 06 Practice**

- Lists of beam data
- List comprehensions for filtering
- Dictionaries for beam properties
- Sets for material tracking
- Tuples for fixed records
- Load combination dictionaries

### [03-control-flow-drills.ipynb](03-control-flow-drills.ipynb)
**Module 07 Practice**

- Conditional beam checks
- For loops processing loads
- While loops for iterative design
- Break and continue logic
- Exception handling
- Nested loops for combinations

### [04-functions-workshop.ipynb](04-functions-workshop.ipynb)
**Module 08 Practice**

- Simple calculation functions
- Default parameters
- Returning multiple values
- Conditional logic in functions
- Processing lists with functions
- Lambda functions for transformations
- Modular program structure

### [engineering-calculations.ipynb](engineering-calculations.ipynb)
**Comprehensive Workshop**

Complete engineering workflows combining all Python essentials:

- Material database management
- Beam analysis library
- Section property calculations
- Batch processing with iteration
- Iterative design optimization
- Load combinations
- Data visualization with Matplotlib
- Full project analysis pipeline

This notebook demonstrates real-world patterns you'll use daily as an engineering Python developer.

## How to Use These Notebooks

1. **Work sequentially** - Start with 01 and progress through each notebook
2. **Type the code yourself** - Don't just read it; run it and modify it
3. **Break things** - Change values, remove lines, see what errors you get
4. **Add your own examples** - Extend each notebook with your own engineering problems
5. **Keep notes** - Add markdown cells documenting what you learned

## Running the Notebooks

### In VS Code

1. Open a notebook file
2. Select the kernel (top right): choose the `.venv` Python interpreter
3. Run cells with `Shift + Enter`

### In JupyterLab

```powershell
uv run jupyter lab
```

Navigate to the `examples/` folder and open any notebook.

## Getting Help

- Check the main course modules ([01-housekeeping.md](../01-housekeeping.md) through [08-functions.md](../08-functions.md))
- Review Python documentation: [https://docs.python.org/3/](https://docs.python.org/3/)
- Ask questions in the Flocode community

---

**Remember:** The best way to learn is to solve problems that matter to you. Use these notebooks as templates, then build your own engineering tools.

(c) Flocode, 2025
