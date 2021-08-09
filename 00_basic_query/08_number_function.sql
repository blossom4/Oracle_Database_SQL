-- Number Function
-- 'dual' is virtual table

-- 1. Absoulte value
select abs(-10) from dual;

-- 2. Get absoulte value of sal after cut the sal by 2000.
select abs(sal - 2000)
from emp;

-- 3. Throw away below the decimal point.
select floor(12.3456)
from dual;

-- 4. Cut the 15% of sal whose sal more than 1500. 
--    However, if it is below the decimal point, then throw it away.
select floor(sal * 0.85)
from emp
where sal >= 1500;

--5. Round off the number to the second decimal place.
select round(12.3456) from dual;
select round(12.3456, 2) from dual;
select round(12.3456, -1) from dual;

-- 6. Increase the 20% of sal whose sal 2000 or less.
--    However, round off the number from the hundred.
select round(sal * 1.2, -2)
from emp
where sal <= 2000;

-- 7. Throw away below the decided number.
select trunc(12.3456, -1)
from dual;

-- 8. Throw away below the sal from the tenth.
select trunc(sal, -2)
from emp;

-- 9. Get remainder.
select mod(10, 3)
from dual;