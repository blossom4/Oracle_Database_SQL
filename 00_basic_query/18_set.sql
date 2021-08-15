-- SET
-- 두 SELECT문으로 얻어온 결과에 대해 집합 연산을 한다.
-- 두 SELECT문의 column 형태가 완전히 일치해야한다.
-- UNION: 합집합이고 중복된 데이터를 모두 가져온다.
-- INTERSECT: 교집합
-- MINUS: 차집합

-- 1. 10번 부서에 근무하고 있는 사원들의 사원번호(empno), 이름(ename), 직무(job), 부서번호(deptno)를 가져온다.
select empno, ename, job, deptno
from emp
where deptno = 10;

-- 2. 직무가 CLERK인 사원의 사원번호(empno), 이름(ename), 직무(job), 부서번호(deptno)를 가져온다.
select empno, ename, job, deptno
from emp
where job = 'CLERK';

-- 3. UNION
-- UNION: 중복 제거
-- UNION ALL: 중복 포함
select empno, ename, job, deptno
from emp
where deptno = 10
union
select empno, ename, job, deptno
from emp
where job = 'CLERK';

-- 4. INTERSECT
select empno, ename, job, deptno
from emp
where deptno = 10
intersect
select empno, ename, job, deptno
from emp
where job = 'CLERK';

-- 5. MINUS
select empno, ename, job, deptno
from emp
where deptno = 10
minus
select empno, ename, job, deptno
from emp
where job = 'CLERK';



