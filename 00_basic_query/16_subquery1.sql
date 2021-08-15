-- Subquery
-- query문 안에 들어가는 query문을 subquery라고 한다.
-- query문을 쓸 때 사용되는 값을 다른 query문을 통해서 구해야 할 경우 사용한다.

-- 1. SCOTT 사원이 근무하고 있는 부서이름(dname)을 가져온다.
-- join
select d.dname
from emp e, dept d
where e.ename = 'SCOTT' and e.deptno = d.deptno;
-- subquery
select dname
from dept
where deptno = (select deptno
                from emp
                where ename = 'SCOTT');

-- 2. 'SMITH'와 같은 부서에 근무하고 있는 사원들의 사원번호(empno), 이름(ename), 급여(sal), 부서이름(dname)을 가져온다.
select e.empno, e.ename, e.sal, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.deptno = (select deptno
                                          from emp
                                          where ename = 'SMITH');
                                          
-- 3. MARTIN과 같은 직무를 가지고 있는 사원들의 사원번호(empno), 이름(ename), 직무(job)를 가져온다.
select empno, ename, job
from emp
where job = (select job
             from emp
             where ename = 'MARTIN');
             
-- 4. ALLEN과 같은 직속상관(mgr)을 가진 사원들의 사원번호(empno), 이름(ename), 직속상관의 이름을 가져온다.
-- join
-- e1: ALLEN 사원
-- e2: ALLEN 사원의 직속상관
-- e3: ALLEN 사원과 같은 직속상관을 가진 사원
select e3.empno, e3.ename, e2.ename
from emp e1, emp e2, emp e3
where e1.mgr = e2.empno and e2.empno = e3.mgr and e1.ename = 'ALLEN';
-- subquery
-- e1: ALLEN 사원
-- e2: ALLEN 사원과 같은 직속상관을 가진 사원
select e1.empno, e1.ename, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno and e1.mgr = (select mgr
                                      from emp
                                      where ename = 'ALLEN');

-- 5. WARD와 같은 부서에 근무하고 있는 사원들의 사원번호(empno), 이름(ename), 부서번호(deptno)를 가져온다.
-- join
-- e1: WARD 사원
-- e2: WARD 사원과 같은 부서에 근무하는 사원
select e2.empno, e2.ename, e2.deptno
from emp e1, emp e2
where e1.deptno = e2.deptno and e1.ename = 'WARD';
-- subquery
select empno, ename, deptno
from emp
where deptno = (select deptno
                from emp
                where ename = 'WARD');

-- 6. SALESMAN의 평균 급여보다 많이 받는 사원들의 사원번호(empno), 이름(ename), 급여(sal)을 가져온다.
select empno, ename, sal
from emp
where sal > (select avg(sal)
              from emp
              where job = 'SALESMAN');
              
-- 7. DALLAS 지역에서 근무하는 사원들의 평균 급여를 가져온다.
-- join
-- e: emp
-- d: dept
select avg(sal)
from emp e, dept d
where e.deptno = d.deptno and d.loc = 'DALLAS';
-- subquery
select avg(sal)
from emp
where deptno = (select deptno
                from dept
                where loc = 'DALLAS');
              
-- 8. SALES 부서에서 근무하는 사원들의 사원번호(empno), 이름(ename), 근무지역(loc)을 가져온다.
-- join
-- e: emp
-- d: dept
select e.empno, e.ename, d.loc
from emp e, dept d
where e.deptno = d.deptno and d.dname = 'SALES';
-- subquery
select e.empno, e.ename, d.loc
from emp e, dept d
where e.deptno = d.deptno and e.deptno = (select deptno
                                          from dept
                                          where dname = 'SALES');

-- 9. CHICAGO 지역에 근무하는 사원들 중 BLAKE가 직속상관인 사원들의 사원번호(empno), 이름(ename), 직무(job)를 가져온다.
-- join
-- e1: CHICAGO 지역에 근무하는 사원
-- e2: BLAKE 사원
-- d: dept
select e1.empno, e1.ename, e1.job
from emp e1, emp e2, dept d
where e1.deptno = d.deptno and d.loc = 'CHICAGO' and e1.mgr = e2.empno and e2.ename = 'BLAKE';
-- subquery
select empno, ename, job
from emp
where deptno = (select deptno
                from dept
                where loc = 'CHICAGO') and
      mgr = (select empno
             from emp
             where ename = 'BLAKE');
    