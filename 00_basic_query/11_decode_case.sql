-- Decode Case
-- decode(coulmn, value, return)
-- case(when condition then return)

select * from emp;
-- 1. Get dname of employees.
-- 10: ACCOUNTING, 20: RESEARCH, 30: SALES, 40: OPERATIONS.
select ename, decode(deptno, 10, 'ACCOUNTING',
                             20, 'RESEARCH', 
                             30, 'SALES', 
                             40, 'OPERATIONS')
from emp;

-- 2. Get increased sal according to job.
select ename, job, decode(job, 'CLERK', sal * 1.1,
                          'SALESMAN', sal * 1.15,
                          'PRESIDENT', sal * 3,
                          'MANAGER', sal * 1.05,
                          'ANALYST', sal * 1.2)
from emp;

-- 3. Get grade divided by sal.
select ename, 
       case when sal < 1000 then 'C'
            when sal >= 1000 and sal < 2000 then 'B'
            when sal >= 2000 then 'A'
       end
from emp;

-- 4. Increase the sal divided by sal.
select ename,
       case when sal <= 1000 then sal * 2
            when sal > 1000 and sal < 2000 then sal * 1.5
            when sal >= 2000 then sal * 3
       end
from emp;