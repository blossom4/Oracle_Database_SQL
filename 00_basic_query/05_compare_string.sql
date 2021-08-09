-- Compare String
-- Use like operator to confrim whether string column has specific string or not.
-- _ means only one charactor.
-- % means there are acharactors or not.

-- 1. Get ename, empno whose name starts with F.
select ename, empno 
from emp
where ename like 'F%';

-- 2. Get ename, empno whose name ends with S.
select ename, empno
from emp
where ename like '%S';

-- 3. Get ename, empno whose name has A.
select ename, empno
from emp
where ename like '%A%';

-- 4. Get ename, empno whose the second letter of the name begins with 'A'.
select ename, empno
from emp
where ename like '_A%';

-- 5. Get ename, empno whose the number of letter of name is four.
select ename, empno
from emp
where ename like '____';