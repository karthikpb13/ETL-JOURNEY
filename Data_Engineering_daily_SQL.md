# Data Engineer SQL Interview Challenge — Practice Workbook

**Questions 1–20**

Each exercise is arranged as: question → source table(s) → space for your SQL answer. Expected outputs and hints have been omitted so you can solve each problem independently.

## 1. Combine Two Tables

**Question**
Write a SQL query to report the first name, last name, city, and state
of each person in the Person table.                                       10
Rules:
• If the address of a personId is not present in the Address table,
report null instead.                                                   12
• Return the result table in any order.

**Source table(s)**

```text
TABLE: PERSON                                                             1
personId                 lastName               firstName                 2
1                        Wang                   Allen
2                        Alice                  Bob
TABLE: ADDRESS
addressId        personId        city                   state
1                2               New York City          New York
2                3               Leetcode               California        7
```

**Your SQL answer**

```sql







```

---

## 2. Employees Earning More Than Their Managers

**Question**
7
Write an SQL query to find the employees who earn more than their
managers.
Rules:                                                               9
• managerId is the id of the employee's manager.
• Return the result table in any order.                            10

**Source table(s)**

```text
TABLE: EMPLOYEE
id       name               salary               managerId
1        Joe                70000                3
2        Henry              80000                4                   4
3        Sam                60000                Null
4        Max                90000                Null
```

**Your SQL answer**

```sql







```

---

## 3. Duplicate Emails

**Question**
Write an SQL query to report all the duplicate emails.
Rules:                                                          7
• Emails will only consist of lowercase letters.
• Return the result table in any order.                        8

**Source table(s)**

```text
TABLE: PERSON                                                  1
id                   email                                     2
1                    a@b.com
2                    c@d.com
3                    a@b.com                                   4
```

**Your SQL answer**

```sql







```

---

## 4. Customers Who Never Order

**Question**
10
Write an SQL query to report all customers who never order
anything.
Rules:                                                       12
• Return the result table in any order.

**Source table(s)**

```text
TABLE: CUSTOMERS                                             1
id                        name                               2
1                         Joe
2                         Henry
3                         Sam                                4
4                         Max
TABLE: ORDERS                                                6
id               customerId                                  7
1                3
2                1
```

**Your SQL answer**

```sql







```

---

## 5. Big Countries

**Question**
A country is big if it has an area of at least 3 million km2, or a
population of at least 25 million. Write an SQL query to report the    7
name, population, and area of the big countries.
Rules:
• Return the result table in any order.                               9

**Source table(s)**

```text
TABLE: WORLD                                                          1
name             continent      area      population    gdp           2
Afghanistan      Asia           652230    25500100      20343000
Albania          Europe         28748     2831741       12960000
Algeria          Africa         2381741   37100000      188681000     4
```

**Your SQL answer**

```sql







```

---

## 6. Department Highest Salary

**Question**
Write an SQL query to find employees who have the highest salary
in each of the departments.                                            12
Rules:                                                                 13
• If multiple employees have the same highest salary, return all of
them.                                                               14
• Do not use LIMIT.

**Source table(s)**

```text
TABLE: EMPLOYEE                                                        1
id      name           salary            departmentId                  2
1       Joe            70000             1
2       Jim            90000             1
3       Henry          80000             2                             4
4       Sam            60000             2
5       Max            90000             1
TABLE: DEPARTMENT                                                      7
id                       name
1                        IT
2                        Sales                                         9
```

**Your SQL answer**

```sql







```

---

## 7. Second Highest Salary

**Question**
Write an SQL query to report the second highest salary from the
Employee table.                                                           7
Rules:
• If there is no second highest salary, the query should report null.

**Source table(s)**

```text
TABLE: EMPLOYEE                                                          1
id                     salary                                            2
1                      100
2                      200
3                      300                                               4
```

**Your SQL answer**

```sql







```

---

## 8. Nth Highest Salary

**Question**
Write an SQL query to report the nth highest salary from the
Employee table.                                                        7
Rules:
• If there is no nth highest salary, the query should report null.
• N is passed as a parameter to the function/procedure.               9

**Source table(s)**

```text
TABLE: EMPLOYEE                                                       1
id                      salary                                        2
1                       100
2                       200
3                       300                                           4
```

**Your SQL answer**

```sql







```

---

## 9. Rank Scores

**Question**
Write an SQL query to rank the scores. The ranking should be
calculated according to the following rules:                              9
Rules:                                                                   10
• The scores should be ranked from the highest to the lowest.
• If there is a tie between two scores, both should have the same       11
ranking.
• After a tie, the next ranking number should be the next consecutive   12
integer value.

**Source table(s)**

```text
TABLE: SCORES                                                            1
id                         score                                         2
1                          3.5
2                          3.65
3                          4.0                                           4
4                          3.85
5                          4.0
6                          3.65                                          6
```

**Your SQL answer**

```sql







```

---

## 10. Classes With at Least 5 Students

**Question**
Write an SQL query to report all the classes that have at least five
students.                                                              11
Rules:                                                                 12
• Return the result table in any order.

**Source table(s)**

```text
TABLE: COURSES                                                         1
student                            class                               2
A                                  Math
B                                  English
C                                  Math                                4
D                                  Biology
E                                  Math
F                                  Computer                            6
G                                  Math                                7
H                                  Math
I                                  Math
```

**Your SQL answer**

```sql







```

---

## 11. Customer Placing Largest Number of

**Question**
7
Write an SQL query to find the customer_number for the customer
who has placed the largest number of orders.
Rules:                                                                 9
• It is guaranteed that exactly one customer will have placed more
orders than any other customer.                                    10

**Source table(s)**

```text
Orders
TABLE: ORDERS
order_number                     customer_number
1                                1
2                                2                                     4
3                                3
4                                3
```

