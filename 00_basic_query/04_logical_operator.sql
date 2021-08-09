-- Logical Operator
-- and, or, not, between and, in

select * 
from emp;

select * 
from dept;

-- 1. Get empno, ename, dept, job whose job is MANAGER and work in deptno 10.
select empno, ename, deptno, job 
from emp 
where job = 'MANAGER' and deptno = 10; 

-- 2. Get empno, ename, sal, hiredate whom hired at 1981 and sal is more than 1500.
select empno, ename, sal, hiredate 
from emp 
where hiredate between '810101' and '811231' and sal >= 1500;

-- 3. Get empno, ename, deptno, sal who work in deptno 20 and sal is more than 1500.
select empno, ename, deptno, sal
from emp 
where deptno = 20 and sal >= 1500;

-- 4. Get empno, ename, mgr, job whose empno is 7698 and job is CLERK.
select empno, ename, mgr, job
from emp
where mgr = 7698 and job = 'CLERK';

-- 5. Get empno, ename, sal whose sal is more than 1000 or less than 2000.
select empno, ename, sal
from emp
where not(sal between 1000 and 2000);

-- 6. Get empno, ename, deptno whose deptno is 20 or 30.
select empno, ename, deptno
from emp
where deptno = 20 or deptno = 30;

-- 7. Get empno, ename, job whose job is CLERK or SALESMAN or ANALYST.
select empno, ename, job
from emp
where job in ('CLERK', 'SALESMAN', 'ANALYST');

-- 8. Get empno, ename whose empno is not 7499, 7566 and 7839.
select empno, ename
from emp
where not(empno in (7499, 7566, 7839));
