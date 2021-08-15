-- Subquery 2
-- in: subquery의 결과 중 하나라도 일치하면 조건은 참이 된다.
-- any, some: subquery의 결과와 하나 이상 일치하면 조건은 참이된다.
-- all: subquery의 결과와 모두 일치해야 조건은 참이 된다.

-- 1. 급여가 3000 이상인 사원들과 같은 부서에 근무하고 있는 사원들의 사원번호(empno), 이름(ename), 급여(sal)를 가져온다.
select empno, ename, sal, deptno
from emp
where deptno in (select deptno
                from emp
                where sal >= 3000);

-- 2. 직무가 CLERK인 사원과 같은 부서에서 근무하고 있는 사원들의 사원번호(empno), 이름(ename), 입사일(hiredate)을 가져온다.
select empno, ename, hiredate, deptno
from emp
where deptno in (select deptno
                 from emp
                 where job = 'CLERK');
                 
-- 3. 직속상관이 KING인 사원들이 근무하는 부서명(dname), 지역(loc)을 가져온다.
-- join
-- e1: KING 사원
-- e2: 직속상관이 KING인 사원
-- d: dept
select d.dname, d.loc, e2.ename, e2.mgr
from emp e1, emp e2, dept d
where e1.empno = e2.mgr and e2.deptno = d.deptno and e1.ename = 'KING';
-- subquery
select dname, loc
from dept
where deptno in (select deptno
                 from emp
                 where mgr = (select empno
                              from emp
                              where ename = 'KING'));

-- 4. 직무가 CLERK인 사원들의 직속상관의 사원번호(empno), 이름(ename), 급여(sal)을 가져온다.
select empno, ename, sal
from emp
where empno in (select mgr
                from emp
                where job = 'CLERK');
                
-- 5. 각 부서별 평균 급여보다 더 많이 받는 사원의 사원번호(empno), 이름(ename), 급여(sal)을 가져온다.
select empno, ename, sal
from emp
where sal > all (select avg(sal)
                 from emp
                 group by deptno);

-- 6. 각 부서별 급여의 최소값보다 더 많이 받는 사원들의 사원번호(empno), 이름(ename), 급여(sal)을 가져온다.
select empno, ename, sal
from emp
where sal > all (select min(sal)
                 from emp
                 group by deptno);
                 
-- 7. 직무가 SALESMAN인 사원보다 급여가 적은 사원들의 사원번호(empno), 이름(ename), 급여(sal)을 가져온다. 
select empno, ename, sal
from emp
where sal < all (select sal
                 from emp
                 where job = 'SALESMAN');

-- 8. 각 부서별 급여 최소값 중 가장 작은 값보다 급여가 높은 사원들의 사원번호(empno), 이름(ename), 급여(sal)을 가져온다.
select empno, ename, sal
from emp
where sal > all (select min(sal)
                 from emp
                 group by deptno);

-- 9. DALLAS에서 근무하고 있는 사원들 중 가장 마지막에 입사한 사원의 입사날짜보다 빨리 입사한 사원들의,
--    사원번호(empno), 이름(ename), 입사일(hiredate)을 가져온다.
select empno, ename, hiredate
from emp
where hiredate < (select max(hiredate)
                  from emp
                  where deptno = (select deptno
                                  from dept
                                  where loc = 'DALLAS'));


