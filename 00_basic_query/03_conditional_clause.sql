-- Conditional Clause
-- Select (column) from (table) where (condition)
-- Comparitive Operator

select * from emp;

-- 1. Get empno, ename, deptno whose deptno is 10.
select empno, ename, deptno from emp where deptno = 10;

-- 2. Get empno, ename, deptno whose deptno is not 10.
select empno, ename, deptno from emp where deptno != 10;

-- 3. Get empno, ename, sal whose sal is more than 1500
select empno, ename, sal from emp where sal >= 1500;

-- 4. Get empno, ename, job whose name is SCOTT.
select empno, ename, job from emp where ename = 'SCOTT';

-- 5. Get empno, ename, job whose job is SALESMAN.
select empno, ename, job from emp where job = 'SALESMAN';

-- 6. Get empno, ename, job whose job is not CLERK.
select empno, ename, job from emp where job != 'CLERK';

-- 7. Get empno, ename, hiredate whom hired after 1982/01/01
select empno, ename, hiredate from emp where hiredate >= '820101';
