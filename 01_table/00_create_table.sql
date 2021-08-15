-- CREATE TABLE
-- create table 'table name' (
-- 'column' 'data type' 'constraints'
-- )
-- char(size): 고정 길이 문자열 타입
-- varchar2(size): 가변 길이 문자열 타입
-- number: 최고 40자리까지 저장할 수 있는 숫자 타입

-- 1. 다음과 같은 정보를 저장하기 위한 테이블을 만든다.
-- 학생번호(stdno), 학생이름(stdname), 학생나이(stdage), 학생국어점수(koscore), 학생영어점수(enscore), 학생수학점수(mascore)
create table std (
std_no number,
std_name char(10),
std_age number,
std_kor number,
std_eng number,
std_math number
);

insert into std (std_no, std_name, std_age, std_kor, std_eng, std_math)
values (1111, '조영신', 29, 90, 90, 100);

select * from std;

-- 2. 숫자 테이블
create table num (
number1 number,
number2 number(3),
number3 number(5, 2)
);

insert into num (number1)
values (10000);

insert into num (number2)
values (100);

insert into num (number3)
values (100.123);

select * from num;

-- 3. emp 테이블을 copy한 emp01 테이블을 생성한다.
drop table emp01;

create table emp01
as
select * from emp;

select * from emp01;

-- 4. emp 테이블에서 사원번호(empno), 이름(ename), 급여(sal) 정보를 가지고 있는 테이블을 생성한다.
drop table emp02;

create table emp02
as
select empno, ename, sal 
from emp;

select * from emp02;

-- 5. 30번 부서에서 근무하는 사원들의 사원번호(empno), 이름(ename), 부서명(dname)을 가지고 있는 테이블을 생성한다.
drop table emp03;

create table emp03
as
select e.empno, e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.deptno = 30;

select * from emp03;

-- 6. 각 부서별 급여 총합, 평균, 최대값, 최소값, 사원 수를 가지고 있는 테이블을 생성한다.
drop table emp04;

create table emp04
as
select deptno, sum(sal) sum, trunc(avg(sal)) avg, max(sal) max, min(sal) min, count(sal) count
from emp
group by deptno;

select * from emp04 order by deptno;