# Data Engineer SQL Interview Challenge — Practice Workbook

**Questions 1–20**

Each exercise is arranged as: question → source table(s) → space for your SQL answer. Expected outputs and hints have been omitted so you can solve each problem independently.

## 1. Combine Two Tables

**Question**
Write a SQL query to report the first name, last name, city, and state
of each person in the Person table.                                       
Rules:
• If the address of a personId is not present in the Address table,
report null instead.                                                   
• Return the result table in any order.

**Source table(s)**

```text
TABLE: PERSON                                                            
personId                 lastName               firstName                 
1                        Wang                   Allen
2                        Alice                  Bob
TABLE: ADDRESS
addressId        personId        city                   state
1                2               New York City          New York
2                3               Leetcode               California        
```

**Your SQL answer**

```sql
SELECT P.FIRSTANAME, P.LASTNAME, A.CITY, A.STATE
FROM PERSON P LEFT JOIN ADDRESS A
ON P.PERSPONID=A.PERSONID
```

---

## 2. Employees Earning More Than Their Managers

**Question**
Write an SQL query to find the employees who earn more than their
managers.
Rules:                                                               
• managerId is the id of the employee's manager.
• Return the result table in any order.                            

**Source table(s)**

```text
TABLE: EMPLOYEE
id       name               salary               managerId
1        Joe                70000                3
2        Henry              80000                4                   
3        Sam                60000                Null
4        Max                90000                Null
```

**Your SQL answer**

```sql

SELECT E.NAME AS EMP_NAME, E.SALARY AS EMP_SAL
       M.NAME AS MGR_NAME, M.SALARY AS MGR_SAL
FROM EMPLOYEE E JOIN EMPLOYEE M
ON E.MANAGERID=M.ID
WHERE E.SALARY> M.SALARY;

```

---

## 3. Duplicate Emails

**Question**
Write an SQL query to report all the duplicate emails.
Rules:                                                          
• Emails will only consist of lowercase letters.
• Return the result table in any order.                        

**Source table(s)**

```text
TABLE: PERSON                                                  
id                   email                                     
1                    a@b.com
2                    c@d.com
3                    a@b.com                                   
```

**Your SQL answer**

```sql

SELECT EMAIL,COUNT(EMAIL)
FROM PERSON
GROUP BY EMAIL
HAVING COUNT(EMAIL)>1;
```

---

## 4. Customers Who Never Order

**Question**
Write an SQL query to report all customers who never order
anything.
Rules:                                                       
• Return the result table in any order.

**Source table(s)**

```text
TABLE: CUSTOMERS                                             
id                        name                               
1                         Joe
2                         Henry
3                         Sam                                
4                         Max
TABLE: ORDERS                                               
id               customerId                                  
1                3
2                1
```

**Your SQL answer**

```sql
SELECT ID, NAME 
FROM CUSTOMERS
WHERE ID NOT IN (SELECT DISTINCT ID FROM ORDERS);


SELECT C.ID, C.NAME
FROM CUSTOMERS C LEFT JOIN ORDERS O
ON C.ID=O.ID
WHERE O.ID IS NULL;
```

---

## 5. Big Countries

**Question**
A country is big if it has an area of at least 3 million km2, or a
population of at least 25 million. Write an SQL query to report the    
name, population, and area of the big countries.
Rules:
• Return the result table in any order.                               

**Source table(s)**

```text
TABLE: WORLD                                                         
name             continent      area      population    gdp           
Afghanistan      Asia           652230    25500100      20343000
Albania          Europe         28748     2831741       12960000
Algeria          Africa         2381741   37100000      188681000     
```

**Your SQL answer**

```sql
SELECT NAME, POPULATION, AREA
FROM WORLD
WHERE AREA>=3000000 OR POPULATION > = 25000000;

```

---

## 6. Department Highest Salary

**Question**
Write an SQL query to find employees who have the highest salary
in each of the departments.                                            
Rules:                                                                 
• If multiple employees have the same highest salary, return all of them.                                                               
• Do not use LIMIT.

**Source table(s)**

```text
TABLE: EMPLOYEE                                                        
id      name           salary            departmentId                  
1       Joe            70000             1
2       Jim            90000             1
3       Henry          80000             2                             
4       Sam            60000             2
5       Max            90000             1
TABLE: DEPARTMENT                                                      
id                       name
1                        IT
2                        Sales                                         
```

**Your SQL answer**

```sql
SELECT ID, NAME, SALARY, DEPARTMENTID
FROM
(
    SELECT ID, NAME, SALARY, DEPARTMENTID, 
        DENSE_RANK()OVER(PARTITION BY DEPARTMENTID ORDER BY SALARY DESC) AS RNK
    FROM EMPLOYEE
)
WHERE RNK =1 ;
```

---

## 7. Second Highest Salary

**Question**
Write an SQL query to report the second highest salary from the
Employee table.                                                           
Rules:
• If there is no second highest salary, the query should report null.

**Source table(s)**

```text
TABLE: EMPLOYEE                                                          
id                     salary                                            
1                      100
2                      200
3                      300                                               
```

**Your SQL answer**

```sql
SELECT MAX(SALARY)
FROM EMPLOYEE
WHERE SALARY<(SELECT MAX(SALARY) FROM EMPLOYEE);

SELECT ID,SALARY
FROM EMPLOYEE
ORDER BY SALARY  DESC
LIMIT 1 OFFSET 2;

SELECT ID, SALARY
FROM 
(
SELECT ID, SALARY, DENSE_RANK()OVER (ORDER BY SALARY DESC) RN
FROM EMPLOYEE
)
WHERE RN = 2;
```

---

## 8. Nth Highest Salary

**Question**
Write an SQL query to report the nth highest salary from the
Employee table.                                                        
Rules:
• If there is no nth highest salary, the query should report null.
• N is passed as a parameter to the function/procedure.               

**Source table(s)**

```text
TABLE: EMPLOYEE                                                       
id                      salary                                        
1                       100
2                       200
3                       300                                           
```

**Your SQL answer**

```sql







```

---

## 9. Rank Scores

**Question**
Write an SQL query to rank the scores. The ranking should be
calculated according to the following rules:                              
Rules:                                                                   
• The scores should be ranked from the highest to the lowest.
• If there is a tie between two scores, both should have the same       
ranking.
• After a tie, the next ranking number should be the next consecutive   
integer value.

**Source table(s)**

```text
TABLE: SCORES                                                            
id                         score                                         
1                          3.5
2                          3.65
3                          4.0                                           
4                          3.85
5                          4.0
6                          3.65                                          
```

**Your SQL answer**

```sql

select dense_rank() over(order by score desc) as rnk, s.*
from scores;

```

---

## 10. Classes With at Least 5 Students

**Question**
Write an SQL query to report all the classes that have at least five
students.                                                              
Rules:                                                                 
• Return the result table in any order.

**Source table(s)**

```text
TABLE: COURSES                                                         
student                            class                               
A                                  Math
B                                  English
C                                  Math                                
D                                  Biology
E                                  Math
F                                  Computer                            
G                                  Math                                
H                                  Math
I                                  Math
```

**Your SQL answer**

```sql

SELECT CLASS, COUNT(STUDENT)
FROM COURSES
GROUP BY CLASS
HAVING COUNT(STUDENT) >= 5;

```

---

## 11. Customer Placing Largest Number of

**Question**
7
Write an SQL query to find the customer_number for the customer
who has placed the largest number of orders.
Rules:                                                                 
• It is guaranteed that exactly one customer will have placed more
orders than any other customer.                                    

**Source table(s)**

```text
Orders
TABLE: ORDERS
order_number                     customer_number
1                                1
2                                2                                     
3                                3
4                                3
```

**Your SQL answer**

```sql

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;

```

---

## 12. Department Top Three Salaries

**Question**
A company's executives are interested in seeing who earns the most    
money in each of the company's departments. A high earner in a
department is an employee who has a salary in the top three unique    
salaries for that department.                                         
Rules:
• Write an SQL query to find the employees who are high earners in   
each of the departments.

**Source table(s)**

```text
TABLE: EMPLOYEE                                                       
id      name           salary            departmentId                  
1       Joe            85000             1
2       Henry          80000             2
3       Sam            60000             2                             
4       Max            90000             1
5       Janet          69000             1
6       Randy          85000             1                             
7       Will           70000             1                             
TABLE: DEPARTMENT                                                     
id                       name                                          
1                        IT                                           
2                        Sales
```

**Your SQL answer**

```sql
SELECT RNK,DNAME,EMP_ID,EMP_NAME,SALARY
FROM 
(
SELECT D.NAME AS DNAME, E.ID AS EMP_ID, E.NAME AS EMP_NAME, E.SALARY
       DENSE_RANK() OVER (PARTTION BY D.NAME ORDER BY SALARY DESC) AS RNK
FROM EMPLOYEE E JOIN DEPARTMENT D
ON D.ID= E.DEPARTMENTID
)
WHERE RNK <=3;
```

---

## 13. Game Play Analysis I

**Question**
Write an SQL query to report the first login date for each player.
Rules:
• Return the result table in any order.                              

**Source table(s)**

```text
TABLE: ACTIVITY                                                      
player_id        device_id        event_date      games_played       
1                2                2016-03-01      5
1                2                2016-05-02      6
2                3                2017-06-25      1                  
3                1                2016-03-02      0
3                4                2018-07-03      5
```

**Your SQL answer**

```sql

SELECT PLAYER_ID, MIN(EVENT_DATE) AS FIRST_LOGIN
FROM ACTIVITY
GROUP BY PLAYER_ID;

```

---

## 14. Game Play Analysis II

**Question**
Write an SQL query to report the device that is first logged in for
each player.
Rules:                                                                 
• Return the result table in any order.

**Source table(s)**

