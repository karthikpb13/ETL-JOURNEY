## ROWS vs RANGE

| Point | ROWS | RANGE |
|-------|------|-------|
| Window based on | Physical number of rows | Value of the ORDER BY column |
| Ties | Each row is handled separately | Tied rows share the same result |
| Missing dates or values | Ignored, it still counts n rows | Window is by value, so gaps shrink the window |
| ORDER BY columns allowed | Any number | Only **one** column when using `n PRECEDING` |
| Offset type | Number of rows | Number, or INTERVAL for dates |



1) Running sum (cumulative total)

SELECT emp_id,
       salary,
       SUM(salary) OVER (
           ORDER BY emp_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_sum
FROM employee;

2) Moving sum (last 3 rows including current)

SELECT emp_id,
       salary,
       SUM(salary) OVER (
           ORDER BY emp_id
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_sum_3
FROM employee;

3) Running sum per department

SELECT department,
       emp_id,
       salary,
       SUM(salary) OVER (
           PARTITION BY department
           ORDER BY emp_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS dept_running_sum
FROM employee;

4) Moving sum per department (current row and 1 before)

SELECT department,
       emp_id,
       salary,
       SUM(salary) OVER (
           PARTITION BY department
           ORDER BY emp_id
           ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
       ) AS dept_moving_sum_2
FROM employee;

5) Moving sum for the last 3 months (INTERVAL)

SELECT sale_date,
       amount,
       SUM(amount) OVER (
           ORDER BY sale_date
           RANGE BETWEEN INTERVAL '3' MONTH PRECEDING AND CURRENT ROW
       ) AS sum_last_3_months
FROM sales;

6)  Moving sum for the last 7 days

SELECT sale_date,
       amount,
       SUM(amount) OVER (
           ORDER BY sale_date
           RANGE BETWEEN 6 PRECEDING AND CURRENT ROW
       ) AS sum_last_7_days
FROM sales;