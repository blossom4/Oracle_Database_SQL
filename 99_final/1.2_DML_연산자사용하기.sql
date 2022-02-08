-- 1.2 DML 연산자사용하기

-- 1.각 사원의 급여, 급여에서 1000을 더한 값, 200을 뺀 값, 2를 곱한 값, 2로 나눈 값을 가져온다.
SELECT  SAL, SAL + 1000, SAL - 200, SAL * 2, SAL / 2
FROM    EMP;

-- 2.각 사원의 급여, 커미션, 급여 + 커미션을 가져온다.
SELECT  SAL, NVL(COMM, 0), SAL + NVL(COMM, 0)   
FROM    EMP;
/* NVL(NULL VALUE)는 NULL값은 연산을 하면 무한대 값으로 설정되어 연산결과가 나오기 때문에,
NULL값을 어떤 값으로 대체할 것인지를 설정해주는 함수이다. */

-- 3.사원들의 이름, 직무를 다음 양식으로 가져온다. "(사원이름)의 담당직무는 (직무이름)입니다."
SELECT  ENAME || '의 담당직무는 ' || JOB || '입니다.'
FROM    EMP;

-- 4.사원들이 근무하고 있는 근무부서의 번호를 가져온다.
SELECT  DISTINCT DEPTNO
FROM    EMP;

