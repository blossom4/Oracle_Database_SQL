-- 1.11 DECODE, CASE

-- 1.각 사원의 부서이름을 가져온다.
/*
    10 : 인사과
    20 : 개발부
    30 : 경영지원팀
    40 : 생산부
*/
SELECT  DECODE(DEPTNO, 10, '인사과',
                       20, '개발부',
                       30, '경영지원팀',
                       40, '생산부')
FROM    EMP;

-- 2.직무에 따라 인상된 급여를 가져온다.
/*
    CLERK       : 10%
    SALESMAN    : 15%
    PRESIDENT   : 200%
    MANAGER     : 5%
    ANALYST     : 20%
*/
SELECT  DECODE(JOB, 'CLERK', SAL * 1.1,
                    'SALESMAN', SAL * 1.15,
                    'PRESIDENT', SAL * 2,
                    'MANAGER', SAL * 1.05,
                    'ANALYST', SAL * 1.2)
FROM    EMP;

-- 3.급여별 등급을 가져온다.
/*
    1000 미만          : C등급
    1000 이상 2000미만 : B등급
    2000 이상          : A등급
*/
SELECT  CASE WHEN SAL < 1000 THEN 'C등급'
             WHEN SAL >= 1000 AND SAL < 2000 THEN 'B등급'
             WHEN SAL > 2000 THEN 'A등급'
        END
FROM    EMP;

-- 4.직원들의 급여를 다음과 같이 조정한다.
/*
    1000 이하           : 100%
    1000 초과 2000 미만 : 50%
    2000 이상           : 200%
*/
SELECT  CASE WHEN SAL <= 1000 THEN SAL * 2
             WHEN SAL > 1000 AND SAL < 2000 THEN SAL * 1.5
             WHEN SAL >= 2000 THEN SAL * 3
        END
FROM    EMP;