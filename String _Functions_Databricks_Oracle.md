# SQL Practice: Student Table (std)

## Reference: SPLIT_PART

```sql
SPLIT_PART(string, delimiter, part_number)
```

- **string:** The input string.
- **delimiter:** The character or substring used to split the string.
- **part_number:** The part you want to return, starting from 1.

## View the table

```sql
SELECT * FROM std;
```

## 1. Display the current system date.

```sql
SELECT current_date;
```

## 2. Display the first 5 characters of every student's name.

```sql
SELECT SUBSTR(STUDENT_NAME,1,5) FROM std;
```

## 3. Display the last day of the current month.

```sql
SELECT Last_day(current_date);
```

## 4. Display only students whose email contains 'gmail'.

```sql
SELECT STUDENT_NAME,EMAIL
FROM std
WHERE UPPER(EMAIL) LIKE '%GMAIL%';
```

## 5. Display the next Monday after today's date.

```sql
SELECT NEXT_DAY(current_date,'monday')
```

## 6. Display the first letter of every course.

```sql
SELECT SUBSTR(COURSE,1,1) FROM STD;
```

## 7. Display each student's name along with the last 4 characters of their email.

```sql
SELECT STUDENT_NAME, EMAIL, SUBSTR(EMAIL,-4) FROM STD;
```

## 8. Display the joining date after adding 3 months.

```sql
SELECT ADD_MONTHS(CURRENT_DATE,3);
```

## 9. Display only the username part of every email address.

```sql
SELECT SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) AS USERNAME
FROM STD;
```

## 10. Display students who joined before today's date.

```sql
SELECT * FROM stD
WHERE join_date<CURRENT_DATE;
```

## 11. Display each student's experience in months since joining.

```sql
SELECT STUDENT_NAME, months_between(CURRENT_DATE,JOIN_DATE) AS EXP FROM STD;
```

## 12. Display only students whose city starts with 'B'.

```sql
SELECT STUDENT_NAME
FROM std
WHERE CITY LIKE 'B%';
```

## 13. Display the domain name of every email.

```sql
SELECT SUBSTR(EMAIL,INSTR(EMAIL,'@')+1) AS DOMAIN
FROM STD;
```

## 14. Display the next Friday after each student's joining date.

```sql
SELECT STUDENT_NAME, NEXT_DAY(JOIN_DATE, 'FRIDAY') AS NXT_JOIN_FRIDAY
FROM STD;
```

## 15. Display students whose names contain 'AN'.

```sql
SELECT STUDENT_NAME
FROM std
WHERE STUDENT_NAME LIKE '%AN';
```

## 16. Display students whose names end with 'A'.

```sql
SELECT STUDENT_NAME
FROM std
WHERE SUBSTR(STUDENT_NAME,-1) = 'A';
```

## 17. Display the last day of each student's joining month.

```sql
SELECT S.*, LAST_DAY(JOIN_DATE) LST_DAY
FROM STD;
```

## 18. Display students who joined after 31-DEC-2023.

```sql
SELECT * FROM STD
WHERE JOIN_DATE>DATE '31-12-2023';

SELECT * FROM STD;

DESC STD;

SELECT *
FROM STD
WHERE JOIN_DATE > DATE '2024-12-31';

SELECT TO_DATE('31-DEC-2024', 'dd-MMM-yyyy');
```

## 19. Display the first name only from STUDENT_NAME.

```sql
SELECT SUBSTR(STUDENT_NAME,1,INSTR(STUDENT_NAME,' ')-1) AS FIRST_NAME
FROM std;

SELECT STUDENT_NAME
FROM STD;

SELECT
    SPLIT('KARTHIK P BHADANGE', ' ')[0] AS FIRST_NAME,
    SPLIT('KARTHI P BHADANGE', ' ')[1] AS MID_NAME,
    SPLIT('KARTHIK P BHADANGE', ' ')[2] AS LAST_NAME
;
```

## 20. Display students older than 22 years.

```sql
SELECT * FROM std
WHERE ROUND(MONTHS_BETWEEN(current_date,DOB)/12) > 22;

SELECT * FROM STD
WHERE YEAR(CURRENT_DATE)-YEAR(DOB)>22;
```

## 21. Display students who joined exactly one year ago.

```sql
SELECT * FROM STD
WHERE ROUND(MONTHS_BETWEEN(current_date(),JOIN_DATE)/12)=1;
```

## 22. Display the first 3 characters of every city.

