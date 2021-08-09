-- Sort
-- asc: ascending order
-- desc: descending order

-- 1. Get empno, ename, sal sorted by sal in ascending order.
select empno, ename, sal
from emp
order by sal asc;

-- 2. Get empno, ename and sal sorted by empno in descending order.
select empno, ename, sal
from emp
order by empno desc;

-- 3. Get empno and ename sorted by ename in ascending order.
select empno, ename
from emp
order by ename asc;

-- 4. Get empno, ename and hiredate sorted by hiredate in descending order.
select empno, ename, hiredate
from emp
order by hiredate asc;

-- 5. Get ename, empno and sal whose job is 'SALESMAN' sorted by sal in ascending order.
select ename, empno, sal
from emp
where job = 'SALESMAN'
order by sal asc;

-- 6. Get empno, ename and hiredate who hired in 1981 sorted by empno in descending order.
select empno, ename, hiredate
from emp
where hiredate between '210101' and '211231'
order by empno desc;

-- 7. Get ename, sal and commission sorted by commission in ascending order.
select ename, sal, comm
from emp
order by comm desc;

-- 8. Get ename, sal and commission sorted by commission in descending order.
select ename, sal, comm
from emp
order by comm asc;

-- 9. Get ename, empno and sal sorted by sal in ascending order and sorted by ename in descending order.
select ename, empno, sal
from emp
order by sal asc, ename desc;