```text
TABLE: ACTIVITY                                                       
player_id        device_id        event_date        games_played      
1                2                2016-03-01        5
1                2                2016-05-02        6
2                3                2017-06-25        1                 
3                1                2016-03-02        0
3                4                2018-07-03        5
```

**Your SQL answer**

```sql

SELECT A1.PLAYER_ID, A1.DEVICE_ID
FROM ACTIVITY A1
WHERE A1.EVENT_DATE =(SELECT MIN(A2.EVENT_DATE)
                    FROM ACTIVITY A2
                    WHERE A1.PLAYER_ID=A2.PLAYER_ID);


SELECT
    A.PLAYER_ID,
    A.DEVICE_ID
FROM ACTIVITY A
JOIN (
    SELECT
        PLAYER_ID,
        MIN(EVENT_DATE) AS FIRST_DATE
    FROM ACTIVITY
    GROUP BY PLAYER_ID
) F
ON A.PLAYER_ID = F.PLAYER_ID
AND A.EVENT_DATE = F.FIRST_DATE;

```

---

## 15. Product Sales Analysis I

**Question**
Write an SQL query that reports the product_name, year, and price
for each sale_id in the Sales table.
Rules:                                                                  
• Return the resulting table in any order.

**Source table(s)**

```text
TABLE: SALES                                                            
sale_id        product_id           year        quantity       price    
1              100                  2008        10             5000
2              100                  2009        12             5000
7              200                  2011        15             9000     
TABLE: PRODUCT
product_id                        product_name
100                               Nokia                                 
200                               Apple
300                               Samsung
```

**Your SQL answer**

```sql
SELECT P.PRODUCT_NAME, S.YEAR, S.PRICE
FROM PRODUCT P JOIN SALES S
ON P.PRODUCT_ID=S.PRODUCT_ID;

```

---

## 16. Product Sales Analysis II

**Question**
Write an SQL query that reports the total quantity sold for every
product id.
Rules:                                                              
• Return the resulting table in any order.

**Source table(s)**

```text
TABLE: SALES                                                        
sale_id        product_id            year    quantity      price    
1              100                   2008    10            5000
2              100                   2009    12            5000
7              200                   2011    15            9000     
TABLE: PRODUCT
product_id                        product_name
100                               Nokia                             
200                               Apple
300                               Samsung
```

**Your SQL answer**

```sql
SELECT P.PRODUCT_ID, P.PRODUCT_NAME, SUM(S.QUANTITY) AS TOT_QTY
FROM PRODUCT P JOIN SALES S
ON P.PRODUCT_ID=S.PRODUCT_ID
GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME;
```

---

## 17. Sales Analysis I

**Question**
Write an SQL query that reports the best seller by total sales price.
Rules:                                                                    
• If there is a tie, report them all.                                    

**Source table(s)**

```text
TABLE: PRODUCT                                                            
product_id               product_name               unit_price            
1                        S8                         1000
2                        G4                         800
3                        iPhone                     1400                  
TABLE: SALES
seller_id  product_id      buyer_id      insert_date   quantity   price
1              1               1          2019-01-21       2      2000    
1              2               2          2019-02-17       1      800
2              2               3          2019-06-02       1      800
3              3               4          2019-05-13       2      2800    
```

**Your SQL answer**

```sql

WITH SELLER_TOTALS AS (
    SELECT
        SELLER_ID,
        SUM(PRICE) AS TOTAL_SALES
    FROM SALES
    GROUP BY SELLER_ID
)
SELECT SELLER_ID
FROM SELLER_TOTALS
WHERE TOTAL_SALES = (
    SELECT MAX(TOTAL_SALES)
    FROM SELLER_TOTALS
);

```

---

## 18. Not Boring Movies

**Question**
7
Write an SQL query to report the movies with an odd-numbered ID
and a description that is not "boring".
Rules:                                                              
• Return the result table ordered by rating in descending order.

**Source table(s)**

```text
TABLE: CINEMA                                                       
id     movie                   description               rating     
1      War                     great 3D                  8.9
2      Science                 fiction                   8.5
3      irish                   boring                    6.2        
4      Ice song                Fantacy                   8.6
5      House card              Interesting               9.1
```

**Your SQL answer**

```sql

SELECT MOVIE
FROM CINEMA
WHERE MOD(ID,2)=1 AND DESCRIPTION<>'boring'
ORDER BY RATING DESC;
```

---

## 19. Total Sales Amount by Year

**Question**
Write an SQL query to report the total sales amount of each item for
each year, with corresponding product_name, report_year, and
total_amount.                                                                
Rules:                                                                       
• Return the result table ordered by product_id and report_year.
• Dates are within 2018 to 2020.                                            

**Source table(s)**

```text
TABLE: PRODUCT                                                               
product_id                        product_name                               
1                                 LC Phone
2                                 LC T-Shirt
3                                 LC Keychain                                
TABLE: SALES
product_id    period_start      period_end    average_daily_sales
1              2019-01-25       2019-02-28      100                               
2              2018-12-01       2020-01-01      10
3              2019-12-01       2020-01-31      1
```

**Your SQL answer**

```sql

WITH YEARS AS (
    SELECT 2018 + LEVEL - 1 AS REPORT_YEAR
    FROM DUAL
    CONNECT BY LEVEL <= 3
),
YEARLY_SALES AS (
    SELECT
        S.PRODUCT_ID,
        Y.REPORT_YEAR,
        S.AVERAGE_DAILY_SALES,
        GREATEST(
            S.PERIOD_START,
            TO_DATE(Y.REPORT_YEAR || '-01-01', 'YYYY-MM-DD')
        ) AS START_DATE,
        LEAST(
            S.PERIOD_END,
            ADD_MONTHS(
                TO_DATE(Y.REPORT_YEAR || '-01-01', 'YYYY-MM-DD'),
                12
            ) - 1
        ) AS END_DATE
    FROM SALES S
    CROSS JOIN YEARS Y
    WHERE EXTRACT(YEAR FROM S.PERIOD_START) <= Y.REPORT_YEAR
      AND EXTRACT(YEAR FROM S.PERIOD_END) >= Y.REPORT_YEAR
)
SELECT
    P.PRODUCT_ID,
    P.PRODUCT_NAME,
    Y.REPORT_YEAR,
    (Y.END_DATE - Y.START_DATE + 1)
        * Y.AVERAGE_DAILY_SALES AS TOTAL_AMOUNT
FROM YEARLY_SALES Y
JOIN PRODUCT P
    ON P.PRODUCT_ID = Y.PRODUCT_ID
ORDER BY
    P.PRODUCT_ID,
    Y.REPORT_YEAR;



```

---

## 20. Average Selling Price

**Question**
Write an SQL query to find the average selling price for each          
product.                                                               
Rules:
• average_price should be rounded to 2 decimal places.                
• Return the result table in any order.

**Source table(s)**

```text
TABLE: PRICES                                                          
product_id          start_date         end_date                price    
1                   2019-02-17         2019-02-28              5
1                   2019-03-01         2019-03-22              20
2                   2019-02-01         2019-02-20              15       
2                   2019-02-21         2019-03-31              30
TABLE: UNITSSOLD                                                       
product_id               purchase_date                    units         
1                        2019-02-25                       100
1                        2019-03-01                       15
2                        2019-02-10                       200           
2                        2019-03-22                       30           
```

**Your SQL answer**

```sql

SELECT
    P.PRODUCT_ID,
    ROUND(SUM(U.UNITS * P.PRICE) / SUM(U.UNITS), 2) AS AVERAGE_PRICE
FROM PRICES P
JOIN UNITSSOLD U
    ON P.PRODUCT_ID = U.PRODUCT_ID
WHERE U.PURCHASE_DATE BETWEEN P.START_DATE AND P.END_DATE
GROUP BY P.PRODUCT_ID;





```

---

# DATA ENGINEER SQL INTERVIEW CHALLENGE — QUESTIONS 21–40
**## 21. Rising Temperature**

**Question**
Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: WEATHER
id       recordDate    temperature
1        2015-01-01    10
2        2015-01-02    25
3        2015-01-03    20
4        2015-01-04    30
```

**Your SQL answer**

```sql




```

---

**## 22. Game Play Analysis III**

**Question**
Write an SQL query to report for each player and date, how many games played so far by the player. That is, the total number of games played by the player until that date.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: ACTIVITY
player_id    device_id    event_date    games_played
1            2            2016-03-01    5
1            2            2016-05-02    6
1            3            2017-06-25    1
3            1            2016-03-02    0
```

**Your SQL answer**

```sql




```

---

**## 23. Game Play Analysis IV**

**Question**
Write an SQL query to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places.

Rules:
- You need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

**Source table(s)**

```text
TABLE: ACTIVITY
player_id    device_id    event_date    games_played
1            2            2016-03-01    5
1            2            2016-03-02    6
2            3            2017-06-25    1
3            1            2016-03-02    0
3            4            2018-07-03    5
```

**Your SQL answer**

```sql




```

---

**## 24. Find Cumulative Salary of an Employee**

**Question**
Write an SQL query to get the cumulative sum of an employee's salary over a period of 3 months but exclude the most recent month.

Rules:
- The result should be displayed by 'Id' ascending, and then by 'Month' descending.

**Source table(s)**

```text
TABLE: EMPLOYEE
Id    Month    Salary
1     1        20
2     1        20
1     2        30
2     2        30
3     2        40
1     3        40
3     3        60
1     4        60
3     4        70
```

**Your SQL answer**

```sql




```

---

**## 25. Running Total for Different Genders**

**Question**
Write an SQL query to find the total score for each gender on each day.

Rules:
- Return the result table ordered by gender and day.

**Source table(s)**

