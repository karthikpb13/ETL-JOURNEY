
# SQL Interview Questions

## 1) Find Duplicate Records

```sql
SELECT EMAIL, COUNT(*) AS CNT
FROM EMPLOYEE
GROUP BY EMAIL
HAVING COUNT(*) > 1;
```

## 2) Find Nth Highest Salary (Third Highest)

```sql
SELECT DISTINCT SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC
LIMIT 1 OFFSET 2;
```

## 3) Find Missing Numbers

```sql
SELECT LEVEL
FROM DUAL
CONNECT BY LEVEL <= (SELECT MAX(ID) FROM TABLE)
MINUS
SELECT ID FROM TABLE;
```

## 4) Find NULL Values

```sql
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT IS NULL;
```

## 5) Delete Duplicates (Keep One)

```sql
DELETE FROM EMPLOYEE
WHERE ID NOT IN (
    SELECT MAX(ID)
    FROM EMPLOYEE
    GROUP BY EMAIL
);
```

```sql
DELETE FROM EMPLOYEE
WHERE ID IN (
    SELECT ID
    FROM (
        SELECT ID,
               EMAIL,
               ROW_NUMBER() OVER (
                   PARTITION BY EMAIL ORDER BY ID
               ) AS RN
        FROM EMPLOYEE
    )
    WHERE RN > 1
);
```

## 6) Find Second Highest Salary

```sql
SELECT DISTINCT SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC
LIMIT 1 OFFSET 1;
```

```sql
SELECT MAX(SALARY) AS SEC_HIGH_SAL
FROM EMPLOYEE
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE);
```

## 7) Top N Records Per Group

```sql
SELECT *
FROM (
    SELECT EMP_ID,
           NAME,
           DEPT_ID,
           DEPARTMENT,
           SALARY,
           ROW_NUMBER() OVER (
               PARTITION BY DEPT_ID
               ORDER BY SALARY DESC
           ) AS RN
    FROM EMPLOYEE
)
WHERE RN <= 2;
```

## 8) Find Consecutive Dates

```sql
SELECT A.USER_ID, A.LOGIN_DATE
FROM LOGIN A
JOIN LOGIN B
    ON A.USER_ID = B.USER_ID
   AND B.LOGIN_DATE = A.LOGIN_DATE + 1;
```

## 9) Find Running Sum

```sql
SELECT DATE,
       AMOUNT,
       SUM(AMOUNT) OVER (
           ORDER BY DATE
       ) AS RUNNING_SUM
FROM SALES;
```

## 10) Categorize Employees Based on Salary

```sql
SELECT NAME,
       SALARY,
       CASE
           WHEN SALARY >= 10000 THEN 'HIGH'
           WHEN SALARY BETWEEN 5000 AND 9999 THEN 'MID'
           ELSE 'LOW'
       END AS SALARY_COMPARISON
FROM EMPLOYEE;
```

## 11) Get Random Records

```sql
SELECT *
FROM EMPLOYEE
ORDER BY DBMS_RANDOM.VALUE
FETCH FIRST 10 ROWS ONLY;
```

## 12) Get Sample Records in Databricks

```sql
SELECT *
FROM EMPLOYEE
ORDER BY RAND()
LIMIT 10;

-- Approximately 10% records
SELECT *
FROM EMPLOYEE
WHERE RAND() < 0.10;

-- Approximately 10% of records
SELECT *
FROM EMPLOYEE
TABLESAMPLE (10 PERCENT);
```

## 13) Find Customers Who Placed Orders Every Month

```sql
SELECT CUSTOMER_ID
FROM ORDERS
WHERE EXTRACT(YEAR FROM ORDER_DATE) = 2023
GROUP BY CUSTOMER_ID
HAVING COUNT(DISTINCT TO_CHAR(ORDER_DATE, 'YYYY-MM')) = 12;
```

## 14) Moving Average Sales Over the Last 3 Days

```sql
SELECT ORDER_DATE,
       AVG(TOTAL_AMOUNT) OVER (
           ORDER BY ORDER_DATE
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS MOVING_AVG
FROM ORDERS;
```

## 15) Top-Performing Department by Average Salary

