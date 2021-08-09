-- Date Function
-- sysdate: return present date time.
-- months_between: get difference of month between two dates.
-- add_months: add given months.
-- next_day: return the nearest day of the week.
-- last_day: return the last day of the month.
-- round: round off the number.
-- trunc: throw away the number below.

-- 1. Get present date time.
select sysdate 
from dual;

-- 2. Calculate date data.
select sysdate - 10
from dual;

-- 3. Get the 1000 days after hiredate of each employees.
select hiredate + 1000
from emp;

-- 4. Get the 100 days befer hiredate whose job is 'SALSEMAN'.
select hiredate - 100
from emp
where job = 'SALESMAN';

-- 5. Get the number of working days of employees.
select trunc(sysdate - hiredate)
from emp;

-- 6. Round off.
select round(sysdate, 'CC') as "Double digit of year", round(sysdate, 'YYYY') as "month",
       round(sysdate, 'DDD') as "hour", round(sysdate, 'HH') as "minutes",
       round(sysdate, 'MM') as "day", round(sysdate, 'DAY') as "week",
       round(sysdate, 'MI') as "second"
from dual;

-- 7. Round off the hiredate by month of each employees.
select round(hiredate, 'YYYY')
from emp;

-- 8. Throw away.
select trunc(sysdate, 'CC') as "Double digit of year", trunc(sysdate, 'YYYY') as "month",
       trunc(sysdate, 'DDD') as "hour", trunc(sysdate, 'HH') as "minutes",
       trunc(sysdate, 'MM') as "day", trunc(sysdate, 'DAY') as "week",
       trunc(sysdate, 'MI') as "second"
from dual;

-- 9. Get empno, ename, sal and hiredate who hired at 2021.
select empno, ename, sal, hiredate
from emp
where trunc(hiredate, 'YYYY') = '21/01/01';

-- 10. Get the number of days between two dates.
select trunc(sysdate - hiredate)
from emp;

-- 11. Get the number of months of employees.
select trunc(months_between(sysdate, hiredate))
from emp;

-- 12. Add the number of months
select add_months(sysdate, 15)
from dual;

-- 13. Get the 100 months after hiredate of all employees.
select add_months(hiredate, 100)
from emp;

-- 14. Get day of the week by designated date.
select next_day(sysdate, '월요일'), next_day(sysdate, 3)
from dual;

-- 15. Get the date of designated month.
select last_day(sysdate)
from dual;

-- 16. to_char: Oracle to Program.
select to_char(sysdate, 'YYYY-MM-DD HH:MI:SS AM')
from dual;

-- 17. to_date: Program to Oracle.
select to_date('2021-08-07 07:42:11 오후', 'YYYY-MM-DD HH:MI:SS AM')
from dual;

-- 18. Get hiredate following this form.
-- 1900-10-10
select to_char(hiredate, 'YYYY-MM-DD')
from emp;