```text
TABLE: SCORES
player_name    gender    day         score_points
Aron           F         2020-01-01  17
Alice          F         2020-01-07  23
Bajrang        M         2020-01-07  7
Khali          M         2019-12-25  11
```

**Your SQL answer**

```sql




```

---

**## 26. Get the Second Most Recent Activity**

**Question**
Write an SQL query to show the second most recent activity of each user.

Rules:
- If the user only has one activity, return that one.
- A user cannot perform more than one activity at the same time.

**Source table(s)**

```text
TABLE: USERACTIVITY
username    activity    startDate     endDate
Alice       Travel      2020-02-12    2020-02-20
Alice       Dancing     2020-02-21    2020-02-23
Alice       Travel      2020-02-24    2020-02-28
Bob         Travel      2020-02-11    2020-02-18
```

**Your SQL answer**

```sql




```

---

**## 27. The Most Recent Three Orders**

**Question**
Write an SQL query to find the most recent three orders of each user.

Rules:
- If a user has less than three orders, return all of them.
- Return the result ordered by customer_name ascending, and then by order_date descending.

**Source table(s)**

```text
TABLE: CUSTOMERS
customer_id    name
1              Winston
2              Jonathan
3              Annabelle
4              Marwan

TABLE: ORDERS
order_id    order_date    customer_id
1           2020-07-31    1
2           2020-07-30    2
3           2020-08-29    3
4           2020-07-29    4
5           2020-06-10    1
6           2020-08-01    2
7           2020-08-01    3
```

**Your SQL answer**

```sql




```

---

**## 28. The Most Recent Orders for Each Product**

**Question**
Write an SQL query to find the most recent order(s) for each product.

Rules:
- Return the result table ordered by product_name ascending and product_id ascending.
- If multiple orders have the same most recent date, return all of them.

**Source table(s)**

```text
TABLE: PRODUCTS
product_id    product_name
1             keyboard
2             mouse
3             screen

TABLE: ORDERS
order_id    order_date    product_id
1           2020-08-01    1
2           2020-08-02    2
3           2020-08-03    3
4           2020-08-16    1
5           2020-03-01    1
```

**Your SQL answer**

```sql




```

---

**## 29. Highest Grade For Each Student**

**Question**
Write a SQL query to find the highest grade with its corresponding course for each student.

Rules:
- In case of a tie, you should find the course with the smallest course_id.
- Return the result table ordered by student_id in ascending order.

**Source table(s)**

```text
TABLE: ENROLLMENTS
student_id    course_id    grade
2             2            95
2             3            95
1             1            90
1             2            99
3             1            80
3             2            75
3             3            82
```

**Your SQL answer**

```sql




```

---

**## 30. Immediate Food Delivery I**

**Question**
If the customer's preferred delivery date is the same as the order date, then the order is called immediate. Write an SQL query to find the percentage of immediate orders in the table.

Rules:
- Round to 2 decimal places.

**Source table(s)**

```text
TABLE: DELIVERY
delivery_id    customer_id    order_date    customer_pref_delivery_date
1              1              2019-08-01    2019-08-02
2              5              2019-08-02    2019-08-02
3              1              2019-08-11    2019-08-11
4              3              2019-08-24    2019-08-26
5              4              2019-08-21    2019-08-22
```

**Your SQL answer**

```sql




```

---

**## 31. Immediate Food Delivery II**

**Question**
Write an SQL query to find the percentage of immediate orders in the first orders of all customers.

Rules:
- First order is the order with the earliest order date for the customer.
- Round to 2 decimal places.

**Source table(s)**

```text
TABLE: DELIVERY
delivery_id    customer_id    order_date    customer_pref_delivery_date
1              1              2019-08-01    2019-08-02
2              2              2019-08-02    2019-08-02
3              1              2019-08-11    2019-08-12
4              3              2019-08-24    2019-08-24
5              3              2019-08-21    2019-08-22
```

**Your SQL answer**

```sql




```

---

**## 32. Restaurant Growth**

**Question**
Write an SQL query to compute the moving average of how much the customer paid in a seven days window.

Rules:
- Return result table ordered by visited_on in ascending order.
- Average amount should be rounded to two decimal places.

**Source table(s)**

```text
TABLE: CUSTOMER
customer_id    name      visited_on    amount
1              Jhon      2019-01-01    100
2              Daniel    2019-01-02    110
3              Jade      2019-01-03    120
4              Khaled    2019-01-04    130
5              Winston   2019-01-05    110
6              Elvis     2019-01-06    140
7              Anna      2019-01-07    150
```

**Your SQL answer**

```sql




```

---

**## 33. Number of Calls Between Two Persons**

**Question**
Write an SQL query to report the number of calls and the total call duration between each pair of distinct persons.

Rules:
- person1 < person2 for each pair.
- Return the result table in any order.

**Source table(s)**

```text
TABLE: CALLS
from_id    to_id    duration
1          2        59
2          1        11
1          3        20
3          4        100
3          4        200
3          4        200
4          3        499
```

**Your SQL answer**

```sql




```

---

**## 34. Biggest Window Between Visits**

**Question**
Assume today's date is '2021-1-1'. Write an SQL query that returns the biggest window of days between two visits for each user.

Rules:
- Biggest window is the max difference in days between consecutive visits, or from last visit to '2021-1-1'.
- Return the result table ordered by user_id.

**Source table(s)**

```text
TABLE: USERVISITS
user_id    visit_date
1          2020-11-28
1          2020-10-20
1          2020-12-03
2          2020-10-05
2          2020-12-09
3          2020-11-11
```

**Your SQL answer**

```sql




```

---

**## 35. Find Total Time Spent by Each Employee**

**Question**
Write an SQL query to calculate the total time in minutes spent by each employee on each day at the office.

Rules:
- Note that within one day, an employee can enter and leave more than once. The time spent is out_time - in_time.

**Source table(s)**

```text
TABLE: EMPLOYEES
emp_id    event_day    in_time    out_time
1         2020-11-28   4          32
1         2020-11-28   55         200
1         2020-12-03   1          42
2         2020-11-28   3          33
2         2020-12-09   47         74
```

**Your SQL answer**

```sql




```

---

**## 36. Percentage of Users Attended Contest**

**Question**
Write an SQL query to find the percentage of the users registered in each contest rounded to two decimals.

Rules:
- Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

**Source table(s)**

```text
TABLE: USERS
user_id    user_name
6          Alice
2          Bob
7          Alex

TABLE: REGISTER
contest_id    user_id
215           6
209           2
208           2
210           6
208           6
209           7
209           6
215           7
208           7
210           2
207           2
210           7
```

**Your SQL answer**

```sql




```

---

**## 37. Confirmation Rate**

**Question**
The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. Write a query to find the confirmation rate of each user.

Rules:
- If a user did not request any confirmation messages, their confirmation rate is 0.
- Round to 2 decimal places.

**Source table(s)**

```text
TABLE: SIGNUPS
user_id    time_stamp
3          2020-03-21
7          2020-01-04
2          2020-07-29
6          2020-12-09

TABLE: CONFIRMATIONS
user_id    time_stamp    action
3          2021-01-06    timeout
3          2021-07-14    timeout
7          2021-06-12    confirmed
7          2021-06-13    confirmed
7          2021-06-14    confirmed
2          2021-01-22    confirmed
2          2021-02-28    timeout
```

**Your SQL answer**

```sql




```

---

**## 38. League Statistics**

**Question**
Write an SQL query to report the statistics of the league. Statistics should include team_name, matches_played, points, goal_for, goal_against, goal_diff.

Rules:
- Points: 3 for win, 1 for draw, 0 for loss.
- Order by points DESC, goal_diff DESC, team_name ASC.

**Source table(s)**

```text
TABLE: TEAMS
team_id    team_name
1          Ajax
4          Dortmund
6          Arsenal

TABLE: MATCHES
home_team_id    away_team_id    home_team_goals    away_team_goals
1               4               0                  1
1               6               3                  3
4               1               5                  2
6               1               0                  0
```

**Your SQL answer**

```sql




```

---

**## 39. Group Sold Products By The Date**

**Question**
Write an SQL query to find for each date the number of different products sold and their names.

Rules:
- The sold products names for each date should be sorted lexicographically.
- Return the result table ordered by sell_date.

**Source table(s)**

```text
TABLE: ACTIVITIES
sell_date    product
2020-05-30   Headphone
2020-06-01   Pencil
2020-06-02   Mask
2020-05-30   Basketball
2020-06-01   Bible
2020-06-02   Mask
2020-05-30   T-Shirt
```

**Your SQL answer**

```sql




```

---

**## 40. The Number of Employees Which Report to Each Employee**

**Question**
Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Rules:
- Return the result table ordered by employee_id.

**Source table(s)**

```text
TABLE: EMPLOYEES
employee_id    name      reports_to    age
9              Hercy     NULL          43
6              Alice     9             41
4              Bob       9             36
2              Winston   NULL          37
```

**Your SQL answer**

```sql




```

---

# DATA ENGINEER SQL INTERVIEW CHALLENGE — PRACTICE WORKBOOK

**## 41. Consecutive Numbers**

**Question**
Write an SQL query to find all numbers that appear at least three times consecutively.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: LOGS
id  num
1   1
2   1
3   1
4   2
5   1
6   2
7   2
```

**Your SQL answer**

```sql



```

---

**## 42. Trips and Users**

**Question**
Find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between '2013-10-01' and '2013-10-03'.

Rules:
- Round Cancellation Rate to two decimal points.

**Source table(s)**

```text
TABLE: TRIPS
Id Client_Id  Driver_Id  Status               Request_at
1 1           10         completed            2013-10-01
2 2           11         cancelled_by_driver  2013-10-01
TABLE: USERS
Users_Id  Banned  Role
1         No      client
2         No      client
10        No      driver
11        No      driver
```

**Your SQL answer**

```sql



