-- TRANSACTION
-- 최종 결과를 내기까지 위한 하나의 작업 단위
-- 오라클 DB는 개발자가 전달한 INSERT, UPDATE, DELETE를 메모리상에서만 수행하고 디스크에 반영하지 않는다.
-- DB 조작이 완료되면 이를 디스크에 반영해야한다.
-- 작업이 최초로 시작되고 디스크에 반영되는 모든 작업의 단위를 TRANSACTION이라고 한다.
-- COMMIT: transaction을 완료하고 디스크에 반영한다. 복구가 불가능하다.
-- ROLLBACK: transaction을 취소한다.
-- SAVEPOINT: rollback의 단위를 지정한다.


C:\Users\cho82\Downloads\ColorTool>sqlplus ID/PASSWORD

SQL*Plus: Release 19.0.0.0.0 - Production on 토 8월 14 17:55:34 2021
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

마지막 성공한 로그인 시간: 토 8월  14 2021 17:50:12 +09:00

다음에 접속됨:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> select * from test;
select * from test
              *
1행에 오류:
ORA-00942: 테이블 또는 뷰가 존재하지 않습니다


SQL> drop table test1;

테이블이 삭제되었습니다.

SQL> create table test1 (
  2  data1 number not null,
  3  data2 number not null
  4  );

테이블이 생성되었습니다.

SQL> insert into test1 (data1, data2)
  2  values (100, 200)
  3  values (101, 201)
  4  values (102, 202);
values (101, 201)
*
3행에 오류:
ORA-00933: SQL 명령어가 올바르게 종료되지 않았습니다


SQL> insert into test1 (data1, data2)
  2  values (100, 200);

1 개의 행이 만들어졌습니다.

SQL> insert into test1 (data1, data2)
  2  values (101, 201)
  3  ;

1 개의 행이 만들어졌습니다.

SQL> insert into test1 (data1, data2)
  2  values (102, 202);

1 개의 행이 만들어졌습니다.

SQL> select * from test1;

     DATA1      DATA2
---------- ----------
       100        200
       101        201
       102        202

SQL> commit;

커밋이 완료되었습니다.

SQL> update test1
  2  set data2 = 2000
  3  where data1 = 100
  4  ;

1 행이 업데이트되었습니다.

SQL> select * from test1;

     DATA1      DATA2
---------- ----------
       100       2000
       101        201
       102        202

SQL> delete from test1;

3 행이 삭제되었습니다.

SQL> select * from test1;

선택된 레코드가 없습니다.

SQL> rollback;

롤백이 완료되었습니다.

SQL> select * from test1;

     DATA1      DATA2
---------- ----------
       100        200
       101        201
       102        202

SQL> insert into test1 (data1, data2)
  2  values (103, 203);

1 개의 행이 만들어졌습니다.

SQL> savepoint p1;

저장점이 생성되었습니다.

SQL> insert into test1 (data1, data2)
  2  values (104, 204);

1 개의 행이 만들어졌습니다.

SQL> rollback to p1;

롤백이 완료되었습니다.

SQL> select * from test1;

     DATA1      DATA2
---------- ----------
       100        200
       101        201
       102        202
       103        203

SQL>