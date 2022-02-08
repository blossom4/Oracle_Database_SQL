-- 1.5 LIKE연산자

-- 1.이름이 F로 시작하는 사원의 이름, 사원번호를 가져온다.
SELECT  ENAME, EMPNO
FROM    EMP
WHERE   ENAME LIKE 'F%';

-- 2.이름이 S로 끝나는 사원의 이름, 사원번호를 가져온다.
SELECT  ENAME, EMPNO
FROM    EMP
WHERE   ENAME LIKE '%S';

-- 3.이름에 A가 포함되어 있는 사원의 이름, 사원번호를 가져온다.
SELECT  ENAME, EMPNO
FROM    EMP
WHERE   ENAME LIKE '%A%';

-- 4.이름의 두 번째 글자가 A인 사원의 이름, 사원번호를 가져온다.
SELECT  ENAME, EMPNO
FROM    EMP
WHERE   ENAME LIKE '_A%';

-- 5.이름이 4글자인 사원의 이름, 사원번호를 가져온다.
SELECT  ENAME, EMPNO
FROM    EMP
WHERE   ENAME LIKE '____';