```sql
SELECT SUBSTR(CITY,1,3) AS FIRST_3_CHAR_CITY
FROM STD;
```

## 23. Display students whose email contains '@'.

```sql
SELECT * 
FROM STD
WHERE EMAIL LIKE '%@%';
```

## 24. Display the first 4 characters of the course name.

```sql
SELECT SUBSTR(COURSE,1,4) AS FRST_4_CHAR
FROM STD;
```

## 25. Display students whose city contains the letter 'A'.

```sql
SELECT * FROM STD
WHERE UPPER(CITY) LIKE '%A%';
```

## 26. Display students whose email provider is gmail.com (Do not use LIKE).

```sql
SELECT * FROM STD
WHERE UPPER(SUBSTR(EMAIL,INSTR(EMAIL,'@')+1))='GMAIL.COM';
```

## 27. Display the position of '@' in every email.

```sql
SELECT INSTR(EMAIL,'@') AS POS FROM STD;
```

## 28. Display students who have been studying for more than 18 months.

```sql
SELECT * FROM STD
WHERE MONTHS_BETWEEN(current_timestamp,JOIN_DATE)>18;
```

## 29. Display each student's age in years (rounded to 2 decimal places).

```sql
SELECT sTUDENT_NAME, ROUND(MONTHS_BETWEEN(CURRENT_DATE,DOB)/12) AS AGE 
FROM STD;
```

## 30. Display students whose names have 'A' as the second character.

```sql
SELECT * FROM STD
WHERE INSTR(STUDENT_NAME,'A')=2;
```

## 31. Display students whose email username contains a dot (.)

```sql
SELECT * FROM STD
WHERE SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) LIKE '%.%';
```

## 32. Display the joining date after adding one year.

```sql
SELECT S.*, ADD_MONTHS(JOIN_DATE,12) AS ADDING_1_YR
FROM STD S;
```

## 33. Display students whose city contains the letter 'A' at least twice.

```sql
SELECT * FROM STD
WHERE INSTR(CITY,'A',1,2)>0;
```

## 34. Display students born in the month of May.

```sql
SELECT * FROM STD
WHERE MONTH(DOB)=5;
```

## 35. Display the first 3 characters of CITY and the last 3 characters of STUDENT_NAME.

```sql
SELECT CONCAT(SUBSTR(CITY, 1,3), SUBSTR(STUDENT_NAME,-3)) AS STD_NAME
FROM STD;
```

## 36. Display students whose email ends with '.com' without using LIKE.

```sql
SELECT * FROM std
WHERE SUBSTR(UPPER(EMAIL), -4) <>'.COM';
```

## 37. Display students who joined in the current year.

```sql
SELECT * FROM STD
WHERE YEAR(JOIN_DATE) = YEAR(CURRENT_DATE);
```

## 38. Display students whose birthday month is the current month.

```sql
SELECT * FROM STD
WHERE MONTH(DOB)=10;
```

## 39. Display students whose email domain is yahoo.com.

```sql
SELECT * FROM std
WHERE UPPER(SPLIT(EMAIL, '@')[1]) = 'YAHOO.COM';
```

## 40. Display the next Sunday after each student's date of birth.

```sql
SELECT STUDENT_NAME, DOB,next_day(DOB,'SUNDAY') AS NEXT_SUNDAY_FRM_DOB
FROM STD;
```

## 41. Display students whose joining anniversary falls in the current month.

```sql
SELECT * FROM std
WHERE MONTH(JOIN_dATE)= 10;
```

## 42. Display students whose email domain is NOT gmail.com.

```sql
SELECT * FROM STD
WHERE UPPER(SUBSTR(EMAIL,INSTR(EMAIL,'@')+1))='GMAIL.COM';
```

## 43. Display the number of months remaining to complete 2 years from the joining date.

```sql
SELECT STUDENT_NAME, JOIN_DATE, 24- CEIL(MONTHS_BETWEEN(current_date(),JOIN_DATE)) REM_MONTHS
FROM STD
WHERE CEIL(MONTHS_BETWEEN(current_date(),JOIN_DATE))<24;
```

## 44. Display students who joined on the last day of any month.

```sql
SELECT * FROM STD
WHERE JOIN_DATE=LAST_DAY(JOIN_DATE);
```

## 45. Display students whose email username is longer than 10 characters.

```sql
SELECT * FROM STD
WHERE LENGTH(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')+1)) > 10;
```

## 46. Display students whose names contain more than one 'A'.

```sql
SELECT * FROM STD
WHERE INSTR(STUDENT_NAME,'A',1,2)>0;
```

