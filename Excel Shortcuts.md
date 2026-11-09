
# Excel Shortcuts and Formulas

## 1. Shortcuts

| Shortcut | Purpose |
|---|---|
| `ALT + D + O` | Data Entry |

## 2. Basic Formulas

| Formula | Shortcut / Syntax |
|---|---|
| SUM | `ALT + =` |
| AVERAGE | `ALT + H + U + A` |
| MAX | `ALT + H + U + M` |
| MIN | `ALT + H + U + I` |

### Counting Functions

| Function | Purpose |
|---|---|
| `COUNT()` | Counts cells containing numbers |
| `COUNTA()` | Counts non-empty cells |
| `COUNTBLANK()` | Counts blank cells |

## 3. Text Case Functions

| Function | Purpose | Example |
|---|---|---|
| UPPER | Converts text to uppercase | `=UPPER(A1)` |
| LOWER | Converts text to lowercase | `=LOWER(A1)` |
| PROPER | Capitalizes the first letter of each word | `=PROPER(A1)` |

## 4. Substring Functions

| Function | Purpose | Syntax |
|---|---|---|
| LEFT | Extracts characters from the left | `=LEFT(A1,3)` |
| RIGHT | Extracts characters from the right | `=RIGHT(A1,3)` |
| MID | Extracts characters from a specified position | `=MID(A1,2,4)` |

## 5. Text and Date Functions

### Extract Day from Date

```excel
=TEXT(A1,"DDDD")
```

Returns the full day name.

### Extract Month from Date

```excel
=TEXT(A1,"MMMM")
```

Returns the full month name.

### Add Months to a Date

```excel
=EDATE(A1,3)
```

Returns the date after adding 3 months.

## 6. Logical Formulas

### IF Function

```excel
=IF(A1>=33%,"PASS","FAIL")
```

- If the value is greater than or equal to 33%, returns `PASS`.
- Otherwise, returns `FAIL`.

### Conditional Functions

| Function | Purpose |
|---|---|
| `SUMIF()` | Adds values based on a condition |
| `AVERAGEIF()` | Calculates average based on a condition |
| `COUNTIF()` | Counts cells based on a condition |

## 7. Lookup Functions

- `VLOOKUP()`
- `XLOOKUP()`
