-- 1.8 숫자함수

-- 1. 절대값
SELECT  ABS(-10)
FROM    DUAL;

-- 2. 전 직원의 급여를 2000 삭감하고 삭감한 급여액의 절대값을 구한다.
SELECT  ABS(SAL - 2000)
FROM    EMP;

-- 3. 내림.
SELECT  FLOOR(12.3456)
FROM    DUAL;

-- 4. 급여가 1500 이상인 사원의 급여를 15% 삭감한다. (단, 일의자리에서 내린다.) 
SELECT  FLOOR(SAL * 0.85)
FROM    EMP
WHERE   SAL >= 1500;

--5. 반올림
SELECT  ROUND(12.3456),
        ROUND(12.3456, 2),
        ROUND(12.3456, -1)
FROM    DUAL;

-- 6.급여가 2000 이하인 사원들의 급여를 20% 인상한다. (단, 십의자리를 기준으로 반올림한다.)
SELECT  ROUND(SAL * 1.2, -2)
FROM    EMP
WHERE   SAL <= 2000;

-- 7. 버림
SELECT  TRUNC(12.3456, -1)
FROM    DUAL;

-- 8. 전 직원의 급여를 십의자리를 기준으로 버린다.
SELECT  TRUNC(SAL, -2)
FROM    EMP;

-- 9. 나머지 구하기
SELECT  MOD(10, 3)
FROM    DUAL;