-- ADD CONSTRAINT
-- table을 생성한 후 제약조건을 추가하거나 제거할 때 alter를 사용한다.
-- 추가: alter table 'table_name' add 'constraint'
-- 삭제: alter table 'table_name' drop 'constraint'

-- test20 table
drop table test20;

create table test20 (
data1 number,
data2 number,
data3 number,
data4 number,
data5 number,
data6 number
);

-- 1. null constraint 추가
alter table test20
modify data1 not null;

insert into test20 (data1)
values (null);
-- 오류 보고 -
-- ORA-01400: NULL을 ("C##BLOSSOM"."TEST20"."DATA1") 안에 삽입할 수 없습니다

-- 2. primary key constraint 추가
alter table test20
add constraint test20_data2_pk primary key(data2);

insert into test20 (data1, data2)
values (1, 10);

insert into test20 (data1, data2)
values (2, 10);
-- 오류 보고 -
-- ORA-00001: 무결성 제약 조건(C##BLOSSOM.TEST20_DATA2_PK)에 위배됩니다

-- 3. foreign key constraint 추가
alter table test20
add constraint test20_data3_fk foreign key(data3)
                               references emp(empno);

insert into test20 (data1, data2, data3)
values (10, 100, 7369);

-- data3가 empno를 참조하는데 101이라는 값이 없으므로 오류가 발생한다.
insert into test20 (data1, data2, data3)
values (10, 100, 101);
-- 오류 보고 -
-- ORA-00001: 무결성 제약 조건(C##BLOSSOM.TEST20_DATA2_PK)에 위배됩니다

-- 4. unique constraint 추가
alter table test20
add constraint test20_data4_uk unique(data4);

insert into test20 (data1, data2, data4)
values (12, 102, 100);

-- unique constraint가 걸려있으므로 100값을 data4에 넣을 수 없다.
insert into test20 (data1, data2, data4)
values (13, 103, 100);
-- 오류 보고 -
-- ORA-00001: 무결성 제약 조건(C##BLOSSOM.TEST20_DATA4_UK)에 위배됩니다

-- 5. check constraint
alter table test20
add constraint test20_data5_ck check(data5 between 1 and 10);

insert into test20 (data1, data2, data5)
values (14, 104, 5);

alter table test20
add constraint test20_data6_ck check(data6 in (10, 20, 30));

insert into test20 (data1, data2, data6)
values (16, 106, 20);

select * from test20;

-- 6. test30 table delete constraint
create table test30(
data1 number not null,
data2 number constraint test30_data2_pk primary key,
data3 number constraint test30_data3_fk
             references emp(empno),
data4 number constraint test30_data4_uk unique,
data5 number constraint test30_data5_ck
             check (data5 between 1 and 10),
data6 number constraint test30_data6_ck
             check (data6 in (10, 20, 30))
);

-- not null constraint 제거
alter table test30
modify data1 null;

insert into test30 (data1, data2)
values (null, 100);

-- primary key constraint 제거
alter table test30
drop constraint test30_data2_pk;

insert into test30 (data2)
values (null);

-- foreign key constraint 제거
alter table test30
drop constraint test30_data3_fk;

insert into test30 (data3)
values (1000);


-- unique constraint 제거
alter table test30
drop constraint test30_data4_uk;

insert into test30 (data4)
values (100);

-- check constraint 제거
alter table test30
drop constraint test30_data5_ck;

alter table test30
drop constraint test30_data6_ck;

insert into test30 (data5, data6)
values (15, 15);

select * from test30;

-- constraint enable / disable
-- alter table 'table_name'
-- enable / disable 'constraint'

-- 1. test40 table
create table test40 (
data1 number constraint test40_data1_pk primary key
);

insert into test40 (data1)
values (100);

-- primary key constraint가 있으므로 같은 곳에 값을 넣으면 오류가 발생한다.
insert into test40 (data1)
values (100);
-- 오류 보고 -
-- ORA-00001: 무결성 제약 조건(C##BLOSSOM.TEST40_DATA1_PK)에 위배됩니다.

alter table test40
disable constraint test40_data1_pk;

-- 이미 test40 table에는 primary key 조건에 맞지 않는 data들이 들어가 있으므로 오류가 발생한다.
alter table test40
enable constraint test40_data1_pk;
-- 오류 보고 -
-- ORA-02437: (C##BLOSSOM.TEST40_DATA1_PK)을 검증할 수 없습니다 - 잘못된 기본 키입니다
-- 02437. 00000 -  "cannot validate (%s.%s) - primary key violated"
-- *Cause:    attempted to validate a primary key with duplicate values or null
--            values.
-- *Action:   remove the duplicates and null values before enabling a primary
--            key.

delete from test40;

insert into test40 (data1)
values (100);

alter table test40
enable constraint test40_data1_pk;

select * from test40;