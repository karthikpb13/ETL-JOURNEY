# ROWS vs RANGE

  -----------------------------------------------------------------------
  Point                    ROWS                  RANGE
  ------------------------ --------------------- ------------------------
  Window based on          Physical number of    Value of the `ORDER BY`
                           rows                  column

  Ties                     Each row is handled   Tied rows can share the
                           separately            same frame and result

  Missing dates or values  Ignored; it still     The frame is based on
                           counts a specified    values, so gaps can mean
                           number of rows        fewer rows fall inside
                                                 the window

  `ORDER BY` columns       Any number of columns Offset-based `RANGE`
  allowed                                        frames generally require
                                                 a single `ORDER BY`
                                                 expression

  Offset type              Number of rows        Numeric value, or an
                                                 `INTERVAL` for date/time
                                                 values where supported
  -----------------------------------------------------------------------

## 1. Running sum (cumulative total)

``` sql
SELECT emp_id,
       salary,
       SUM(salary) OVER (
           ORDER BY emp_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_sum
FROM employee;
```

## 2. Moving sum (last 3 rows including current)

``` sql
SELECT emp_id,
       salary,
       SUM(salary) OVER (
           ORDER BY emp_id
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_sum_3
FROM employee;
```

## 3. Running sum per department

``` sql
SELECT department,
       emp_id,
       salary,
       SUM(salary) OVER (
           PARTITION BY department
           ORDER BY emp_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS dept_running_sum
FROM employee;
```

## 4. Moving sum per department (current row and 1 preceding row)

``` sql
SELECT department,
       emp_id,
       salary,
       SUM(salary) OVER (
           PARTITION BY department
           ORDER BY emp_id
           ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
       ) AS dept_moving_sum_2
FROM employee;
```

## 5. Moving sum for the last 3 months (`INTERVAL`)

``` sql
SELECT sale_date,
       amount,
       SUM(amount) OVER (
           ORDER BY sale_date
           RANGE BETWEEN INTERVAL '3' MONTH PRECEDING AND CURRENT ROW
       ) AS sum_last_3_months
FROM sales;
```

## 6. Moving sum for the last 7 days

For databases that support an interval offset for date-based `RANGE`
frames, use an interval expression. For example, in Oracle:

``` sql
SELECT sale_date,
       amount,
       SUM(amount) OVER (
           ORDER BY sale_date
           RANGE BETWEEN INTERVAL '6' DAY PRECEDING AND CURRENT ROW
       ) AS sum_last_7_days
FROM sales;
```

**Note:** A `RANGE` frame is value-based, not row-count-based. For date
windows, use the appropriate date interval syntax supported by your
database. `INTERVAL '6' DAY PRECEDING` covers the current date/time
value and the preceding six days; it does not guarantee seven rows.