```

---

**## 43. Sales Person**

**Question**
Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name 'RED'.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: SALESPERSON
sales_id  name
1         John
2         Amy
3         Mark
TABLE: COMPANY
com_id  name
1       RED
2       ORANGE
TABLE: ORDERS
order_id  com_id  sales_id
1         1       1
2         2       2
```

**Your SQL answer**

```sql



```

---

**## 44. Friend Requests I Acceptance Rate**

**Question**
Find the overall acceptance rate of requests, which is the number of acceptance divided by the number of requests.

Rules:
- Round to 2 decimals.
- If there are no requests at all, you should return 0.00 as the
- accept_rate.

**Source table(s)**

```text
TABLE: FRIEND_REQUEST
sender_id  send_to_id  request_date
1          2           2016-06-01
1          3           2016-06-01
2          3           2016-06-02
TABLE: REQUEST_ACCEPTED
requester_id  accepter_id  accept_date
1             2            2016-06-03
2             3            2016-06-03
```

**Your SQL answer**

```sql



```

---

**## 45. Median Employee Salary**

**Question**
Write an SQL query to find the median salary of each company.

Rules:
- Sort the result by Id.
- Do not use built-in median functions.

**Source table(s)**

```text
TABLE: EMPLOYEE
Id  Company  Salary
1   A        2341
2   A        341
3   A        15
4   A        15314
5   A        451
6   A        513
```

**Your SQL answer**

```sql



```

---

**## 46. Students and Examinations**

**Question**
Write an SQL query to find the number of times each student attended each exam.

Rules:
- Return the result table ordered by student_id and subject_name.

**Source table(s)**

```text
TABLE: STUDENTS
student_id  student_name
1           Alice
2           Bob
TABLE: SUBJECTS
subject_name
Math
Physics
TABLE: EXAMINATIONS
student_id  subject_name
1           Math
1           Physics
1           Math
```

**Your SQL answer**

```sql



```

---

**## 47. Start and End Number of Continuous Ranges**

**Question**
Write an SQL query to find the start and end number of continuous ranges in the table Logs.

Rules:
- Return the result table ordered by start_id.

**Source table(s)**

```text
TABLE: LOGS
log_id
1
2
3
7
8
10
```

**Your SQL answer**

```sql



```

---

**## 48. Human Traffic of Stadium**

**Question**
Write an SQL query to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.

Rules:
- Return the result table ordered by visit_date in ascending order.

**Source table(s)**

```text
TABLE: STADIUM
id  visit_date  people
1   2017-01-01  10
2   2017-01-02  109
3   2017-01-03  150
4   2017-01-04  99
5   2017-01-05  145
6   2017-01-06  1455
7   2017-01-07  199
```

**Your SQL answer**

```sql



```

---

**## 49. Investments in 2016**

**Question**
Write a query to print the sum of all total investment values in 2016 (tiv_2016).

Rules:
- Criteria 1: Have the same tiv_2015 value as one or more other
- policyholders.
- Criteria 2: Are not located in the same city (lat, lon) as any other
- policyholder.

**Source table(s)**

```text
TABLE: INSURANCE
pid  tiv_2015  tiv_2016  lat  lon
1    10        5         10   10
2    20        20        20   20
3    10        30        20   20
4    10        40        40   40
```

**Your SQL answer**

```sql



```

---

**## 50. Tree Node**

**Question**
Write an SQL query to report the type of each node in the tree.

Rules:
- Types: 'Root' (no parent), 'Leaf' (no children), 'Inner' (has parent and
- children).

**Source table(s)**

```text
TABLE: TREE
id  p_id
1   Null
2   1
3   1
4   2
5   2
```

**Your SQL answer**

```sql



```

---

**## 51. Exchange Seats**

**Question**
Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Rules:
- Return the result table ordered by id in ascending order.

**Source table(s)**

```text
TABLE: SEAT
id  student
1   Abbot
2   Doris
3   Emerson
4   Green
5   Jeames
```

**Your SQL answer**

```sql



```

---

**## 52. Customer Who Visited No Transactions**

**Question**
Write a SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: VISITS
visit_id  customer_id
1         23
2         9
4         30
5         54
6         96
TABLE: TRANSACTIONS
transaction_id  visit_id  amount
2               5         310
3               5         300
9               5         200
```

**Your SQL answer**

```sql



```

---

**## 53. The Winner University**

**Question**
An excellent student scores >= 90. Write a query to return 'New York University' if it has more excellent students, 'California University' if it has more, and 'No Winner' if tied.

Rules:
- Return just the winner name.

**Source table(s)**

```text
TABLE: NEWYORK
student_id  score
1           90
2           87
TABLE: CALIFORNIA
student_id  score
2           89
3           88
```

**Your SQL answer**

```sql



```

---

**## 54. NPV Queries**

**Question**
Write an SQL query to find the npv of each query of the Queries table.

Rules:
- Return 0 if there is no npv mapped for that id and year.

**Source table(s)**

```text
TABLE: NPV
id  year  npv
1   2018  100
7   2020  30
13  2019  40
TABLE: QUERIES
id  year
1   2019
2   2008
7   2020
13  2019
```

**Your SQL answer**

```sql



```

---

**## 55. Hopper Company Queries I**

**Question**
Write an SQL query to report the number of active drivers and accepted rides for each month of 2020.

Rules:
- Active drivers are those who joined by the end of the month.
- Output should include all 12 months.

**Source table(s)**

```text
TABLE: DRIVERS
driver_id  join_date
10         2019-12-10
8          2020-1-13
5          2020-2-16
```

**Your SQL answer**

```sql



```

---

**## 56. Hopper Company Queries II**

**Question**
Write an SQL query to report the percentage of working drivers (working_percentage) for each month of 2020.

Rules:
- working_percentage = (working drivers / active drivers) * 100.
- Round to 2 decimal places.

**Source table(s)**

```text
TABLE: ACCEPTEDRIDES
ride_id  driver_id  ride_distance
1        10         60
2        8          50
3        5          100
```

**Your SQL answer**

```sql



```

---

**## 57. Hopper Company Queries III**

**Question**
Write an SQL query to compute the average ride distance and average ride duration for a rolling 3-month window for each month in 2020.

Rules:
- Return rows for Jan to Oct 2020.
- Round to 2 decimal places.

**Source table(s)**

```text
TABLE: ACCEPTEDRIDES
ride_id  driver_id  ride_distance  ride_duration
1        10         60             20
2        8          50             15
3        5          100            30
```

**Your SQL answer**

```sql



```

---

**## 58. All People Report to Given Manager**

**Question**
Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company (employee_id = 1).

Rules:
- The indirect relation between managers will not exceed 3 managers
- as the company is small.

**Source table(s)**

```text
TABLE: EMPLOYEES
employee_id  employee_name  manager_id
1            Boss           1
3            Alice          3
2            Bob            1
4            Daniel         2
7            Luis           4
8            John           3
9            Angela         8
77           Robert         1
```

**Your SQL answer**

```sql



```

---

**## 59. Invalid Tweets**

**Question**
Write an SQL query to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: TWEETS
tweet_id  content
1         Vote for Biden
2         Let us make America  great again!
```

**Your SQL answer**

```sql



```

---

**## 60. Capital Gain Loss**

**Question**
Write an SQL query to report the Capital gain/loss for each stock.

Rules:
- The Capital gain/loss is the total gain or loss after buying and selling.
- Return the result table in any order.

**Source table(s)**

```text
TABLE: STOCKS
stock_name    operation  operation_day  price
Leetcode      Buy        1              1000
Corona Masks  Buy        2              10
Leetcode      Sell       5              9000
Handbags      Buy        17             30000
Corona Masks  Sell       3              1010
Handbags      Sell       29             7000
```

**Your SQL answer**

```sql



```

---

# DATA ENGINEER SQL INTERVIEW CHALLENGE — PRACTICE WORKBOOK

**## 61. Fix Names in a Table**

**Question**
Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.

Rules:
- Return the result table ordered by user_id.

**Source table(s)**

```text
TABLE: USERS
user_id  name
1        aLice
2        bOB
```

**Your SQL answer**

```sql



```

---

**## 62. Fix Product Name Format**

**Question**
Since table data was entered by different people, the product_name is very inconsistent. Write a query to return the lowercase, space- trimmed product_name and the total number of sales for that product.

Rules:
- Format product_name to lower case and remove leading/trailing
- spaces.
- Return result ordered by product_name.

**Source table(s)**

```text
TABLE: SALES
sale_id  product_name  sale_date
1        LCPHONE       2000-01-16
2        LCPhone       2000-01-17
3        LcPhOnE       2000-02-18
4        LCKeyCHain    2000-02-19
```

**Your SQL answer**

```sql



```

---

**## 63. Patients With a Condition**

**Question**
Write an SQL query to find the patient_id, patient_name and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: PATIENTS
patient_id  patient_name  conditions
1           Daniel        YFEV COUGH
2           Alice
3           Bob           DIAB100       MYOP
4           George        ACNE DIAB100
5           Alain         DIAB201
```

**Your SQL answer**

```sql



```

---

**## 64. Find Users With Valid E-Mails**

**Question**
Write an SQL query to find the users who have valid emails.

Rules:
- Valid e-mail has a prefix name and a domain.
- Prefix name must start with a letter.
- Prefix name may contain letters, digits, underscore '_', period '.', or
- dash '-'.
- The domain must be '@leetcode.com'.

**Source table(s)**

```text
TABLE: USERS
user_id  name       mail
1        Winston    winston@leetcode.com
2        Jonathan   jonathanisgreat
3        Annabelle  bella-@leetcode.com
4        Sally      sally.come@leetcode.com
5        Marwan     quarz#2020@leetcode.com
6        David      david69@gmail.com
7        Shapiro    .shapo@leetcode.com
```

**Your SQL answer**

```sql



