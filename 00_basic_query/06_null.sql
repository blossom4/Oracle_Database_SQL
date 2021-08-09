-- Null
-- null does not have value or deal with infinity.
-- null is able to compare only 'is null' or 'is not null'.

-- 1. Get empno, ename, comm who does not receive a commission.
select empno, ename, comm
from emp
where comm is null;

-- 2. Get ename, empno who does not have mgr.
select ename, empno
from emp
where mgr is null;