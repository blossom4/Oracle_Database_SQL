-- 1.10 날짜함수

-- 1.현재 날짜 구하기
SELECT  SYSDATE
FROM    DUAL;

-- 2.날짜 데이터 연산
SELECT  SYSDATE, SYSDATE - 10000
FROM    DUAL;

-- 3.각 사원이 입사한 날짜로부터 1000일 후의 날짜를 가져온다.
SELECT  HIREDATE + 1000
FROM    EMP;

-- 4.직무가 SALESMAN인 사원의 입사일 100일 전의 날짜를 가져온다.
SELECT  HIREDATE - 100
FROM    EMP
WHERE   JOB = 'SALESMAN';

-- 5.전 사원의 근무일수를 가져온다.
SELECT  TRUNC(SYSDATE - HIREDATE)
FROM    EMP;

-- 6.전 사원의 근무개월수를 가져온다.
SELECT  TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))
FROM    EMP;

-- 7.현재 날짜에서 100개월을 더한다.
SELECT  ADD_MONTHS(SYSDATE, 100)
FROM    DUAL;

-- 8.전 사원의 입사일 후 100개월 되는 날짜를 구한다.
SELECT  ADD_MONTHS(HIREDATE, 100)
FROM    EMP;

-- 9.현재날짜를 기준으로 지정된 요일이 돌아오는 날짜를 구한다.
SELECT  NEXT_DAY(SYSDATE, '월요일')
FROM    DUAL;

-- 10.현재날짜를 기준으로 달의 마지막 날짜를 구한다.
SELECT  LAST_DAY(SYSDATE)
FROM    DUAL;

-- 11.TO_CHAR : ORACLE -> PROGRAM
SELECT  TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS AM')
FROM    DUAL;

-- 12.TO_DATE : PROGRAM -> ORACLE
SELECT  TO_DATE('2022-02-08 03:29:25 오후', 'YYYY-MM-DD HH:MI:SS AM')
FROM    DUAL;

-- 13.사원의 입사일을 다음과 같은 양식으로 가져온다. (YYYY-MM-DD)
SELECT  TO_CHAR(HIREDATE, 'YYYY-MM-DD')
FROM    EMP;