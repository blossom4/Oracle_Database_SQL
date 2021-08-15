-- INSERT
-- table에 새로운 row를 추가한다.
-- insert into 'table name' ('column')
-- values('value')

-- emp01 생성
drop table table1;

create table emp01
as
select empno, ename, job from emp where 1=0;

select * from emp01;

-- 1. 다음과 같은 사원 정보를 추가한다.
-- 1111 조영신 인사
insert into emp01 (empno, ename, job)
values (1111, '조영신', '인사');
-- 2222 임예나 개발
insert into emp01 (empno, ename, job)
values (2222, '임예나', '개발');
-- 3333 서회형 생산
insert into emp01 (empno, ename, job)
values (3333, '서회형', '생산');
-- 4444 김은솔 인사
insert into emp01 (empno, ename, job)
values (4444, '김은솔', '인사');

-- 2. column 목록을 생략할 수 있다.
-- 5555 김지윤 개발
insert into emp01
values (5555, '김지윤', '개발');

-- 3. column 목록이 비어있는 경우에 null이 자동으로 채워진다.
--    null을 직접 입력해서 명시적으로 저장할 수 있다.
insert into emp01 (empno, ename)
values (6666, '강우영');
-- values (6666, '강우영', null);

-- emp02 생성
drop table emp02;

create table emp02
as
select empno, ename, job from emp where 1=0;

select * from emp02;

insert into emp02(empno, ename, job)
select empno, ename, job from emp;

insert into emp02
select empno, ename, job from emp01;

select * from emp02;

-- emp03 생성
drop table emp03;

create table emp03
as
select empno, ename, job from emp where 1=0;

select * from emp03; 

-- emp04 생성
drop table emp04;

create table emp04
as
select empno, ename, hiredate from emp where 1=0;

select * from emp04;

insert all
into emp03 (empno, ename, job) values (empno, ename, job)
into emp04 (empno, ename, hiredate) values (empno, ename, hiredate)
select empno, ename, job, hiredate from emp;

-- 4. 사원번호(empno), 이름(ename), 급여(sal)를 저장할 수 있는 빈 테이블을 만들고
--    급여가 1500 이상인 사원들의 사원번호(empno), 이름(ename), 급여(sal)정보를 저장한다.
drop table emp05;

create table emp05
as
select empno, ename, sal from emp where 1=0;

insert into emp05 (empno, ename, sal)
select empno, ename, sal
from emp
where sal >= 1500;

select * from emp05;

-- 5. 사원번호(empno), 이름(ename), 부서명(dname)을 저장할 수 있는 빈 테이블을 만들고,
--    DALLAS 지역에 근무하고 있는 사원들의 사원번호(empno), 이름(ename), 부서명(dname)을 저장한다.
drop table emp06;

create table emp06
as
select empno, ename, dname from emp, dept where 1=0;

insert into emp06 (empno, ename, dname)
select e.empno, e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and d.loc = 'DALLAS';

select * from emp06;
