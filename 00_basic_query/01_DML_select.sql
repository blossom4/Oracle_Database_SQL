-- DML select

-- Get all the information of department.
select * from dept;

-- Get all the information of employee.
select * from emp;

-- 1. Get employee's name and number.
select ename, empno from emp;
-- 2. Get employee's name, number, job and sallay.
select ename, empno, job, sal from emp;
-- 3. Get department number and name.
select deptno, dname from dept;