-- Self join / Outer join
-- Self join: 같은 table을 두 번 이상 join하는 것을 의미한다.
-- Outerjoin: 결과에 해당되지 않아 제외되었던 결과까지 가져오는 join이다.

-- 1. SMITH 사원의 사원번호(empno), 이름(ename), 직속상관의 이름을 가져온다.
-- e1: SMITH
-- e2: 직속상관
select e1.empno, e1.ename, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno and e1.ename = 'SMITH';

-- 2. FORD 사원 밑에서 일하는 사원들의 사원번호(empno), 이름(ename), 직무(job)을 가져온다.
-- e1: FORD
-- e2: FORD 밑에서 일하는 사원
select e2.empno, e2.ename, e2.job
from emp e1, emp e2
where e1.empno = e2.mgr and e1.ename = 'FORD';

-- 3. SMITH 사원의 직속상관과 동일한 직무를 가지고 있는 사원들의 사원번호(empno), 이름(ename), 직무(job)을 가져온다.
-- e1: SMITH
-- e2: SMITH의 직속상관
-- e3: SMITH의 직속상관과 같은 직무를 가지고 있는 사원
select e3.empno, e3.ename, e3.job
from emp e1, emp e2, emp e3
where e1.mgr = e2.empno and e2.job = e3.job and e1.ename = 'SMITH';

-- 4. 각 사원의 사원번호(empno), 이름(ename), 직속상관의 이름(mgr ename)을 가져온다. 단, 직속상관이 없는 사원도 가져온다.
-- e1: 사원
-- e2: 사원의 직속상관
select e1.empno, e1.ename, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);

-- 5. 모든 부서의 사원의 근무부서명(dname), 사원번호(empno), 사원이름(ename), 급여(sal)을 가져온다.
-- e: 사원정보
-- d: 부서정보
select d.dname, e.empno, e.ename, e.sal
from emp e, dept d
where e.deptno(+) = d.deptno;

select * from emp;
select * from dept;