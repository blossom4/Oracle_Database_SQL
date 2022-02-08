-- 1.6 NULL

-- 1.사원 중에 커미션을 받지 않는 사원의 사원번호, 이름, 커미션을 가져온다.
SELECT  EMPNO, ENAME, COMM
FROM    EMP
WHERE   COMM IS NULL;

-- 2.회사대표(직속상관이 없는 사람)의 이름과 사원번호를 가져온다.
SELECT  ENAME, EMPNO
FROM    EMP
WHERE   MGR IS NULL;