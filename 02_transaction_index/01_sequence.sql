-- SEQUENCE
-- table 내의 column중 primary key를 지정하기 애매한 경우 1부터 1씩 증가되는 값을 저장하는 column을 추가한다.
-- create sequence 'sequence_name'
-- start with 'number'
-- increment by 'number'
-- maxvalue 'number' / nomaxvalue
-- minvalue 'number' / nominvalue
-- cycle / nocycle
-- cache 'number' / nocache

-- test1 table
drop table test1;

create table test1 (
idx number constraint test1_idx_pk primary key,
number_data number not null
);

-- 1. create sequence
create sequence seq1
start with 1
increment by 1
minvalue 0;

-- 2. set / add sequence
insert into test1 (idx, number_data)
values (seq1.nextval, 100);

insert into test1 (idx, number_data)
values (seq1.nextval, 200);

select * from test1;

-- 3. check current sequence value
select seq1.currval from dual;

-- 4. delete sequence
drop sequence seq1;