# 08 | Functions

**Modules:** [01](01-housekeeping.md) | [02](02-python-the-language.md) | [03](03-your-engineering-system.md) | [04](04-jupyter-notebooks-101.md) | [05](05-basic-syntax.md) | [06](06-data-structures.md) | [07](07-control-flow.md) | [08](08-functions.md)

---

Functions let you package logic, give it a name, and reuse it without copying code across the project. They are how you go from tinkering to building real tools.

## Anatomy of a Function

```python
def function_name(parameter_one, parameter_two):
    """Explain what the function does."""
    result = parameter_one + parameter_two
    return result
```

- `def` introduces the function.
- Parameters are placeholders for incoming values.
- `return` sends a value back to the caller. Without `return`, the function hands back `None`.

Calling the function:

```python
sum_total = function_name(4, 6)
```

## Parameters, Arguments, and Defaults

```python
def calculate_force(mass, acceleration=9.81):
    """Calculate force using F = m * a."""
    return mass * acceleration

force = calculate_force(12.0)           # Uses default acceleration (gravity)
unfactored = calculate_force(12.0, 3.0) # Overrides the default
```

Default values should be immutable types (numbers, strings, tuples). When you want optional lists or dictionaries, default to `None` and build the structure inside the function.

Keyword arguments improve readability:

```python
load = calculate_force(mass=15.5, acceleration=2.5)
```

## Returning Multiple Values

Python makes it painless to return more than one result.

```python
def min_max_avg(values):
    minimum = min(values)
    maximum = max(values)
    average = sum(values) / len(values)
    return minimum, maximum, average

mn, mx, avg = min_max_avg([4.2, 6.1, 5.4])
```

Technically you are returning a tuple. Unpack it into variables you can use immediately.

## Scope and Lifetime

Variables defined inside a function are local to that function.

```python
pi = 3.14159  # global constant

def circle_area(radius):
    area = pi * radius ** 2
    return area
```

Avoid mutating global state inside functions unless you have a compelling reason. Pass what you need in, return the result, and keep side effects predictable.

## Docstrings and Type Hints

Document your functions the moment you write them. Future-you will thank you.

```python
def beam_deflection(load: float, length: float, inertia: float, modulus: float) -> float:
    """Return mid-span deflection of a simply supported beam under central load."""
    return (load * length ** 3) / (48 * modulus * inertia)
```

Type hints do not enforce types at runtime, but they improve editor assistance and make your intent clear.

## Anonymous (Lambda) Functions

For short, throwaway logic, lambda functions are handy.

```python
measurements = [2.1, 3.5, 2.8, 4.2]
over_limit = list(filter(lambda x: x > 3.0, measurements))
```

Keep lambdas short. If the logic needs explanation, write a normal function with a name and docstring.

## Functions in the Real World

Break projects into well-named, single-purpose functions. Here is a quick pattern for a command-line utility:

```python
from pathlib import Path

def read_spreadsheet(path: Path) -> list[dict]:
    # load the file and return rows as dictionaries
    ...

def calculate_totals(rows: list[dict]) -> dict:
    ...

def main(path: Path) -> None:
    rows = read_spreadsheet(path)
    totals = calculate_totals(rows)
    print(totals)

if __name__ == "__main__":
    main(Path("loads.csv"))
```

Each function does one job. That makes testing easy and encourages reuse.

## Practice

1. Write a function that converts a list of kN/m line loads to factored ultimate loads.
2. Create a function that takes a list of beam dictionaries and returns the one with the highest utilisation ratio.
3. Add docstrings and type hints to both functions.

Functions are where clarity meets power. Start simple, name things well, and refactor often.

(c) Flocode, 2025
