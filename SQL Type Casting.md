# Conversion Functions in Databricks, Oracle and MySQL

## Databricks

| Function | Purpose and Example |
|----------|---------------------|
| `CAST()` | Converts a value to another data type<br>`CAST('123' AS INT)` |
| `TRY_CAST()` | Converts a value; returns NULL if it fails<br>`TRY_CAST('abc' AS INT)` |
| `TO_DATE()` | Converts a value to a date, optionally using a format<br>`TO_DATE('31/12/2024', 'dd/MM/yyyy')` |
| `TO_TIMESTAMP()` | Converts a value to a timestamp<br>`TO_TIMESTAMP('2024-12-31 10:30:00')` |
| `TRY_TO_TIMESTAMP()` | Converts to a timestamp; returns NULL if it fails<br>`TRY_TO_TIMESTAMP('invalid')` |
| `TO_NUMBER()` | Converts formatted numeric text to a number<br>`TO_NUMBER('$1,250.50', '$9,999.99')` |
| `TRY_TO_NUMBER()` | Converts formatted numeric text; returns NULL if it fails<br>`TRY_TO_NUMBER('$abc', '$999')` |

## Oracle

| Function | Purpose and Example |
|----------|---------------------|
| `CAST()` | Converts a value to another data type<br>`CAST('123' AS NUMBER)` |
| `TO_NUMBER()` | Converts a string to a number<br>`TO_NUMBER('123.45')` |
| `TO_CHAR()` | Converts a number or date to text<br>`TO_CHAR(SYSDATE, 'YYYY-MM-DD')` |
| `TO_DATE()` | Converts a string to a date using a format<br>`TO_DATE('31/12/2024', 'DD/MM/YYYY')` |
| `TO_TIMESTAMP()` | Converts a string to a timestamp<br>`TO_TIMESTAMP('31/12/2024 10:30:00', 'DD/MM/YYYY HH24:MI:SS')` |
| `TO_TIMESTAMP_TZ()` | Converts a string to a timestamp with time zone<br>`TO_TIMESTAMP_TZ('31/12/2024 10:30:00 +05:30', 'DD/MM/YYYY HH24:MI:SS TZH:TZM')` |
| `VALIDATE_CONVERSION()` | Checks if a value can be converted; returns `1` if valid, `0` if invalid<br>`VALIDATE_CONVERSION('123' AS NUMBER)` |
| `DEFAULT NULL ON CONVERSION ERROR` | Returns `NULL` instead of raising an error (Oracle 12.2+)<br>`TO_NUMBER('abc' DEFAULT NULL ON CONVERSION ERROR)` |

## MySQL

| Function | Purpose and Example |
|----------|---------------------|
| `CAST()` | Converts a value to another data type<br>`CAST('123' AS SIGNED)` |
| `CONVERT()` | Converts a value to another data type<br>`CONVERT('123', SIGNED)` |
| `DATE()` | Extracts the date part from a datetime value<br>`DATE('2024-12-31 10:30:00')` |
| `STR_TO_DATE()` | Converts a string to a date or datetime using a format<br>`STR_TO_DATE('31/12/2024', '%d/%m/%Y')` |
| `DATE_FORMAT()` | Formats a date or datetime as text<br>`DATE_FORMAT(NOW(), '%Y-%m-%d')` |
| `TIME_FORMAT()` | Formats a time value as text<br>`TIME_FORMAT('14:30:00', '%h:%i %p')` |
| `UNIX_TIMESTAMP()` | Converts a date or datetime to Unix timestamp seconds<br>`UNIX_TIMESTAMP('2024-12-31 10:30:00')` |
| `FROM_UNIXTIME()` | Converts Unix timestamp seconds to a datetime or formatted text<br>`FROM_UNIXTIME(1735641000)` |


