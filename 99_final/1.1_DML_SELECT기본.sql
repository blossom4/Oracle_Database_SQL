-- 1.1 DML SELECT 기본

-- 1.부서의 모든 정보를 가져온다.
SELECT  *
FROM    DEPT;

-- 2.사원의 모든 정보를 가져온다.
SELECT  *
FROM    EMP;

-- 3.사원의 이름과 사원번호를 가져온다.
SELECT  ENAME, EMPNO
FROM    EMP;

-- 4.사원의 이름, 사원번호, 직무, 급여를 가져온다.
SELECT  ENAME, EMPNO, JOB, SAL
FROM    EMP;

-- 5.부서번호, 부서이름을 가져온다.
SELECT  DEPTNO, DNAME
FROM    DEPT;