-- 1.4 논리연산자사용하기

-- 1.10번 부서에서 근무하고 있고, 직무가 MANAGER인 사원의 사원번호, 이름, 부서번호, 직무를 가져온다.
SELECT  EMPNO, ENAME, DEPTNO, JOB
FROM    EMP
WHERE   DEPTNO = 10 
AND     JOB = 'MANAGER';

-- 2.입사연도가 1981년인 사원들 중에 급여가 1500이상인 사원의 사원번호, 이름, 급여, 입사일을 가져온다.
SELECT  EMPNO, ENAME, SAL, HIREDATE
FROM    EMP
WHERE   HIREDATE BETWEEN('1981.01.01') AND ('1981.12.31')
AND     SAL >= 1500;

-- 3.20번 부서에 근무하고 있는 사원들 중에 급여가 1500이상인 사원의 사원번호, 이름, 부서번호, 급여를 가져온다.
SELECT  EMPNO, ENAME, DEPTNO, SAL
FROM    EMP
WHERE   DEPTNO = 20
AND     SAL >= 1500;

-- 4.직속상관의 사원번호가 7698번인 사원 중에 직무가 CLERK인 사원의 사원번호, 이름, 직속상관번호, 직무를 가져온다.
SELECT  EMPNO, ENAME, MGR, JOB
FROM    EMP
WHERE   MGR = 7698
AND     JOB = 'CLERK';

-- 5.급여가 2000보다 크거나 1000보다 작은 사원의 사원번호, 이름, 급여를 가져온다.
SELECT  EMPNO, ENAME, SAL
FROM    EMP
WHERE   SAL > 2000 
OR      SAL < 1000;

-- 6.부서번호가 20이거나 30인 사원의 사원번호, 이름, 부서번호를 가져온다.
SELECT  EMPNO, ENAME, DEPTNO
FROM    EMP
WHERE   DEPTNO = 20 
OR      DEPTNO = 30;

-- 7.직무가 CLERK, SALESMAN, ANALYST인 사원의 사원번호, 이름, 직무를 가져온다.
SELECT  EMPNO, ENAME, JOB
FROM    EMP
WHERE   JOB IN ('CLERK', 'SALESMAN', 'ANALYST');

-- 8.사원번호가 7499, 7566, 7839가 아닌 사원의 사원번호, 이름을 가져온다.
SELECT  EMPNO, ENAME
FROM    EMP
WHERE   EMPNO NOT IN (7499, 7566, 7839);