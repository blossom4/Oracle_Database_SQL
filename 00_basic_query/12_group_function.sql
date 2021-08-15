-- Group Function.
-- sum: 총합, avg: 평균, count: row의 수, max: 최대값, min: 최소값

-- 1. 사원들의 급여 총합을 구한다.
select sum(sal)
from emp;

-- 2. 사원들의 커미션 총합을 가져온다.
select sum(comm)
from emp;

-- 3. 급여가 1500 이상인 사원들의 급여 총합을 구한다.
select sum(sal)
from emp
where sal >= 1500;

-- 4. 20번 부서에 근무하고 있는 사원들의 급여 총합을 구한다.
select sum(sal)
from emp
where deptno = 20;

-- 5. 직무가 SALESMAN인 사원들의 급여 총합을 구한다.
select sum(sal)
from emp
where job = 'SALESMAN';

-- 6. 직무가 SALESMAN인 사원들의 이름과 급여 총합을 가져온다.
-- ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
-- 00937. 00000 -  "not a single-group group function"
select ename, sum(sal)
from emp
where job = 'SALESMAN';

-- 7. 모든 사원의 평균 급여를 구한다.
select trunc(avg(sal))
from emp;

-- 8. 커미션을 받는 사원들의 평균 커미션을 구한다.
select avg(comm)
from emp;

-- 9. 모든 사원들의 평균 커미션을 구한다.
select trunc(avg(nvl(comm, 0)))
from emp;

-- 10. 커미션을 받는 사원들의 평균 급여를 구한다.
select trunc(avg(sal))
from emp
where comm is not null;

-- 11. 30번 부서에 근무하고 있는 사원들의 평균 급여를 구한다.
select trunc(avg(sal))
from emp
where deptno = 30;

-- 12. 직무가 SALESMAN인 사원들의 급여와 커미션의 합의 평균을 구한다.
select trunc(avg(sal + comm))
from emp
where job = 'SALESMAN';

-- 13. 모든 사원의 수를 구한다.
select count(empno)
from emp;

-- 14. 커미션을 받는 사원들의 수를 구한다.
select count(comm)
from emp;

-- 15. 사원들의 급여 중 최대값과 최소값을 구한다.
select max(sal), min(sal)
from emp;

-- 16. 각 부서별 사원들의 평균 급여를 구한다.
select deptno, trunc(avg(sal))
from emp
group by deptno;

-- 17. 각 직무별 사원들의 급여 총합을 구한다.
select job, sum(sal)
from emp
group by job;

-- 18. 각 부서별 급여가 1500 이상인 사원들의 평균 급여를 구한다.
select deptno, trunc(avg(sal))
from emp
where sal >= 1500
group by deptno;