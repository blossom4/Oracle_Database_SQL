-- VIEW
-- DB에서 제공하는 가상의 table을 의미한다.
-- 복잡한 query문을 대신할  수있다.
-- create view 'view_name'
-- as
-- subquery

-- 1. 사원의 사원번호(empno), 이름(ename), 급여(sal), 부서이름(dname), 근무지역(loc)을 가지고 있는 view를 만든다.
drop view emp_dept_view;

create view emp_dept_view
as
select e.empno, e.ename, e.sal, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno;

select * from emp_dept_view;

-- 2. emp100 table 생성
drop table emp100;

create table emp100
as
select * from emp;

drop table dept100;

create table dept100
as
select * from dept;

create view emp100_dept100_view
as
select e.empno, e.ename, e.sal, d.dname, d.loc
from emp100 e, dept100 d
where e.deptno = d.deptno;

select * from emp100_dept100_view;

-- 3. 원본 table에 data 저장
insert into emp100 (empno, ename, sal, deptno)
values (5000, 'PEPE', 9000, 10);

select * from emp100;

-- view는 subquery를 가지고 있다가 view로 조회하게 되면 subquery를 거쳐서 data가 나오게 된다.
select * from emp100_dept100_view;

-- 4. 원본 table에 data 저장
-- 여러 table을 조회하는 경우에는 view를 통해 data를 수정할 수 없다.
-- 단일 table을 조회하는 경우에는 가능하다.
insert into emp100_dept100_view (empno, ename, sal, deptno)
values (6000, 'BLOSSOM', 10000, 20);
-- 오류 보고 -
-- SQL 오류: ORA-00904: "DEPTNO": 부적합한 식별자
-- 00904. 00000 -  "%s: invalid identifier"