-- TABLE LEVEL CONSTRAINTS
-- 제약조건을 column마다 지정하지않고 하단에 몰아서 지정할 수 있다.
-- column level: coloumn명 옆에 기술하는 것
-- table level: table 하단에 몰아서 기술하는 것

-- 1. column level
drop table test10;

create table test10 (
data1 number constraint test10_data1_pk primary key,
data2 number not null constraint test10_data2_uk unique,
data3 number not null constraint test10_data3_fk
                      references emp(empno),
data4 number not null constraint test10_data4_ck
                      check(data4 between 1 and 10),
data5 number not null constraint test10_data5_ck
                      check(data5 in(10, 20, 30))
);

select * from test10;

-- 2. table level
drop table test11;

create table test11 (
data1 number,
data2 number not null,
data3 number not null,
data4 number not null,
data5 number not null,

constraint test11_data1_pk primary key(data1),
constraint test11_data2_uk unique(data2),
constraint test11_data3_fk foreign key(data3)
                           references emp(empno),
constraint test11_data4_ck check(data4 between 1 and 10),
constraint test11_data5_ck check(data5 in(10, 20, 30))
);

select * from test11;

-- 3. 복합키
drop table test12;

create table test12 (
data1 number,
data2 number,
constraint test12_combo_pk primary key(data1, data2)
);

insert into test12 (data1, data2)
values(100, 200);

insert into test12 (data1, data2)
values(100, 300);

insert into test12 (data1, data2)
values(400, 200);

insert into test12 (data1, data2)
values(null, null);
-- 오류 보고 -
-- ORA-01400: NULL을 ("C##BLOSSOM"."TEST12"."DATA1") 안에 삽입할 수 없습니다

select * from test12;