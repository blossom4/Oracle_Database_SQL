-- 1. Get values of sallay, sally + 1000, sallay - 200, sallay * 2, sallay / 2.
select sal, sal + 100, sal - 200, sal * 2, sal / 2 from emp;

-- 2. Get values of sallay, commision, sallay + commision.
-- null is calculated to infinite.
-- nvl function changes null to specific value
select sal, nvl(comm, 0), sal + nvl(comm, 0) from emp;

-- 3. employee (name)'s job is (job)
-- Combine strings with ||
-- CHR(ascii number)
select 'employee ' || ename || CHR(39) || 's job is' || job from emp;

-- 4. Get department number.
-- remove duplication with distinct.
select distinct deptno from emp;