**Your SQL answer**

```sql







```

---

## 12. Department Top Three Salaries

**Question**
12
A company's executives are interested in seeing who earns the most    13
money in each of the company's departments. A high earner in a
department is an employee who has a salary in the top three unique    14
salaries for that department.                                         15
Rules:
• Write an SQL query to find the employees who are high earners in   16
each of the departments.

**Source table(s)**

```text
TABLE: EMPLOYEE                                                       1
id      name           salary            departmentId                  2
1       Joe            85000             1
2       Henry          80000             2
3       Sam            60000             2                             4
4       Max            90000             1
5       Janet          69000             1
6       Randy          85000             1                             6
7       Will           70000             1                             7
TABLE: DEPARTMENT                                                     8
id                       name                                          9
1                        IT                                           10
2                        Sales
```

**Your SQL answer**

```sql







```

---

## 13. Game Play Analysis I

**Question**
7
Write an SQL query to report the first login date for each player.
Rules:
• Return the result table in any order.                              9

**Source table(s)**

```text
TABLE: ACTIVITY                                                      1
player_id        device_id        event_date      games_played       2
1                2                2016-03-01      5
1                2                2016-05-02      6
2                3                2017-06-25      1                  4
3                1                2016-03-02      0
3                4                2018-07-03      5
```

**Your SQL answer**

```sql







```

---

## 14. Game Play Analysis II

**Question**
7
Write an SQL query to report the device that is first logged in for
each player.
Rules:                                                                 9
• Return the result table in any order.

**Source table(s)**

```text
TABLE: ACTIVITY                                                       1
player_id        device_id        event_date        games_played      2
1                2                2016-03-01        5
1                2                2016-05-02        6
2                3                2017-06-25        1                 4
3                1                2016-03-02        0
3                4                2018-07-03        5
```

**Your SQL answer**

```sql







```

---

## 15. Product Sales Analysis I

**Question**
10
Write an SQL query that reports the product_name, year, and price
for each sale_id in the Sales table.
Rules:                                                                  12
• Return the resulting table in any order.

**Source table(s)**

```text
TABLE: SALES                                                            1
sale_id        product_id           year        quantity       price    2
1              100                  2008        10             5000
2              100                  2009        12             5000
7              200                  2011        15             9000     4
TABLE: PRODUCT
product_id                        product_name
100                               Nokia                                 7
200                               Apple
300                               Samsung
```

**Your SQL answer**

```sql







```

---

## 16. Product Sales Analysis II

**Question**
10
Write an SQL query that reports the total quantity sold for every
product id.
Rules:                                                              12
• Return the resulting table in any order.

**Source table(s)**

```text
TABLE: SALES                                                        1
sale_id        product_id            year    quantity      price    2
1              100                   2008    10            5000
2              100                   2009    12            5000
7              200                   2011    15            9000     4
TABLE: PRODUCT
product_id                        product_name
100                               Nokia                             7
200                               Apple
300                               Samsung
```

**Your SQL answer**

```sql







```

---

## 17. Sales Analysis I

**Question**
Write an SQL query that reports the best seller by total sales price.
Rules:                                                                    12
• If there is a tie, report them all.                                    13

**Source table(s)**

```text
TABLE: PRODUCT                                                            1
product_id               product_name               unit_price            2
1                        S8                         1000
2                        G4                         800
3                        iPhone                     1400                  4
TABLE: SALES
seller_id product_id buyer_id insert_date quantity price
1              1               1          2019-01-21       2      2000    7
1              2               2          2019-02-17       1      800
2              2               3          2019-06-02       1      800
3              3               4          2019-05-13       2      2800    9
```

**Your SQL answer**

```sql







```

---

## 18. Not Boring Movies

**Question**
7
Write an SQL query to report the movies with an odd-numbered ID
and a description that is not "boring".
Rules:                                                               9
• Return the result table ordered by rating in descending order.

**Source table(s)**

```text
TABLE: CINEMA                                                       1
id     movie                   description               rating     2
1      War                     great 3D                  8.9
2      Science                 fiction                   8.5
3      irish                   boring                    6.2        4
4      Ice song                Fantacy                   8.6
5      House card              Interesting               9.1
```

**Your SQL answer**

```sql







```

---

## 19. Total Sales Amount by Year

**Question**
10
Write an SQL query to report the total sales amount of each item for
each year, with corresponding product_name, report_year, and
total_amount.                                                                12
Rules:                                                                       13
• Return the result table ordered by product_id and report_year.
• Dates are within 2018 to 2020.                                            14

**Source table(s)**

```text
TABLE: PRODUCT                                                               1
product_id                        product_name                               2
1                                 LC Phone
2                                 LC T-Shirt
3                                 LC Keychain                                4
TABLE: SALES
product_id period_start period_end average_daily_sales
1              2019-01-25       2019-02-28 100                               7
2              2018-12-01       2020-01-01 10
3              2019-12-01       2020-01-31 1
```

**Your SQL answer**

```sql







```

---

## 20. Average Selling Price

**Question**
Write an SQL query to find the average selling price for each          12
product.                                                               13
Rules:
• average_price should be rounded to 2 decimal places.                14
• Return the result table in any order.

**Source table(s)**

```text
TABLE: PRICES                                                          1
product_id          start_date         end_date                price    2
1                   2019-02-17         2019-02-28              5
1                   2019-03-01         2019-03-22              20
2                   2019-02-01         2019-02-20              15       4
2                   2019-02-21         2019-03-31              30
TABLE: UNITSSOLD                                                       6
product_id               purchase_date                    units         7
1                        2019-02-25                       100
1                        2019-03-01                       15
2                        2019-02-10                       200           9
2                        2019-03-22                       30           10
```

**Your SQL answer**

```sql







```

---
