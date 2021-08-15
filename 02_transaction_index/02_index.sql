-- INDEX
-- DB에서 검색속도를 빠르게 하기 위해 사용한다.
-- select index_name, table_name, column_name
-- from user_ind_columns
-- where table_name = 'table_name'

-- test100 table
drop table test100;

create table test100 (
data1 number constraint test100_pk primary key,
data2 number not null
);

select index_name, table_name, column_name
from user_ind_columns;

-- emp01 table
drop table emp01;

create table emp01
as
select * from emp;

-- index 생성
create index emp01_idx
on emp01(ename);

select * from emp;