```

---

**## 65. Recyclable and Low Fat Products**

**Question**
Write an SQL query to find the ids of products that are both low fat and recyclable.

Rules:
- Return the result table in any order.
- low_fats is an ENUM of type ('Y', 'N').
- recyclable is an ENUM of type ('Y', 'N').

**Source table(s)**

```text
TABLE: PRODUCTS
product_id  low_fats  recyclable
0           Y         N
1           Y         Y
2           N         Y
3           Y         Y
4           N         N
```

**Your SQL answer**

```sql



```

---

**## 66. Invalid Tweets Check**

**Question**
Write an SQL query to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: TWEETS
tweet_id  content
1         Vote for Biden
2         Let us make America  great again!
```

**Your SQL answer**

```sql



```

---

**## 67. Get Highest Answer Rate Question**

**Question**
TABLE: SURVEYLOG id action question_id answer_id q_num timestamp 5 show 285 null 1 123 5 answer 285 124124 1 124 5 show 369 null 2 125 5 skip 369 null 2 126 QUESTION Write an SQL query to report the question that has the highest answer rate.

Rules:
- Answer rate = (number of times answered) / (number of times
- shown).
- If multiple questions have the same highest rate, return the one with
- the smallest question_id.

**Source table(s)**

```text
```

**Your SQL answer**

```sql



```

---

**## 68. Friendly Movies Streamed Last Month**

**Question**
Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.

Rules:
- Kids_content = 'Y' means kid-friendly.
- content_type = 'Movies' means it's a movie.

**Source table(s)**

```text
TABLE: TVPROGRAM
program_date  content_id  channel
2020-06-10    1           LC-Channel
2020-05-11    2           LC-Channel
2020-05-12    3           LC-Channel
2020-05-13    4           Disney Ch
2020-06-18    4           Disney Ch
2020-07-15    5           Disney Ch
TABLE: CONTENT
content_id  title            Kids_content  content_type
1           Leetcode         Movie N       Movies
2           Alg. for Kids Y  Series
3           Database         Sucks N       Movies
4           Aladdin          Y             Movies
5           Cinderella       Y             Movies
```

**Your SQL answer**

```sql



```

---

**## 69. Bank Account Summary**

**Question**
Write an SQL query to find current balance for all users and check if they breached their credit limit (balance < 0).

Rules:
- Current balance = initial credit - money paid + money received.
- Return user_id, user_name, credit, credit_limit_breached ('Yes' or
- 'No').

**Source table(s)**

```text
TABLE: USERS
user_id  user_name  credit
1        Moustafa   100
2        Jonathan   200
3        Winston    10000
4        Luis       800
TABLE: TRANSACTIONS
trans_id  paid_by  paid_to  amount  trans_on
1         1        3        400     2020-08-01
2         3        2        500     2020-08-02
3         2        1        200     2020-08-03
```

**Your SQL answer**

```sql



```

---

**## 70. Bank Account Summary II**

**Question**
Write an SQL query to report the name and balance of users with a balance higher than 10000.

Rules:
- The balance of an account is equal to the sum of the amounts of all
- transactions involving that account.

**Source table(s)**

```text
TABLE: USERS
account  name
900001   Alice
900002   Bob
900003   Charlie
TABLE: TRANSACTIONS
trans_id  account  amount  trans_on
1         900001   7000    2020-08-01
2         900001   7000    2020-09-01
3         900001   -3000   2020-09-02
4         900002   1000    2020-09-12
5         900003   6000    2020-08-07
6         900003   6000    2020-09-07
7         900003   -4000   2020-09-11
```

**Your SQL answer**

```sql



```

---

**## 71. Calculate Salaries**

**Question**
Write an SQL query to find the taxes applied to each employee's salary and calculate their net salary.

Rules:
- 0% tax for company max salary < 1000
- 24% tax for company max salary between 1000 and 10000
- 49% tax for company max salary > 10000
- Return result in any order.

**Source table(s)**

```text
TABLE: SALARIES
company_id  employee_id  employee_name  salary
1           1            Tony           2000
1           2            Pronub         21300
1           3            Tyrrox         10800
2           1            Pam            300
2           7            Bassem         450
2           9            Hermione       700
3           7            Bocaben        100
3           2            Ozgur          2200
3           13           Nyx            3300
```

**Your SQL answer**

```sql



```

---

**## 72. Find Interview Candidates**

**Question**
Write an SQL query to find the name and the mail of all interview candidates.

Rules:
- Candidate condition: Won any medal in 3 or more consecutive
- contests.
- OR: Won 3 or more gold medals (not necessarily consecutive).

**Source table(s)**

```text
TABLE: CONTESTS
contest_id  gold_medal  silver_medal  bronze_medal
190         1           5             2
191         2           3             5
192         5           2             3
193         1           3             5
194         4           5             2
195         4           2             1
196         1           5             2
TABLE: USERS
user_id  mail                   name
1        sarah@leetcode.com     Sarah
2        bob@leetcode.com       Bob
3        alice@leetcode.com     Alice
4        hermione@leetcode.com  Hermione
5        quarz@leetcode.com     Quarz
```

**Your SQL answer**

```sql



```

---

**## 73. Convert Date Format**

**Question**
Write an SQL query to convert each date in Days into a string formatted as "day_name, month_name day_number, year".

Rules:
- Example formatting: "Tuesday, April 12, 2022".

**Source table(s)**

```text
TABLE: DAYS
day
2022-04-12
2021-08-09
2020-06-26
```

**Your SQL answer**

```sql



```

---

**## 74. Primary Department for Each Employee**

**Question**
Write an SQL query to report all the employees with their primary department.

Rules:
- If an employee belongs to exactly one department, it is automatically
- their primary department.
- If multiple, the primary_flag is 'Y'.

**Source table(s)**

```text
TABLE: EMPLOYEE
employee_id  department_id  primary_flag
1            1              N
2            1              Y
2            2              N
3            3              N
4            2              N
4            3              Y
4            4              N
```

**Your SQL answer**

```sql



```

---

**## 75. Product Worth Over Invoices**

**Question**
Write an SQL query that will, for all products, return each product name with the total amount due, paid, canceled, and refunded across all invoices.

Rules:
- Return the result table ordered by product_name.

**Source table(s)**

```text
TABLE: PRODUCT
product_id  name
0           ham
1           bacon
TABLE: INVOICE
invoice_id  product_id  rest paid canceled  refunded
23          0           2 0 5               0
12          0           0 4 0               3
1           1           1 1 0               1
2           1           1 0 1               1
3           1           0 1 1               1
```

**Your SQL answer**

```sql



```

---
# DATA ENGINEER SQL INTERVIEW CHALLENGE — PRACTICE WORKBOOK

**## 76. Game Play Analysis V**

**Question**
Report the fraction of players that logged in again on the day after their first login.

Rules:
- Round to 2 decimal places.

**Source table(s)**

```text
TABLE: ACTIVITY
player_id  device_id  event_date  games_played
1          2          2016-03-01  5
1          2          2016-03-02  6
2          3          2017-06-25  1
```

**Your SQL answer**

```sql



```

---

**## 77. User Activity for the Past 30 Days I**

**Question**
Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively.

Rules:
- A user was active on a day if they made at least one activity on that
- day.

**Source table(s)**

```text
TABLE: ACTIVITY
user_id  session_id  activity_date  activity_type
1        1           2019-07-20     open_session
1        1           2019-07-20     scroll_down
2        4           2019-07-21     send_message
```

**Your SQL answer**

```sql



```

---

**## 78. User Activity for the Past 30 Days II**

**Question**
Write an SQL query to find the average number of sessions per user for a period of 30 days ending 2019-07-27.

Rules:
- Round to 2 decimal places.

**Source table(s)**

```text
TABLE: ACTIVITY
user_id  session_id  activity_date  activity_type
1        1           2019-07-20     open_session
2        4           2019-07-21     send_message
```

**Your SQL answer**

```sql



```

---

**## 79. New Users Daily Count**

**Question**
Write an SQL query that reports for every date within at most 90 days from today (2019-06-30), the number of users that logged in for the first time on that date.

Rules:
- Ignore users who logged in before 90 days.

**Source table(s)**

```text
TABLE: TRAFFIC
user_id  activity  activity_date
1        login     2019-05-01
1        homepage  2019-05-01
2        login     2019-06-21
```

**Your SQL answer**

```sql



```

---

**## 80. Unpopular Books**

**Question**
Report the books that have sold less than 10 copies in the last year, excluding books that have been available for less than 1 month from today (2019-06-23).

Rules:
- Order result arbitrarily.

**Source table(s)**

```text
TABLE: BOOKS
book_id  name        available_from
1        Kalila      2010-01-01
2        28 Letters  2012-05-12
3        The Hobbit  2019-06-10
TABLE: ORDERS
order_id  book_id  quantity  dispatch_date
1         1        2         2018-07-26
2         1        1         2018-11-05
3         2        8         2019-06-23
```

**Your SQL answer**

```sql



```

---

**## 81. Article Views I**

**Question**
Find all the authors that viewed at least one of their own articles.

Rules:
- Return id sorted in ascending order.

**Source table(s)**

```text
TABLE: VIEWS
article_id  author_id  viewer_id  view_date
1           3          5          2019-08-01
1           3          6          2019-08-02
2           7          7          2019-08-01
```

**Your SQL answer**

```sql



```

---

**## 82. Article Views II**

**Question**
Find all the people who viewed more than one article on the same date.

Rules:
- Return id sorted in ascending order.

**Source table(s)**

```text
TABLE: VIEWS
article_id  author_id  viewer_id  view_date
1           3          5          2019-08-01
3           4          5          2019-08-01
2           7          7          2019-08-02
```