```sql
SELECT DEPARTMENT_ID,
       AVG(SALARY) AS AVG_SAL
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
ORDER BY AVG_SAL DESC;
```

## 16) Find Churned Customers (No Orders in Last 6 Months)

```sql
-- Oracle
SELECT CUSTOMER_ID
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING MAX(ORDER_DATE) < ADD_MONTHS(SYSDATE, -6);

-- Databricks
SELECT CUSTOMER_ID
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING MAX(ORDER_DATE) < ADD_MONTHS(CURRENT_DATE(), -6);
```

## 17) Total Revenue and Number of Orders Per Region

```sql
SELECT REGION,
       SUM(ORDER_AMOUNT) AS TOT_AMOUNT,
       COUNT(*) AS ORD_CNT
FROM ORDERS
GROUP BY REGION;
```

## 18) Customers Who Purchased but Never Returned a Product

```sql
SELECT DISTINCT C.CUSTOMER_ID
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.CUSTOMER_ID NOT IN (
    SELECT DISTINCT CUSTOMER_ID
    FROM RETURNS
);
```

## 19) Triangle Judgement

```sql
SELECT X, Y, Z,
       CASE
           WHEN X + Y > Z
            AND Y + Z > X
            AND Z + X > Y
           THEN 'Yes'
           ELSE 'No'
       END AS TRIANGLE
FROM TRIANGLE;
```

## 20) Find Consecutive Numbers

```sql
SELECT DISTINCT NUM AS ConsecutiveNums
FROM (
    SELECT NUM,
           LEAD(NUM, 1) OVER (ORDER BY ID) AS NXT1,
           LEAD(NUM, 2) OVER (ORDER BY ID) AS NXT2
    FROM LOGS
)
WHERE NUM = NXT1
  AND NUM = NXT2;
```

## 21) Customers Who Bought Every Product

```sql
SELECT CUSTOMER_ID
FROM CUSTOMER
GROUP BY CUSTOMER_ID
HAVING COUNT(DISTINCT PRODUCT_KEY) = (
    SELECT COUNT(DISTINCT PRODUCT_KEY)
    FROM PRODUCT
);
```

## 22) Customer's Running Wallet Balance

```sql
SELECT CUSTOMER_ID,
       TXN_TYPE,
       AMOUNT,
       SUM(
           CASE
               WHEN TXN_TYPE = 'CREDIT' THEN AMOUNT
               WHEN TXN_TYPE = 'DEBIT' THEN -AMOUNT
           END
       ) OVER (
           PARTITION BY CUSTOMER_ID
           ORDER BY TXN_DATE
       ) AS RUNNING_BALANCE
FROM TRANSACTIONS;
```

## 23) Find the Subject With the Lowest Marks

### Particular Student

```sql
SELECT STUDENT,
       CASE
           WHEN MATHS <= PHYSICS AND MATHS <= CHEMISTRY
               THEN 'Maths'
           WHEN PHYSICS <= CHEMISTRY
               THEN 'Physics'
           ELSE 'Chemistry'
       END AS LOWEST_SUBJECT,
       LEAST(MATHS, PHYSICS, CHEMISTRY) AS LOWEST_MARK
FROM STUDENTS
WHERE STUDENT = 'Rahul';
```

### All Students

```sql
SELECT STUDENT,
       CASE
           WHEN MATHS <= PHYSICS AND MATHS <= CHEMISTRY
               THEN 'Maths'
           WHEN PHYSICS <= CHEMISTRY
               THEN 'Physics'
           ELSE 'Chemistry'
       END AS LOWEST_SUBJECT,
       LEAST(MATHS, PHYSICS, CHEMISTRY) AS LOWEST_MARK
FROM STUDENTS;
```

### Count Students Weakest in Each Subject

```sql
SELECT LOWEST_SUBJECT,
       COUNT(*) AS STUDENT_COUNT
FROM (
    SELECT CASE
               WHEN MATHS <= PHYSICS AND MATHS <= CHEMISTRY
                   THEN 'Maths'
               WHEN PHYSICS <= CHEMISTRY
                   THEN 'Physics'
               ELSE 'Chemistry'
           END AS LOWEST_SUBJECT
    FROM STUDENTS
) T
GROUP BY LOWEST_SUBJECT;
```

