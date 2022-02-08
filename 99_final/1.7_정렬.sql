-- 1.7 정렬

-- 1.사원의 사원번호, 이름, 급여를 가져온다. (급여를 기준으로 오름차순 정렬)
SELECT      EMPNO, ENAME, SAL
FROM        EMP
ORDER BY    SAL;

-- 2.사원의 사원번호, 이름, 급여를 가져온다. (사원번호를 기준으로 내림차순 정렬)
SELECT      EMPNO, ENAME, SAL
FROM        EMP
ORDER BY    EMPNO DESC;

-- 3.사원의 사원번호, 이름을 가져온다. (이름을 기준으로 오름차순 정렬)
SELECT      EMPNO, ENAME
FROM        EMP
ORDER BY    ENAME;

-- 4.사원의 사원번호, 이름, 입사일을 가져온다. (입사일을 기준으로 내림차순 정렬)
SELECT      EMPNO, ENAME, HIREDATE
FROM        EMP
ORDER BY    HIREDATE DESC;

-- 5.직무가 SALESMAN인 사원의 이름, 사원번호, 급여를 가져온다. (급여를 기준으로 오름차순 정렬)
SELECT      ENAME, EMPNO, SAL
FROM        EMP
WHERE       JOB = 'SALESMAN'
ORDER BY    SAL;

-- 6.1981년에 입사한 사원의 사원번호, 이름, 입사일을 가져온다. (사원번호를 기준으로 내림차순 정렬)
SELECT      EMPNO, ENAME, HIREDATE
FROM        EMP
WHERE       HIREDATE BETWEEN('1981.01.01') AND ('1981.12.31')
ORDER BY    EMPNO DESC;

-- 7.사원의 이름, 급여, 커미션을 가져온다. (커미션을 기준으로 오름차순 정렬)
SELECT      ENAME, SAL, NVL(COMM, 0)
FROM        EMP
ORDER BY    NVL(COMM,0);

-- 8.사원의 이름, 급여, 커미션을 가져온다. (커미션을 기준으로 내림차순 정렬)
SELECT      ENAME, SAL, NVL(COMM, 0)
FROM        EMP
ORDER BY    NVL(COMM,0) DESC;

-- 9.사원의 이름, 사원번호, 급여를 가져온다. (급여를 기준으로 내림차순 정렬, 이름을 기준으로 오름차순 정렬)
SELECT      ENAME, EMPNO, SAL
FROM        EMP
ORDER BY    SAL DESC, ENAME;