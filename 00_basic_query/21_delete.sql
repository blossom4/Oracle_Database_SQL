-- DELETE
drop table emp01;

create table emp01
as
select * from emp;

delete from emp01;

select * from emp01;

-- 1. 사원번호(empno)가 7499인 사원의 정보를 삭제한다.
delete from emp01
where empno = 7499;

-- 2. 사원의 급여(sal)가 평균 이하인 사원의 정보를 삭제한다.
delete from emp01
where sal <= (select avg(sal)
              from emp01);
              
-- 3. 커미션(comm)을 받지 않는 사원들의 정보를 삭제한다.
delete from emp01
where comm is null;