-- 1.13 GROUP BY

-- 1.각 부서별 사원들의 평균 급여를 구한다.
SELECT      AVG(SAL)
FROM        EMP
GROUP BY    DEPTNO;

-- 2.각 직무별 사원들의 급여 총합을 구한다.
SELECT      SUM(SAL)
FROM        EMP
GROUP BY    JOB;

-- 3.1500 이상 급여를 받는 사원들의 부서별 평균 급여를 구한다.
SELECT      AVG(SAL)
FROM        EMP
WHERE       SAL >= 1500
GROUP BY    DEPTNO;