# 07 | Control Flow

**Modules:** [01](01-housekeeping.md) | [02](02-python-the-language.md) | [03](03-your-engineering-system.md) | [04](04-jupyter-notebooks-101.md) | [05](05-basic-syntax.md) | [06](06-data-structures.md) | [07](07-control-flow.md) | [08](08-functions.md)

---

Control flow decides what runs, how often it runs, and what happens when things go wrong. Mastering these patterns turns isolated calculations into full programs.

## `if`, `elif`, `else`

```python
beam_length = 6.0  # metres
limit = 5.5

if beam_length > limit:
    print("Beam length OK")
elif beam_length == limit:
    print("Beam length right on the limit")
else:
    print("Shorter beam needed")
```

Nest conditions when you need more context, but keep the branching readable.

## `for` loops

Use `for` loops to iterate through collections.

```python
beam_lengths = [5.2, 6.7, 4.8, 7.1]
for length in beam_lengths:
    status = "OK" if length >= 5.5 else "Short"
    print(f"Beam {length:.1f} m → {status}")
```

`range()` gives you a simple sequence of numbers:

```python
for storey in range(1, 6):
    print(f"Checking storey {storey}")
```

Looping over dictionaries is equally straightforward:

```python
load_cases = {"Dead": 1.2, "Live": 1.5, "Wind": 1.0}
for case, factor in load_cases.items():
    print(f"{case} load factor → {factor}")
```

## `while` loops

Use a `while` loop when you do not know how many iterations you need ahead of time.

```python
iterations = 0
max_iterations = 10
converged = False

while not converged and iterations < max_iterations:
    iterations += 1
    # update converged flag based on your criteria
```

Always include an exit condition to avoid infinite loops.

## `break` and `continue`

- `break` exits the loop early.
- `continue` skips the rest of the current iteration.

```python
for reading in readings:
    if reading is None:
        continue
    if reading > limit:
        print("Limit exceeded")
        break
```

## Exception handling with `try / except`

Catch predictable failures and handle them gracefully.

```python
try:
    design_ratio = demand / capacity
except ZeroDivisionError:
    design_ratio = float("inf")
```

Add `else` for the success path and `finally` for cleanup work that must happen regardless of success.

```python
from pathlib import Path

path = Path("report.txt")

try:
    with path.open("r", encoding="utf-8") as fh:
        contents = fh.read()
except FileNotFoundError:
    print("Report file not found.")
else:
    print("Report loaded successfully.")
```

Using `with` ensures the file closes even if an exception occurs.

## Type conversion helpers

```python
int("42")          # 42
float("3.14")      # 3.14
str(9.81)          # '9.81'
bool("")           # False
```

Type conversion crops up constantly when you are parsing files, handling user input, or juggling data from multiple sources.

## Practical drill

1. Loop through a list of load combinations and print the governing one.
2. Write a `while` loop that iterates Steel Design Manual resistance factors until the change is < 1e-3.
3. Wrap file IO in `try/except` and log a friendly message when the file is missing.

Run these in a notebook and keep notes on what tripped you up. Control flow is simple on paper but the discipline comes from repetition.

(c) Flocode, 2025
