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
