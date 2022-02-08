-- 1.9 문자열함수

-- 1.대문자 -> 소문자
SELECT  LOWER('Hi pepE')
FROM    DUAL;

-- 2.사원의 이름을 소문자로 가져온다.
SELECT  LOWER(ENAME)
FROM    EMP;

-- 3.소문자 -> 대문자
SELECT  UPPER('Hi pepE')
FROM    DUAL;

-- 4.첫 글자만 대문자, 나머지 소문자
SELECT  INITCAP('Hi pepE')
FROM    DUAL;

-- 5.사원의 이름을 첫 글자만 대문자, 나머지는 소문자로 가져온다.
SELECT  INITCAP(ENAME)
FROM    EMP;

-- 6.문자열 연결
SELECT  CONCAT('HI ', 'PEPE')
FROM    DUAL;

-- 7.사원의 이름, 직무를 다음과 같이 가져온다. "사원의 이름은 (이름)이고, 직무는 (직무)입니다.
SELECT  CONCAT(CONCAT(CONCAT(CONCAT('사원의 이름은 ', ENAME), '이고,'), CONCAT(' 직무는 ', JOB)), '입니다.')
FROM    EMP;

-- 8.문자열의 길이
SELECT  LENGTH('HI PEPE'),
        LENGTHB('HI PEPE'),
        LENGTH('안녕 페페'),
        LENGTHB('안녕 페페')
FROM    DUAL;

-- 9.문자열 잘라내기
SELECT  SUBSTR('HI PEPE', 3),
        SUBSTRB('HI PEPE', 3),
        SUBSTR('안녕 페페', 3),
        SUBSTRB('안녕 페페', 3),
        SUBSTR('안녕 페페', 1, 2)
FROM    DUAL;

-- 10.문자열 찾기
SELECT  INSTR('HI PEPE HI PEPE', 'PE'),
        INSTR('HI PEPE HI PEPE', 'PE', 6),
        INSTR('HI PEPE HI PEPE', 'PE', 6, 2)
FROM    DUAL;
/* 
    INSTR - 첫 번째 인수 - 찾을 문자열
            두 번째 인수 - 찾기시작할 INDEX 번호
            세 번째 인수 - 조건에 맞는 몇 번째 문자열인지 
*/

-- 11.사원의 이름 중에 A라는 글자가 두 번째 이후에 나타나는 사원의 이름을 가져온다.
SELECT  ENAME
FROM    EMP
WHERE   INSTR(ENAME, 'A') > 2;

-- 12.특정 문자열로 채우기
SELECT  LPAD('PEPE', 4),
        RPAD('PEPE', 4),
        LPAD('PEPE', 8, '_'),
        RPAD('PEPE', 8, '_')
FROM    DUAL;
/* 
    LPAD/RPAD - 첫 번째 인수 - 문자열
                두 번째 인수 - 세 번째인수를 지정하지 않을경우 지정 숫자만큼 공백으로 채움 
                세 번째 인수 - 기존 문자열을 제외하고 남은 숫자만큼 지정 문자열로 채움
*/

-- 13.공백 제거
SELECT  LTRIM('    HI PEPE    '),
        RTRIM('    HI PEPE    '),
        TRIM('    HI PEPE    ')
FROM    DUAL;

-- 14.문자열 변경
SELECT  REPLACE('HI PEPE', 'PEPE', 'PAIR')
FROM    DUAL;