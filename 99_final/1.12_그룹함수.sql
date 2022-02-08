-- 1.12 그룹함수

-- 1.전 사원의 급여 총합을 구한다.
SELECT  SUM(SAL)
FROM    EMP;

-- 2.전 사원의 커미션 총합을 구한다.
SELECT  SUM(COMM)
FROM    EMP;

-- 3.급여가 1500 이상인 사원의 급여 총합을 구한다.
SELECT  SUM(SAL)
FROM    EMP
WHERE   SAL >= 1500;

-- 4.20번 부서에 근무하고 있는 사원의 급여 총합을 구한다.
SELECT  SUM(SAL)
FROM    EMP
WHERE   DEPTNO = 20;

-- 5.직무가 SALESMAN인 사원의 급여 총합을 구한다.
SELECT  SUM(SAL)
FROM    EMP
WHERE   JOB = 'SALESMAN';

-- 6.전 사원의 평균 급여를 구한다.
SELECT  AVG(SAL)
FROM    EMP;

-- 7.커미션을 받는 사원의 평균 커미션을 구한다.
SELECT  AVG(COMM)
FROM    EMP
WHERE   COMM IS NOT NULL;

-- 8.전 사원의 평균 커미션을 구한다.
SELECT  AVG(NVL(COMM, 0))
FROM    EMP;

-- 9.30번 부서에 근무하고 있는 사원의 평균 급여를 구한다.
SELECT  AVG(SAL)
FROM    EMP
WHERE   DEPTNO = 30;

-- 10.직무가 SALESMAN인 사원의 급여, 커미션의 합의 평균을 구한다.
SELECT  AVG(SAL + COMM)
FROM    EMP
WHERE   JOB = 'SALESMAN';

-- 11.사원 총 인원수를 가져온다.
SELECT  COUNT(EMPNO)
FROM    EMP;

-- 12.커미션을 받는 사원의 수를 가져온다.
SELECT  COUNT(COMM)
FROM    EMP;

-- 13.전 사원의 급여 최대값, 최소값을 가져온다.
SELECT  MAX(SAL), MIN(SAL)
FROM    EMP;