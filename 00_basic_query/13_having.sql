-- Having
-- group by의 조건을 나타낸다.

-- 1. 각 부서별 평균 급여가 2000 이상인 곳의 평균 급여를 구한다.
select deptno, trunc(avg(sal))
from emp
group by deptno
having avg(sal) >= 2000;

-- 2. 각 부서별로 최대 급여가 3000 이하인 곳의 급여의 총합을 구한다.
select  deptno, max(sal), sum(sal)
from emp
group by deptno
having max(sal) <= 3000;

-- 3. 각 부서별 최소 급여가 1000 이하인 곳에서 직무가 CLERK인 사원들의 급여의 총합을 구한다.
select deptno, sum(sal)
from emp
where job = 'CLERK'
group by deptno
having min(sal) <= 1000;

-- 4. 각 부서의 최소 급여가 900 이상, 최대 급여가 10000이하인 곳의 사원들 중 급여가 1500 이상인 사원들의 평균 급여를 구한다.
select deptno, trunc(avg(sal))
from emp
where sal >= 1500
group by deptno
having min(sal) >= 900 and min(sal) <= 10000;