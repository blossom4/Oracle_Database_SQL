-- 1.14 HAVING

-- 1.평균 급여가 2000 이상인 부서의 부서별 평균 급여를 가져온다.
SELECT      AVG(SAL)
FROM        EMP
GROUP BY    DEPTNO
HAVING      AVG(SAL) >= 2000;

-- 2.최대 급여가 3000 이하인 부서의 부서별 급여 총합을 가져온다.
SELECT      SUM(SAL)
FROM        EMP
GROUP BY    DEPTNO
HAVING      MAX(SAL) <= 3000;

-- 3.최소 급여가 1000 이하인 부서에서 직무가 CLERK인 사원들의 부서별 급여 총합을 구한다.
SELECT      SUM(SAL)
FROM        EMP
WHERE       JOB = 'CLERK'
GROUP BY    DEPTNO
HAVING      MIN(SAL) <= 1000;

-- 4.최소 급여가 900 이상, 최대 급여 10000 이하인 부서의 사원들 중 1500 이상의 급여를 받는 사원들의 부서별 평균 급여를 구한다.
SELECT      AVG(SAL)
FROM        EMP
WHERE       SAL >= 1500
GROUP BY    DEPTNO
HAVING      MIN(SAL) >= 900
AND         MAX(SAL) <= 10000;