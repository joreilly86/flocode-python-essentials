# 06 | Data Structures

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

Python ships with a handful of core data structures. Learn these well and you can model almost any engineering problem without reaching for third-party libraries.

## Numbers (including booleans)

```python
span = 6            # int (metres)
load = 2.5          # float (kPa)
is_serviceable = True  # bool
```

Numbers behave like you expect. Booleans are simply `True` or `False`, and they slot neatly into comparisons and control flow.

## Strings

Strings store text. They are immutable, which means you create new strings when you transform them.

```python
material = "Concrete 40 MPa"
material.lower()      # 'concrete 40 mpa'
material.split()      # ['Concrete', '40', 'MPa']
material.replace("Concrete", "Steel")
```

Use strings for tags, filenames, report headings, or any other text you need to handle.

## Lists

Lists are ordered, mutable collections. Great for sequences of anything—numbers, strings, even other lists.

```python
beam_lengths = [5.2, 6.7, 4.8, 7.1]
beam_lengths.append(6.0)
beam_lengths.sort()

load_cases = [
    {"name": "Dead", "factor": 1.2},
    {"name": "Live", "factor": 1.5},
]
```

List comprehension packs iteration and conditional logic into a single line:

```python
squared_lengths = [length ** 2 for length in beam_lengths if length > 5]
```

## Tuples

Tuples look like lists but cannot be changed after creation. Use them when the data represents a fixed record.

```python
# (x, y, z) coordinates of a column base
column_base = (0.0, 0.0, 0.0)

# Material properties: (name, density, elastic_modulus)
steel_grade = ("Steel", 7850, 200e9)
```

Tuples keep their shape, which is handy when you want to guarantee that a set of values stays intact. (Full disclosure: I reach for lists 90% of the time, but tuples shine when immutability matters.)

## Sets

Sets store unique, unordered values. They shine when you need membership checks or mathematical set operations.

```python
materials_used = {"Concrete", "Steel", "Timber"}
materials_on_site = {"Steel", "Aluminum", "Concrete"}

new_orders = materials_on_site - materials_used   # {'Aluminum'}
common_materials = materials_used & materials_on_site  # {'Concrete', 'Steel'}
```

Convert a list to a set to remove duplicates quickly:

```python
unique_sections = set(["W310", "W360", "W310"])
```

## Dictionaries

Dictionaries map keys to values. They are the workhorse of most Python applications because you can describe rich objects without writing classes.

```python
beam = {
    "label": "B1",
    "material": "Steel",
    "length_m": 8.0,
    "section": "W360",
    "loads_kN": [45, 60, 30],
}

beam["material"]          # 'Steel'
beam.get("camber_mm", 0)   # Returns default when missing
beam.keys()                # dict_keys(['label', 'material', ...])
```

You can nest dictionaries, lists, and any other structures to model complex objects. Just keep things readable.

## Choosing the Right Structure

| Use this | When you need |
| --- | --- |
| Number (`int`, `float`, `bool`) | Calculations, flags, counters |
| `str` | Text, IDs, file paths |
| `list` | Ordered, changeable collection |
| `tuple` | Fixed-size record that should not change |
| `set` | Unique members and fast membership tests |
| `dict` | Named fields and structured data |

Spend time with these. Most engineering problems can be expressed as lists of dictionaries, dictionaries of lists, or combinations of the above.

(c) Flocode, 2025
