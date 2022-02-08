-- 1.3 조건절사용하기

-- 1.근무부서가 10번인 사원들의 사원번호, 이름, 근무부서번호를 가져온다.
SELECT  EMPNO, ENAME, DEPTNO
FROM    EMP
WHERE   DEPTNO = 10;

-- 2.근무부서번호가 10번이 아닌 사원들의 사원번호, 이름, 근무부서번호를 가져온다.
SELECT  EMPNO, ENAME, DEPTNO
FROM    EMP
WHERE   DEPTNO <> 10;
/* <> 연산기호는 해당 숫자보다 크고작은 값을 가져오라는 의미이므로 !=와 같은 기능을 한다. */

-- 3.급여가 1500이상인 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT  EMPNO, ENAME, SAL
FROM    EMP
WHERE   SAL >= 1500;

-- 4.이름이 SCOTT인 사원의 사원번호, 이름, 직무, 급여를 가져온다.
SELECT  EMPNO, ENAME, JOB, SAL
FROM    EMP
WHERE   ENAME = 'SCOTT';

-- 5.직무가 SALESMAN인 사원의 사원번호, 이름, 직무를 가져온다.
SELECT  EMPNO, ENAME, JOB
FROM    EMP
WHERE   JOB = 'SALESMAN';

-- 6.직무가 CLERK가 아닌 사원의 사원번호, 이름, 직무를 가져온다.
SELECT  EMPNO, ENAME, JOB
FROM    EMP
WHERE   JOB <> 'CLERK';
/* <> 연산기호는 문자열 비교에도 사용할 수 있다. */

-- 7.1982년 01월 01일 이후에 입사한 사원의 사원번호, 이름, 입사일을 가져온다.
SELECT  EMPNO, ENAME, HIREDATE
FROM    EMP
WHERE HIREDATE > '1982.01.01';