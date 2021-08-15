-- LINK PROGRAM
-- JDBC: Java 프로그램과 DB를 연결하여 data를 관리할 수 있도록하는 기술이다.

drop table test;

create table test (
test_idx number constraint test_pk primary key,
test_number number not null,
test_str varchar2(100) not null
);

create sequence seq_1
start with 0
increment by 1
minvalue 0;

select * from test;