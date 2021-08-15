-- Join
-- select 'column' from 'table1', 'table2'

-- 1. 사원테이블(emp)과 부서테이블(dept)을 join 한다.
select *
from  emp e, dept d
where e.deptno = d.deptno;

-- 2. 모든 사원들의 사원번호(empno), 이름(ename), 근무하는 부서이름(dname)을 가져온다.
select e.empno, e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno;

-- 3. 모든 사원들의 사원번호(empno), 이름(ename), 근무지역(loc)을 가져온다.
select e.empno, e.ename, d.loc
from emp e, dept d
where e.deptno = d.deptno;

-- 4. DALLAS에 근무하고 있는 사원들의 사원번호(empno), 이름(ename), 직무(job)를 가져온다.
select e.empno, e.ename, e.job
from emp e, dept d
where e.deptno = d.deptno and d.loc = 'DALLAS';

-- 5. SALES 부서에 근무하고 있는 사원들의 평균 급여를 가져온다.
select trunc(avg(sal))
from emp e, dept d
where e.deptno = d.deptno and d.dname = 'SALES';

-- 6. 1981년에 입사한 사원들의 사원번호(empno), 이름(ename), 부서이름(dname)을 가져온다.
select e.empno, e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and hiredate between '810101' and '811231';

-- 7. 모든 사원들의 사원번호(empno), 이름(ename), 급여(sal), 급여등급(grade)을 가져온다.
select e.empno, e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

-- 8. SALES 부서에서 근무하고 있는 사원들의 사원번호(empno), 이름(ename), 급여등급(grdae)을 가져온다.
select e.empno, e.ename, s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno and
      d.dname = 'SALES' and 
      e.sal between s.losal and s.hisal;
      
-- 9. 각 급여등급별(grade)로 급여(sal)의 총합, 평균, 사원 수, 최대급여, 최소급여를 가져온다.
select s.grade, sum(e.sal), trunc(avg(e.sal)), count(e.sal), max(e.sal), min(e.sal)
from emp e, salgrade s
where e.sal between s.losal and s.hisal
group by s.grade;

-- 10. 급여등급이 4등급인 사원들의 사원번호(empno), 이름(ename), 부서이름(dname), 근무지역(loc)을 가져온다.
select e.empno, e.ename, d.dname, d.loc
from emp e, dept d, salgrade s
where e.deptno = d.deptno and 
      e.sal between s.losal and
      s.hisal and s.grade = 4;




