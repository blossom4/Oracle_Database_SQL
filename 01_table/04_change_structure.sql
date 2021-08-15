-- CHANGE TABLE STRUCTURE
-- alter table 'table_name'
-- 1. add ('column', 'data_type', 'constraint')
-- 2. modify('column', 'data_type', 'constraint')
-- 3. rename to 'table_name'
-- 4. rename column 'column1' 'column2'
-- 5. drop column 'column'
-- drop table 'table_name'

-- test1 table
drop table test1;

create table test1 (
data1 number not null,
data2 number not null
);

-- 1. add column
alter table test1
add (data3 number not null);

-- 2. change data type of column
alter table test1
modify (data3 varchar2(100));

-- 3. change table name
alter table test1
rename to testOne;

-- 4. change column name
alter table testOne
rename column data3 to data4;

-- 5. delete column
alter table testOne
drop column data4;

-- 6. delete table
drop table testOne;

select * from testOne;