**Your SQL answer**

```sql



```

---

**## 83. Market Analysis I**

**Question**
Find for each user, the join date and the number of orders they made as a buyer in 2019.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: USERS
user_id  join_date   favorite_brand
1        2018-01-01  Lenovo
2        2018-02-09  Samsung
TABLE: ORDERS
order_id  order_date  item_id  buyer_id  seller_id
1         2019-08-01  4        1         2
2         2018-08-02  2        1         3
```

**Your SQL answer**

```sql



```

---

**## 84. Market Analysis II**

**Question**
Find for each user whether the brand of the second item (by date) they sold is their favorite brand.

Rules:
- If user sold less than 2 items, report 'no'. Return seller_id and
- 2nd_item_fav_brand.

**Source table(s)**

```text
TABLE: USERS
user_id  favorite_brand
1        Lenovo
2        Samsung
TABLE: ITEMS
item_id  item_brand
1        Samsung
2        Lenovo
TABLE: ORDERS
order_id  order_date  item_id  buyer_id  seller_id
1         2019-08-01  1        1         2
2         2019-08-02  2        1         2
```

**Your SQL answer**

```sql



```

---

**## 85. Product Price at a Given Date**

**Question**
Write an SQL query to find the prices of all products on 2019-08-16. Default price before any change is 10.

**Source table(s)**

```text
TABLE: PRODUCTS
product_id  new_price  change_date
1           20         2019-08-14
2           50         2019-08-14
1           35         2019-08-16
```

**Your SQL answer**

```sql



```

---

**## 86. Monthly Transactions I**

**Question**
Find for each month and country, the number of transactions, total amount, the number of approved transactions and their total amount.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: TRANSACTIONS
id country  state     amount  trans_date
1 US        approved  1000    2018-12-18
2 US        declined  2000    2018-12-19
3 US        approved  2000    2019-01-01
```

**Your SQL answer**

```sql



```

---

**## 87. Monthly Transactions II**

**Question**
Find for each month and country: the number of approved transactions and their total amount, the number of chargebacks and their total amount.

Rules:
- Ignore months/countries with no data.

**Source table(s)**

```text
TABLE: TRANSACTIONS
id country  state     amount  trans_date
101 US      approved  1000    2019-05-18
102 US      declined  2000    2019-05-19
TABLE: CHARGEBACKS
trans_id  trans_date
101       2019-06-05
```

**Your SQL answer**

```sql



```

---

**## 88. Maximum Transaction Each Day**

**Question**
Write an SQL query to report the IDs of the transactions with the maximum amount on their respective day.

Rules:
- If there are multiple such transactions, return all of them. Order by
- transaction_id.

**Source table(s)**

```text
TABLE: TRANSACTIONS
transaction_id  day         amount
8               2021-04-03  57
9               2021-04-03  57
10              2021-04-04  50
```

**Your SQL answer**

```sql



```

---

**## 89. Tournament Winners**

**Question**
Find the winner in each group. Winner is player who scored max total points. In tie, lower player_id wins.

Rules:
- Return group_id and player_id.

**Source table(s)**

```text
TABLE: PLAYERS
player_id  group_id
15         1
25         1
30         1
45         2
TABLE: MATCHES
match_id  first_player  second_player  first_score  second_score
1         15            45             3            0
2         30            25             1            2
```

**Your SQL answer**

```sql



```

---

**## 90. The Latest Login in 2020**

**Question**
Write an SQL query to report the latest login for all users in the year 2020.

Rules:
- Do not include users who did not login in 2020.

**Source table(s)**

```text
TABLE: LOGINS
user_id  time_stamp
6        2020-06-30
6        2021-01-01
8        2020-02-01
8        2020-12-30
```

**Your SQL answer**

```sql



```

---
# DATA ENGINEER SQL INTERVIEW CHALLENGE — PRACTICE WORKBOOK

**## 91. Swap Sex of Employees**

**Question**
Write an SQL query to swap all 'f' and 'm' values with a single update statement and no intermediate temp tables.

Rules:
- Must use an UPDATE statement.

**Source table(s)**

```text
TABLE: SALARY
id  name  sex  salary
1   A     m    2500
2   B     f    1500
3   C     m    5500
4   D     f    500
```

**Your SQL answer**

```sql



```

---

**## 92. Triangle Judgement**

**Question**
Report for every three line segments whether they can form a triangle.

Rules:
- Return x, y, z and triangle (Yes/No).

**Source table(s)**

```text
TABLE: TRIANGLE
x   y   z
13  15  30
10  20  15
```

**Your SQL answer**

```sql



```

---

**## 93. Arrange Table by Gender**

**Question**
Write an SQL query to rearrange the table such that the rows alternate in the order female, other, male.

Rules:
- Maintain relative order by user_id within each gender.

**Source table(s)**

```text
TABLE: GENDERS
user_id  gender
4        male
7        female
2        other
5        male
3        female
8        male
```

**Your SQL answer**

```sql



```

---

**## 94. Count Salary Categories**

**Question**
Calculate the number of bank accounts of each salary category.

Rules:
- Low Salary: < $20,000
- Average Salary: $20,000 to $50,000 inclusive
- High Salary: > $50,000. Include all categories even if 0.

**Source table(s)**

```text
TABLE: ACCOUNTS
account_id  income
3           108939
2           12747
8           87709
6           91796
```

**Your SQL answer**

```sql



```

---

**## 95. Calculate Special Bonus**

**Question**
Calculate the bonus of each employee. The bonus is 100% of their salary if the ID is an odd number and the employee's name does not start with 'M'.

Rules:
- Otherwise, the bonus is 0. Order by employee_id.

**Source table(s)**

```text
TABLE: EMPLOYEES
employee_id  name     salary
2            Meir     3000
3            Michael  3800
7            Addilyn  7400
8            Juan     6100
9            Kannon   7700
```

**Your SQL answer**

```sql



```

---

**## 96. Sales by Day of the Week**

**Question**
Report how many units in each category have been ordered on each day of the week.

Rules:
- Return Category, Monday, Tuesday... Sunday. Order by Category.

**Source table(s)**

```text
TABLE: ORDERS
order_id  customer_id  order_date  item_id  quantity
1         1            2020-06-01  1        10
2         1            2020-06-08  2        10
3         2            2020-06-02  1        5
TABLE: ITEMS
item_id  item_name  item_category
1        LC Algo 1  Book
2        LC Algo 2  Book
```

**Your SQL answer**

```sql



```

---

**## 97. Order Two Columns Independently**

**Question**
Write a query to independently order first_col in ascending order and second_col in descending order.

Rules:
- Return the result table.

**Source table(s)**

```text
TABLE: DATA
first_col  second_col
4          2
1          5
6          1
3          4
```

**Your SQL answer**

```sql



```

---

**## 98. Patients With Condition**

**Question**
Find patients who have Type I Diabetes (DIAB1 prefix).

Rules:
- Return patient_id, patient_name, conditions.

**Source table(s)**

```text
TABLE: PATIENTS
patient_id  patient_name  conditions
1           Daniel        YFEV COUGH
2           Alice
3           Bob           DIAB100     MYOP
```

**Your SQL answer**

```sql



```

---

**## 99. Group Employees Same Salary**

**Question**
Write a query to get the employee_id, name, salary, and a dense_rank of employees who share the same salary.

Rules:
- Only include salaries shared by >= 2 employees. Order by team_id
- (the rank), then employee_id.

**Source table(s)**

```text
TABLE: EMPLOYEES
employee_id  name     salary
2            Meir     3000
3            Michael  3000
7            Addilyn  7400
8            Juan     6100
9            Kannon   7700
1            Bob      7400
```

**Your SQL answer**

```sql



```

---

**## 100. Queries Quality and Percentage**

**Question**
Find each query_name, the quality and poor_query_percentage.

Rules:
- Quality = avg of rating / position. Poor % = % of queries with rating <
- 3. Round to 2 decimals.

**Source table(s)**

```text
TABLE: QUERIES
query_name  result   position  rating
Dog         Golden   1         5
Dog         German   2         5
Dog         Mule     200       1
Cat         Shirazi  5         2
Cat         Siamese  3         3
Cat         Sphynx   7         4
```

**Your SQL answer**

```sql



```

---

**## 101. Evaluate Boolean Expression**

**Question**
Evaluate the boolean expressions.

Rules:
- Return left_operand, operator, right_operand, and value ('true' or
- 'false').

**Source table(s)**

```text
TABLE: VARIABLES
name  value
x     66
y     77
TABLE: EXPRESSIONS
left_operand  operator  right_operand
x             >         y
x             <         y
x             =         y
```

**Your SQL answer**

```sql



```

---

**## 102. Apples & Oranges**

**Question**
Write an SQL query to report the difference between the number of apples and oranges sold each day.

Rules:
- Return the result table ordered by sale_date.

**Source table(s)**

```text
TABLE: SALES
sale_date   fruit    sold_num
2020-05-01  apples   10
2020-05-01  oranges  8
2020-05-02  apples   15
2020-05-02  oranges  15
```

**Your SQL answer**

```sql



```

---

**## 103. Leetflex Banned Accounts**

**Question**
Find the account_id of the accounts that should be banned.

Rules:
- An account is banned if it logged in from two different IP addresses
- at the same time.

**Source table(s)**

```text
TABLE: LOGINFO
account_id  ip_address  login  logout
2021-02-01  2021-02-01
1           1
09:00:00    09:30:00
2021-02-01  2021-02-01
1           2
08:00:00    11:30:00
2021-02-01  2021-02-01
2           6
20:30:00    22:00:00
```

**Your SQL answer**

```sql



```

---

**## 104. Team Scores Football Tournament**

**Question**
Calculate the points of each team. Points: 3 for win, 1 for draw, 0 for loss.