## 24) Convert Columns to Rows (UNPIVOT)

```sql
SELECT STD_ID, TERM1 AS TERM
FROM STUDENT_TERMS

UNION ALL

SELECT STD_ID, TERM2
FROM STUDENT_TERMS

UNION ALL

SELECT STD_ID, TERM3
FROM STUDENT_TERMS;
```

## 25) Names Starting With Vowels

```sql
SELECT NAME
FROM STD
WHERE SUBSTR(UPPER(NAME), 1, 1) IN ('A', 'E', 'I', 'O', 'U');
```

```sql
SELECT NAME
FROM STD
WHERE REGEXP_LIKE(UPPER(NAME), '^[AEIOU]');
```

## 26) Names Starting and Ending With Vowels

```sql
SELECT NAME
FROM STD
WHERE SUBSTR(UPPER(NAME), 1, 1) IN ('A', 'E', 'I', 'O', 'U')
  AND SUBSTR(UPPER(NAME), -1) IN ('A', 'E', 'I', 'O', 'U');
```

## 27) Names Starting With Consonants

```sql
SELECT NAME
FROM STD
WHERE SUBSTR(UPPER(NAME), 1, 1)
      NOT IN ('A', 'E', 'I', 'O', 'U');
```

## 28) Last Person to Fit on the Bus

```sql
SELECT PERSON_NAME
FROM (
    SELECT PERSON_NAME,
           WEIGHT,
           SUM(WEIGHT) OVER (
               ORDER BY TURN
           ) AS TOT_WEIGHT
    FROM QUEUE
) A
WHERE TOT_WEIGHT <= 1000
ORDER BY TOT_WEIGHT DESC
LIMIT 1;
```

## 29) Count Salary by Category

```sql
SELECT 'HIGH SALARY' AS CATEGORY,
       COUNT(CASE WHEN INCOME > 50000 THEN 1 END) AS ACCOUNTS_COUNT
FROM ACCOUNTS

UNION

SELECT 'AVERAGE SALARY',
       COUNT(CASE WHEN INCOME BETWEEN 20000 AND 50000 THEN 1 END)
FROM ACCOUNTS

UNION

SELECT 'LOW SALARY',
       COUNT(CASE WHEN INCOME < 20000 THEN 1 END)
FROM ACCOUNTS;
```

## 30) Employees Whose Manager Left the Company and Salary Is Less Than 30000

```sql
SELECT EMPLOYEE_ID
FROM EMPLOYEES
WHERE MANAGER_ID NOT IN (
    SELECT EMPLOYEE_ID
    FROM EMPLOYEES
)
AND SALARY < 30000
ORDER BY EMPLOYEE_ID;
```

## 31) Exchange Seats

```sql
SELECT *
FROM (
    SELECT LEAD(ID) OVER (ORDER BY ID) AS ID,
           STUDENT
    FROM SEAT
) A
WHERE MOD(ID, 2) = 0

UNION ALL

SELECT *
FROM (
    SELECT LAG(ID) OVER (ORDER BY ID) AS ID,
           STUDENT
    FROM SEAT
) B
WHERE MOD(ID, 2) = 1

UNION ALL

SELECT ID, STUDENT
FROM SEAT
WHERE ID = (SELECT MAX(ID) FROM SEAT)
  AND MOD(ID, 2) = 1

ORDER BY ID;
```

## 32) Movie Rating (Lexicographical Ordering)

```sql
(
    SELECT U.NAME AS RESULTS
    FROM MOVIERATING MR
    JOIN USERS U
        ON MR.USER_ID = U.USER_ID
    GROUP BY U.USER_ID, U.NAME
    ORDER BY COUNT(*) DESC, U.NAME ASC
    LIMIT 1
)

UNION ALL

(
    SELECT M.TITLE AS RESULTS
    FROM MOVIES M
    JOIN MOVIERATING MR
        ON M.MOVIE_ID = MR.MOVIE_ID
    WHERE MR.CREATED_AT >= '2020-02-01'
      AND MR.CREATED_AT < '2020-03-01'
    GROUP BY M.MOVIE_ID, M.TITLE
    ORDER BY AVG(MR.RATING) DESC, M.TITLE ASC
    LIMIT 1
);
```

