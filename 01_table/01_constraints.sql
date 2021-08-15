-- CONSTRAINTS
-- NOT NULL: column에 null을 허용하지 않는다.
-- UNIQUE: 중복값을 허용하지 않는다. null은 무한히 저장할 수 있다.
-- PRIMARY KEY: 중복값을 허용하지 않으며 null값도 허용하지 않는다. 
--              각 row를 구분해서 유일한 값을 저장하기 위해서 사용한다.
-- FOREIGN KEY: 참조하는 column에 저장되어 있는 값만 저장할 수 있다. 일반적으로 pk 제약조건이 설정된 column을 참조한다.
-- CHECK: 조건에 만족할 경우 column에 저장한다.

-- 1. test1 table
drop table test1;

create table test1 (
data1 number,
data2 number not null
);

insert into test1 (data1, data2)
values (100, 101);

-- data2에 not null이라는 제약조건이 있으므로 값을 넣어주지 않으면 오류가 발생한다.
insert into test1 (data1)
values (200);
-- 오류 보고 -
-- ORA-01400: NULL을 ("C##BLOSSOM"."TEST"."DATA2") 안에 삽입할 수 없습니다.

-- data1에 값을 넣지 않으면 자동으로 null값이 들어간다.
insert into test1 (data2)
values (201);

select * from test1;

-- 2. test2 table
drop table test2;

create table test2 (
data1 number,
data2 number constraint test2_data2_uk unique
);

insert into test2 (data1, data2)
values (100, 101);

insert into test2 (data1, data2)
values (200, 201);

-- data2에 unique라는 제약조건이 있으므로 같은값을 넣으면 오류가 발생한다.
insert into test2 (data1, data2)
values (300, 201);
-- 오류 보고 -
-- ORA-00001: 무결성 제약 조건(C##BLOSSOM.TEST2_DATA2_UK)에 위배됩니다.

insert into test2 (data1, data2)
values (200, null);

insert into test2 (data1)
values (200);

select * from test2;

-- 3. test3 table
drop table test3;

create table test3 (
data1 number,
data2 number constraint test3_data2_pk primary key
);

insert into test3 (data1, data2)
values (100, 101);

-- data2에 primary key라는 제약조건이 있으므로 같은값이나 null이 있으면 오류가 발생한다.
insert into test3 (data1, data2)
values (100, 101);
-- 오류 보고 -
-- ORA-00001: 무결성 제약 조건(C##BLOSSOM.TEST3_DATA2_PK)에 위배됩니다.
insert into test3 (data1, data2)
values (100, null);
-- 오류 보고 -
-- ORA-01400: NULL을 ("C##BLOSSOM"."TEST3"."DATA2") 안에 삽입할 수 없습니다.

select * from test3;

-- 4. test4 table
drop table test4;

create table test4(
data1 number constraint test4_pk primary key,
data2 number not null
);

insert into test4 (data1, data2)
values (100, 101);

insert into test4 (data1, data2)
values (200, 201);

select * from test4;


-- 5. test5 table
drop table test5;

create table test5 (
data3 number not null,
data4 number constraint test5_data4_fk
             references test4(data1)
);

insert into test5 (data3, data4)
values (1, 100);

insert into test5 (data3, data4)
values (2, 100);

insert into test5 (data3, data4)
values (3, 200);

insert into test5 (data3, data4)
values (4, 200);

insert into test5 (data3, data4)
values (5, null);

insert into test5 (data3)
values (6);

-- data4는 data1, data2를 참조하고 있으므로 그 외의 값을 넣으면 오류가 발생한다.
insert into test5 (data3, data4)
values (7, 300);
-- 오류 보고 -
-- ORA-02291: 무결성 제약조건(C##BLOSSOM.TEST5_DATA4_FK)이 위배되었습니다- 부모 키가 없습니다.

select * from test5;

-- 6. test6 table
drop table test6;

create table test6 (
data1 number constraint test6_data1_ck
             check (data1 between 1 and 10),
data2 number constraint test6_data2_ck
             check (data2 in (10, 20, 30))
);

insert into test6 (data1, data2)
values (1, 10);

insert into test6 (data1, data2)
values (2, 20);

-- data1의 제약조건에 맞지 않으므로 오류가 발생한다.
insert into test6 (data1, data2)
values (20, 10);
-- 오류 보고 -
-- ORA-02290: 체크 제약조건(C##BLOSSOM.TEST6_DATA1_CK)이 위배되었습니다.

-- data2의 제약조건에 맞지 않으므로 오류가 발생한다.
insert into test6 (data1, data2)
values (5, 100);
-- 오류 보고 -
-- ORA-02290: 체크 제약조건(C##BLOSSOM.TEST6_DATA2_CK)이 위배되었습니다.

select * from test6;