Rules:
- Order by num_points DESC, team_id ASC.

**Source table(s)**

```text
TABLE: TEAMS
team_id  team_name
10       Leetcode   FC
20       NewYork    FC
30       Atlanta    FC
40       Chicago    FC
50       Toronto    FC
TABLE: MATCHES
match_id  host_team  guest_team  host_goals  guest_goals
1         10         20          3           0
2         30         10          2           2
3         10         50          5           1
4         20         30          1           0
5         50         30          1           0
```

**Your SQL answer**

```sql



```

---

**## 105. Biggest Single Number**

**Question**
A single number is a number that appeared only once in the table. Find the largest single number.

Rules:
- If there is no single number, return null.

**Source table(s)**

```text
TABLE: MYNUMBERS
num
8
8
3
3
1
4
5
6
```

**Your SQL answer**

```sql



```

---# DATA ENGINEER SQL INTERVIEW CHALLENGE — PRACTICE WORKBOOK

**## 91. Swap Sex of Employees**

**Question**
Write an SQL query to swap all 'f' and 'm' values with a single update statement and no intermediate temp tables.

Rules:
- Must use an UPDATE statement.

**Source table(s)**

```text
TABLE: SALARY
id  name  sex  salary
1   A     m    2500
2   B     f    1500
3   C     m    5500
4   D     f    500
```

**Your SQL answer**

```sql



```

---

**## 92. Triangle Judgement**

**Question**
Report for every three line segments whether they can form a triangle.

Rules:
- Return x, y, z and triangle (Yes/No).

**Source table(s)**

```text
TABLE: TRIANGLE
x   y   z
13  15  30
10  20  15
```

**Your SQL answer**

```sql



```

---

**## 93. Arrange Table by Gender**

**Question**
Write an SQL query to rearrange the table such that the rows alternate in the order female, other, male.

Rules:
- Maintain relative order by user_id within each gender.

**Source table(s)**

```text
TABLE: GENDERS
user_id  gender
4        male
7        female
2        other
5        male
3        female
8        male
```

**Your SQL answer**

```sql



```

---

**## 94. Count Salary Categories**

**Question**
Calculate the number of bank accounts of each salary category.

Rules:
- Low Salary: < $20,000
- Average Salary: $20,000 to $50,000 inclusive
- High Salary: > $50,000. Include all categories even if 0.

**Source table(s)**

```text
TABLE: ACCOUNTS
account_id  income
3           108939
2           12747
8           87709
6           91796
```

**Your SQL answer**

```sql



```

---

**## 95. Calculate Special Bonus**

**Question**
Calculate the bonus of each employee. The bonus is 100% of their salary if the ID is an odd number and the employee's name does not start with 'M'.

Rules:
- Otherwise, the bonus is 0. Order by employee_id.

**Source table(s)**

```text
TABLE: EMPLOYEES
employee_id  name     salary
2            Meir     3000
3            Michael  3800
7            Addilyn  7400
8            Juan     6100
9            Kannon   7700
```

**Your SQL answer**

```sql



```

---

**## 96. Sales by Day of the Week**

**Question**
Report how many units in each category have been ordered on each day of the week.

Rules:
- Return Category, Monday, Tuesday... Sunday. Order by Category.

**Source table(s)**

```text
TABLE: ORDERS
order_id  customer_id  order_date  item_id  quantity
1         1            2020-06-01  1        10
2         1            2020-06-08  2        10
3         2            2020-06-02  1        5
TABLE: ITEMS
item_id  item_name  item_category
1        LC Algo 1  Book
2        LC Algo 2  Book
```

**Your SQL answer**

```sql



```

---

**## 97. Order Two Columns Independently**

**Question**
Write a query to independently order first_col in ascending order and second_col in descending order.

Rules:
- Return the result table.

**Source table(s)**

```text
TABLE: DATA
first_col  second_col
4          2
1          5
6          1
3          4
```

**Your SQL answer**

```sql



```

---

**## 98. Patients With Condition**

**Question**
Find patients who have Type I Diabetes (DIAB1 prefix).

Rules:
- Return patient_id, patient_name, conditions.

**Source table(s)**

```text
TABLE: PATIENTS
patient_id  patient_name  conditions
1           Daniel        YFEV COUGH
2           Alice
3           Bob           DIAB100     MYOP
```

**Your SQL answer**

```sql



```

---

**## 99. Group Employees Same Salary**

**Question**
Write a query to get the employee_id, name, salary, and a dense_rank of employees who share the same salary.

Rules:
- Only include salaries shared by >= 2 employees. Order by team_id
- (the rank), then employee_id.

**Source table(s)**

```text
TABLE: EMPLOYEES
employee_id  name     salary
2            Meir     3000
3            Michael  3000
7            Addilyn  7400
8            Juan     6100
9            Kannon   7700
1            Bob      7400
```

**Your SQL answer**

```sql



```

---

**## 100. Queries Quality and Percentage**

**Question**
Find each query_name, the quality and poor_query_percentage.

Rules:
- Quality = avg of rating / position. Poor % = % of queries with rating <
- 3. Round to 2 decimals.

**Source table(s)**

```text
TABLE: QUERIES
query_name  result   position  rating
Dog         Golden   1         5
Dog         German   2         5
Dog         Mule     200       1
Cat         Shirazi  5         2
Cat         Siamese  3         3
Cat         Sphynx   7         4
```

**Your SQL answer**

```sql



```

---

**## 101. Evaluate Boolean Expression**

**Question**
Evaluate the boolean expressions.

Rules:
- Return left_operand, operator, right_operand, and value ('true' or
- 'false').

**Source table(s)**

```text
TABLE: VARIABLES
name  value
x     66
y     77
TABLE: EXPRESSIONS
left_operand  operator  right_operand
x             >         y
x             <         y
x             =         y
```

**Your SQL answer**

```sql



```

---

**## 102. Apples & Oranges**

**Question**
Write an SQL query to report the difference between the number of apples and oranges sold each day.

Rules:
- Return the result table ordered by sale_date.

**Source table(s)**

```text
TABLE: SALES
sale_date   fruit    sold_num
2020-05-01  apples   10
2020-05-01  oranges  8
2020-05-02  apples   15
2020-05-02  oranges  15
```

**Your SQL answer**

```sql



```

---

**## 103. Leetflex Banned Accounts**

**Question**
Find the account_id of the accounts that should be banned.

Rules:
- An account is banned if it logged in from two different IP addresses
- at the same time.

**Source table(s)**

```text
TABLE: LOGINFO
account_id  ip_address  login  logout
2021-02-01  2021-02-01
1           1
09:00:00    09:30:00
2021-02-01  2021-02-01
1           2
08:00:00    11:30:00
2021-02-01  2021-02-01
2           6
20:30:00    22:00:00
```

**Your SQL answer**

```sql



```

---

**## 104. Team Scores Football Tournament**

**Question**
Calculate the points of each team. Points: 3 for win, 1 for draw, 0 for loss.

Rules:
- Order by num_points DESC, team_id ASC.

**Source table(s)**

```text
TABLE: TEAMS
team_id  team_name
10       Leetcode   FC
20       NewYork    FC
30       Atlanta    FC
40       Chicago    FC
50       Toronto    FC
TABLE: MATCHES
match_id  host_team  guest_team  host_goals  guest_goals
1         10         20          3           0
2         30         10          2           2
3         10         50          5           1
4         20         30          1           0
5         50         30          1           0
```

**Your SQL answer**

```sql



```

---

**## 105. Biggest Single Number**

**Question**
A single number is a number that appeared only once in the table. Find the largest single number.

Rules:
- If there is no single number, return null.

**Source table(s)**

```text
TABLE: MYNUMBERS
num
8
8
3
3
1
4
5
6
```

**Your SQL answer**

```sql



```

---

# DATA ENGINEER SQL INTERVIEW CHALLENGE — PRACTICE WORKBOOK

**## 106. Find Missing IDs**

**Question**
Find the missing customer IDs. The missing IDs are ones that are not in the table but are strictly between 1 and the max customer_id.

Rules:
- Return the result table ordered by ids in ascending order.

**Source table(s)**

```text
TABLE: CUSTOMERS
customer_id  customer_name
1            Alice
4            Bob
5            Charlie
```

**Your SQL answer**

```sql



```

---

**## 107. All Valid Triplets That Can Represent a Country**

**Question**
Find all valid triplets (member_A, member_B, member_C) representing student_name from each school.

Rules:
- A valid triplet has completely different names. Return the result table
- in any order.

**Source table(s)**

```text
TABLE: SCHOOLA
student_id  student_name
1           Alice
2           Bob
TABLE: SCHOOLB
student_id  student_name
3           Tom
TABLE: SCHOOLC
student_id  student_name
3           Jerry
4           Alice
```

**Your SQL answer**

```sql



```

---

**## 108. All Pairs With Maximum Common Followers**

**Question**
Find all pairs of users with the maximum number of common followers.

Rules:
- user1_id < user2_id. Return the result table in any order.

**Source table(s)**

```text
TABLE: RELATIONS
user_id  follower_id
1        3
2        3
1        4
2        4
1        5
2        6
3        7
```

**Your SQL answer**

```sql



```

---

**## 109. Strong Friendships**

**Question**
Find all the strong friendships. A friendship between user1_id and user2_id is strong if they have at least three common friends.

Rules:
- user1_id < user2_id. Return the result table in any order.

**Source table(s)**

```text
TABLE: FRIENDSHIP
user1_id  user2_id
1         2
1         3
2         3
1         4
2         4
1         5
2         5
1         7
3         7
1         6
3         6
2         6
```

**Your SQL answer**

```sql



```

---

**## 110. Employees Whose Manager Left the Company**

**Question**
Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company.

