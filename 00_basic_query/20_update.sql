-- UPDATE
-- row의 column값을 수정한다.
-- UPDATE 'table name'
-- SET 'column1' = 'value1', 'column2' = 'value2'...
-- WHERE 'condition'

-- emp01 생성
drop table emp01;

create table emp01
as
select * from emp;

select * from emp01;

-- 1. 사원들의 부서번호(deptno)를 40번으로 변경한다.
update emp01
set deptno = 40;

-- 2. 사원들의 입사일(hiredate)을 오늘로 변경한다.
update emp01
set hiredate = sysdate;

-- 3. 사원들의 직무(job)를 개발자(DEVELOPER)로 변경한다.
update emp01
set job = 'DEVELOPER';

-- 4. 1, 2, 3번을 한 번에 변경한다.
update emp01
set deptno = 40, hiredate = sysdate, job = 'DEVELOPER';

-- 5. 10번 부서에 근무하고 있는 사원들을 40번 부서로 수정한다.
update emp01
set deptno = 40
where deptno = 10;

-- 6. 직무가 SALESMAN인 사원들의 입사일(hiredate)을 오늘로, 커미션(comm)을 2000으로 수정한다.
update emp01
set hiredate = sysdate, comm = 2000
where job = 'SALESMAN';

-- 7. 전체 사원의 평균 급여보다 낮은 사원들의 급여(sal)를 50% 인상한다.
update emp01
set sal = sal * 1.5
where sal < (select avg(sal)
             from emp01);
             
-- 8. 직무가 MANAGER인 사원들의 직무를 DEVELOPER로 수정한다.
update emp01
set job = 'DEVELOPER'
where job = 'MANAGER';

-- 9. 30번 부서에 근무하고 있는 사원들의 급여(sal)를 전체 평균급여로 수정한다.
update emp01
set sal = (select avg(sal)
           from emp01)
where deptno = 30;

-- 10. BLAKE 밑에서 근무하고 있는 사원들의 부서를 DALLAS 지역의 부서번호(deptno)로 수정한다.
update emp01
set deptno = (select deptno
              from dept
              where loc = 'DALLAS')
where mgr = (select empno
             from emp01
             where ename = 'BLAKE');

-- 11. 20번 부서에 근무하고 있는 사원들의 직속상관을 KING, 급여를 전체급여의 최고값으로 수정한다.
update emp01
set mgr = (select empno
           from emp01
           where ename = 'KING'),
    sal = (select max(sal)
           from emp01)
where deptno = 20;

-- 12. 직무가 CLERK인 사원들의 직무와 급여액을 20번 부서에 근무하고 있는 사원 중 최고 급여를 받는 사원의 직무와 급여액으로 수정한다.
update emp01
set job = (select job
           from emp01
           where sal = (select max(sal)
                        from emp01)), 
    sal = (select max(sal)
           from emp01
           where deptno = 20)
where job = 'CLERK';