## 47. Display students whose first name starts with 'R' and whose email provider is gmail.com.

```sql
SELECT * FROM STD
WHERE UPPER(STUDENT_NAME) LIKE 'R%' AND UPPER(SUBSTR(EMAIL,INSTR(EMAIL,'@')+1)) = 'GMAIL.COM';
```

## 48. Display students whose joining month is the same as their birth month.

```sql
SELECT * FROM STD
WHERE TRIM(TO_CHAR(JOIN_DATE,'MONTH'))=TRIM(TO_CHAR(DOB,'MONTH'));
```

## 49. Display students whose email username starts with the same letter as their name.

```sql
SELECT * FROM STD
WHERE UPPER(SUBSTR(STUDENT_NAME,1,1))=UPPER(SUBSTR(EMAIL,1,1));
```

## 50. Display students whose email provider appears more than once in the table.

```sql
SELECT SUBSTR(EMAIL,INSTR(EMAIL,'@')+1) AS EMAIL_PROVIDER FROM STD
GROUP BY SUBSTR(EMAIL,INSTR(EMAIL,'@')+1)
HAVING COUNT(SUBSTR(EMAIL,INSTR(EMAIL,'@')+1))>1;
```

## 51. Display only the email usernames in uppercase.

```sql
SELECT EMAIL, UPPER(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1)) USERNAME 
FROM STD;
```

## 52. Display students whose email provider is either gmail.com or yahoo.com.

```sql
SELECT * FROM STD
WHERE UPPER(SUBSTR(EMAIL,INSTR(EMAIL,'@')+1)) IN ('GMAIL.COM','YAHOO.COM');
```

## 53. Display students whose names contain 'RA' but do not start with 'R'.

```sql
SELECT * FROM STD
WHERE STUDENT_NAME LIKE '%RA%' AND STUDENT_NAME NOT LIKE 'R%';
```

## 54. Display students whose joining month has already passed in the current year.

```sql
SELECT * FROM STD
WHERE TRIM(TO_CHAR(current_date(),'MM')) > TRIM(TO_CHAR(JOIN_DATE,'MM'));
```

## 55. Display the number of complete years each student has studied.

```sql
SELECT S.* , ROUND(MONTHS_BETWEEN(current_date,JOIN_DATE)/12,2) AS EXPR
FROM STD S;
```

## 56. Display students whose birthday will occur within the next 30 days.

```sql
SELECT * FROM STD
WHERE TO_CHAR(DOB,'MMDD') BETWEEN TO_CHAR(current_date,'MMDD') AND TO_CHAR(current_date+30,'MMDD');
```

## 57. Display students who joined on a Monday.

```sql
SELECT S.*, JOIN_DATE, dayofweek(JOIN_DATE) AS JOIN_DAY
FROM STD S
WHERE dayofweek(JOIN_DATE) = 2
```

## 58. Display students who joined on the same weekday as today.

```sql
SELECT S.*, date_format(JOIN_DATE,'EEEE') JOIN_DAY
FROM STD S
WHERE date_format(JOIN_DATE,'EEEE')=date_format(current_date(),'EEEE');

SELECT * FROM std
WHERE day(JOIN_DATE)=DAY(current_date);

SELECT * FROM STD 
WHERE dayofweek(JOIN_DATE)=dayofweek(current_date);
```

## 59. Display students whose email contains exactly one dot (.) before the '@' symbol.

```sql
SELECT S.*
FROM STD S
WHERE
      LENGTH(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1))
    - LENGTH(REPLACE(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1),'.','')) = 1;
```

## 60. Display students whose first name and email username are exactly the same.

```sql
SELECT S.*, UPPER(TRIM(SUBSTR(STUDENT_NAME,1,INSTR(STUDENT_NAME,' ')))) FIRST_NAME, TRIM(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1)) USER_NAME
FROM STD S
WHERE UPPER(TRIM(SUBSTR(STUDENT_NAME,1,INSTR(STUDENT_NAME,' '))))=UPPER(TRIM(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1)));

SELECT STUDENT_NAME, EMAIL,
        SUBSTRING(EMAIL,1,INSTR(EMAIL,'@')-1) AS USERNAME
FROM STD
WHERE LENGTH(SUBSTRING(EMAIL,1,INSTR(EMAIL,'@')-1)) - LENGTH(REPLACE(SUBSTRING(EMAIL,1,INSTR(EMAIL,'@')-1),'.','')) = 1;
```