Rules:
- Manager left if their ID is missing from the table. Order by
- employee_id.

**Source table(s)**

```text
TABLE: EMPLOYEES
emp_id  name       manager_id  salary
3       Mila       9           60301
12      Antonella  null        31000
13      Emery      null        67084
1       Kalel      11          21241
9       Mikaela    null        50937
11      Joziah     6           28485
```

**Your SQL answer**

```sql



```

---

**## 111. Activity Participants**

**Question**
Find the names of all the activities with neither the maximum nor the minimum number of participants.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: FRIENDS
id  name      activity
1   Jonathan  Eating
2   Jade      Singing
3   Victor    Singing
4   Elvis     Eating
5   Daniel    Eating
6   Bob       Horse Riding
TABLE: ACTIVITIES
id  name
1   Eating
2   Singing
3   Horse Riding
```

**Your SQL answer**

```sql



```

---

**## 112. User Purchases**

**Question**
Find the names of users who bought both 'Apple' and 'Samsung'.

Rules:
- Return result in any order.

**Source table(s)**

```text
TABLE: USERS
user_id  name
1        Alice
2        Bob
3        Charlie
TABLE: PURCHASES
user_id  item
1        Apple
1        Samsung
2        Apple
```

**Your SQL answer**

```sql



```

---

**## 113. Find Customers With Positive Revenue this
Year**

**Question**
Write an SQL query to report the customers with positive revenue in the year 2021.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: CUSTOMERS
customer_id  year  revenue
1            2018  50
1            2021  30
1            2020  70
2            2021  -50
3            2021  50
4            2021  20
```

**Your SQL answer**

```sql



```

---

**## 114. Customers Who Bought All Products**

**Question**
Write an SQL query to report the customer ids from the Customer table that bought all the products in the Product table.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: CUSTOMER
customer_id  product_key
1            5
2            6
3            5
3            6
1            6
TABLE: PRODUCT
product_key
5
6
```

**Your SQL answer**

```sql



```

---

**## 115. Unique Email Addresses**

**Question**
Determine how many unique email addresses exist. Rules for local name: uppercase is treated as lowercase. '+' ignores everything after it in local name.

Rules:
- Note: We use string operations rather than sets, but union/distinct is
- key. Return just the count.

**Source table(s)**

```text
TABLE: EMAILS
id  email
1   a@b.com
2   A@b.com
3   a+1@b.com
4   c@d.com
```

**Your SQL answer**

```sql



```

---
# DATA ENGINEER SQL INTERVIEW CHALLENGE — PRACTICE WORKBOOK

**## Replace Employee ID Unique Identifier**

**Question**
Show the unique_id of each user, If a user doesn't have a unique_id replace with null.

Rules:
- Return result ordered by unique_id (desc).

**Source table(s)**

```text
TABLE: EMPLOYEES
id  name
1   Alice
7   Bob
TABLE: EMPLOYEEUNI
id  unique_id
3   10
1   20
```

**Your SQL answer**

```sql



```

---

**## Find Customer Referee**

**Question**
Report the names of the customer that are not referred by the customer with id = 2.

Rules:
- Return result table in any order.
- Remember how NULLs behave in comparisons!

**Source table(s)**

```text
TABLE: CUSTOMER
id  name  referee_id
1   Will  null
2   Jane  null
3   Alex  2
4   Bill  null
5   Zack  1
6   Mark  2
```

**Your SQL answer**

```sql



```

---

**## Rearrange Products Table**

**Question**
Rearrange the Products table so that each row has (product_id, store, price).

Rules:
- If a product is not available in a store, do not include a row.
- Return table in any order.

**Source table(s)**

```text
TABLE: PRODUCTS
product_id  store1  store2  store3
0           95      100     105
1           70      null    80
```

**Your SQL answer**

```sql



```

---

**## Bank Account Summary**

**Question**
Calculate the current balance for all users. Balance = initial + received - paid.

Rules:
- Return user_id, user_name, credit, and credit_limit_breached ('Yes'
- or 'No').
- Breached if balance < 0.

**Source table(s)**

```text
TABLE: USERS
user_id  user_name  credit
1        Moustafa   100
2        Jonathan   200
TABLE: TRANSACTIONS
trans_id  paid_by  paid_to  amount
1         1        2        400
2         2        1        200
```

**Your SQL answer**

```sql



```

---

**## Bank Account Summary II**

**Question**
Report the name and balance of users with a balance higher than 10000.

Rules:
- Balance = sum of all transactions involving that account.
- Return result in any order.

**Source table(s)**

```text
TABLE: USERS
account  name
900001   Alice
900002   Bob
TABLE: TRANSACTIONS
trans_id  account  amount
1         900001   7000
2         900001   7000
3         900002   1000
```

**Your SQL answer**

```sql



```

---

**## Unique Orders and Customers Per Month**

**Question**
Find the number of unique orders and unique customers per month where the invoice is strictly > $20.

Rules:
- Return the result table in any order.

**Source table(s)**

```text
TABLE: ORDERS
order_id  order_date  customer_id  invoice
1         2020-09-15  1            10
2         2020-09-17  2            20
3         2020-10-01  1            30
```

**Your SQL answer**

```sql



```

---

**## Delete Duplicate Emails**

**Question**
Delete all duplicate email entries in the Person table, keeping only unique emails based on their smallest id.

Rules:
- This must be a DELETE statement.
- After deletion, the Person table should not contain duplicates.
- Return result in any order.

**Source table(s)**

```text
TABLE: PERSON
id  email
1   john@example.com
2   bob@example.com
3   john@example.com
```

**Your SQL answer**

```sql



```

---

**## Unique Email Addresses**

**Question**
Find how many unique email addresses actually receive mail.

Rules:
- Rules: Uppercase is treated as lowercase.
- '.': ignore periods in local name (before '@').
- '+': ignore everything after it in local name.

**Source table(s)**

```text
TABLE: EMAILS
id email
1 test.email+alex@leetcode.com
2 test.e.mail+bob.cathy@leetcode.com
3 testemail+david@lee.tcode.com
```

**Your SQL answer**

```sql



```

---

**## Products Price for Each Store**

**Question**
Find the price of each product in each store.

Rules:
- Result should have (product_id, store1, store2, store3).
- Use conditional aggregation or pivot-like logic.
- Return table in any order.

**Source table(s)**

```text
TABLE: PRODUCTS
product_id  store   price
0           store1  95
0           store3  105
0           store2  100
1           store1  70
```

**Your SQL answer**

```sql



```

---

**## Suspicious Bank Accounts**

**Question**
Find the account_id of suspicious bank accounts.

Rules:
- Suspicious: Creditor income in two or more *consecutive* months
- strictly exceeds max_income.
- Creditor income = sum of Creditor amounts in a month.
- Return result in any order.

**Source table(s)**

```text
TABLE: ACCOUNTS
account_id  max_income
1           1000
2           5000
3           2000
TABLE: TRANSACTIONS
trans_id  account_id  type      amount  day
1         1           Creditor  1200    2021-01-01
2         1           Creditor  1000    2021-02-01
3         2           Creditor  6000    2021-01-15
4         2           Creditor  200     2021-01-16
```

**Your SQL answer**

```sql



```

---

**## Orders Max Quantity Above Average**

**Question**
Report the order_id of all orders where the maximum quantity in that order is strictly > the overall average quantity of all orders.

Rules:
- Return the result table in any order.
- Remember the difference between MAX per order vs OVERALL
- AVG.

**Source table(s)**

```text
TABLE: ORDERS
order_id  product_id  quantity
1         1           12
1         2           10
1         3           15
2         1           8
3         1           20
3         2           20
```

**Your SQL answer**

```sql



```

---

**## Grand Slam Titles**

**Question**
Write an SQL query to report the number of grand slam titles won by each player.

Rules:
- A grand slam is wimbledon, fr_open, us_open, au_open.
- Do not include players who did not win any title.
- Return result in any order.

**Source table(s)**

```text
TABLE: PLAYERS
player_id  player_name
1          Alice
2          Bob
3          Charlie
TABLE: CHAMPIONSHIPS
year  wimbledon  fr_open  us_open  au_open
2020  1          1        1        1
2021  1          2        1        3
2022  1          3        2        3
```

**Your SQL answer**

```sql



```

---

**## Fix Product Name Format**

**Question**
Since table data was entered by different people, the product_name is very inconsistent. Write a query to return the lowercase, space- trimmed product_name and the total number of sales for that product.

Rules:
- Format product_name to lower case and remove leading/trailing
- spaces.
- Return result ordered by product_name.

**Source table(s)**

```text
TABLE: SALES
sale_id  product_name  sale_date
1        LCPHONE       2000-01-16
2        LCPhone       2000-01-17
3        LcPhOnE       2000-02-18
4        LCKeyCHain    2000-02-19
```

**Your SQL answer**

```sql



```

---

**## Hotel Booking Cancellations**

**Question**
Report the cancellation rate of hotel bookings.

Rules:
- Cancellation rate = Canceled bookings / Total bookings.
- Return booking_date, canceled_rate.
- Group by booking_date, return result in any order.

**Source table(s)**

```text
TABLE: BOOKINGS
booking_id  hotel_id  status     booking_date
1           101       Canceled   2022-01-01
2           101       Completed  2022-01-01
3           102       Canceled   2022-01-02
```

**Your SQL answer**

```sql



```

---

**## User Purchases (Multiple Products)**

**Question**
Report the customer_ids that bought both product '5' and product '6'.

Rules:
- Return the result table ordered by customer_id (asc).

**Source table(s)**

```text
TABLE: CUSTOMER
customer_id  product_id
1            5
2            6
3            5
3            6
1            6
TABLE: PRODUCT
product_id
5
6
```

**Your SQL answer**

```sql



```

---