## 33) Restaurant Growth (Moving Average)

```sql
SELECT *
FROM (
    SELECT DISTINCT
           TO_CHAR(VISITED_ON + 6, 'YYYY-MM-DD') AS VISITED_ON,
           SUM(AMOUNT) OVER (
               ORDER BY VISITED_ON
               RANGE BETWEEN CURRENT ROW
               AND INTERVAL '6' DAY FOLLOWING
           ) AS AMOUNT,
           ROUND(
               SUM(AMOUNT) OVER (
                   ORDER BY VISITED_ON
                   RANGE BETWEEN CURRENT ROW
                   AND INTERVAL '6' DAY FOLLOWING
               ) / 7,
               2
           ) AS AVERAGE_AMOUNT
    FROM CUSTOMER
)
WHERE VISITED_ON <= (
    SELECT MAX(VISITED_ON)
    FROM CUSTOMER
)
ORDER BY VISITED_ON;
```

## 34) Friend Requests II: Who Has the Most Friends

```sql
SELECT ID,
       COUNT(*) AS NUM
FROM (
    SELECT REQUESTER_ID AS ID
    FROM REQUESTACCEPTED

    UNION ALL

    SELECT ACCEPTER_ID AS ID
    FROM REQUESTACCEPTED
) T
GROUP BY ID
ORDER BY NUM DESC, ID ASC
LIMIT 1;
```

## 35) Capitalize the First Letter

```sql
SELECT USER_ID,
       UPPER(SUBSTR(NAME, 1, 1))
       || LOWER(SUBSTR(NAME, 2)) AS NAME
FROM USERS
ORDER BY USER_ID;
```

## 36) Second Highest Salary

```sql
SELECT COALESCE(MAX(SALARY), NULL) AS SecondHighestSalary
FROM EMPLOYEE
WHERE SALARY < (
    SELECT MAX(SALARY)
    FROM EMPLOYEE
);
```

## 37) Group Products Sold by Date

```sql
SELECT SELL_DATE,
       COUNT(DISTINCT PRODUCT) AS NUM_SOLD,
       GROUP_CONCAT(
           DISTINCT PRODUCT
           ORDER BY PRODUCT ASC
       ) AS PRODUCTS
FROM ACTIVITIES
GROUP BY SELL_DATE
ORDER BY SELL_DATE;
```

### Oracle

```sql
SELECT SELL_DATE,
       COUNT(DISTINCT PRODUCT) AS NUM_SOLD,
       LISTAGG(PRODUCT, ',')
           WITHIN GROUP (ORDER BY PRODUCT) AS PRODUCTS
FROM (
    SELECT DISTINCT SELL_DATE, PRODUCT
    FROM ACTIVITIES
)
GROUP BY SELL_DATE
ORDER BY SELL_DATE;
```

## 38) Products Sold in February 2020

```sql
SELECT P.PRODUCT_NAME,
       SUM(O.UNIT) AS UNIT
FROM PRODUCTS P
JOIN ORDERS O
    ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE O.ORDER_DATE >= '2020-02-01'
  AND O.ORDER_DATE < '2020-03-01'
GROUP BY P.PRODUCT_NAME
HAVING SUM(O.UNIT) >= 100;
```

## 39) Users With Valid Emails

```sql
SELECT USER_ID, NAME, MAIL
FROM USERS
WHERE REGEXP_LIKE(
    MAIL,
    '^[A-Za-z][A-Za-z0-9._-]*@leetcode\.com$',
    'c'
);
```

## 40) Riders Who Took at Least One Trip Every Day for the Last 10 Days

```sql
SELECT RIDER_ID
FROM TRIPS
WHERE TRIP_DATE BETWEEN '2020-01-01' AND '2020-01-10'
GROUP BY RIDER_ID
HAVING COUNT(DISTINCT TRIP_DATE) = 10;
```

## 41) Select Monthly Signups

```sql
SELECT MONTH(SIGNUP_DATE) AS MONTH,
       COUNT(*) AS NUM_SIGNUPS
FROM USERS
WHERE SIGNUP_DATE BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY MONTH(SIGNUP_DATE)
ORDER BY MONTH;
```

## 42) Pending
