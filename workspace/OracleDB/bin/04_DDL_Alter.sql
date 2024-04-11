--04_DDL_ALTER.sql

-- 생성
create table 테이블 이름();
create user scott identified by tiger;

-- 수정
alter table 테이블 이름<수정내용>;
alter user 유저이름 identified by 비밀번호;

-- 1.필드명의 변경
--ALTER TABLE 테이블 이름 RENAME COLUMN 변경정 필드 이름 TO 변경후 필드이름;
ALTER TABLE booklist RENAME COLUMN subject TO title;
SELECT * from booklist

-- 반대로 title 필드명을 subject 필드명으로 수정한다.
ALTER TABLE booklist RENAME COLUMN title TO subject;
SELECT * from booklist;

-- booklist 의 outprice필드의 이름을 rentprice로 수정한다.
ALTER TABLE booklist RENAME COLUMN outprice TO rentprice;
SELECT * from booklist;


-- memberlist 테이블의 membername 필드를 name으로 변경한다.
ALTER TABLE memberlist rename column membername to name;


-- rentlist의 idx를 numseq로 변경한다.
alter table rentlist rename column rent_date to rentdate;

-- rentlist 의 idx를 numseq로 변경하세요.
alter table rentlist rename column idx to numseq;
SELECT * from rentlist;

-- 2. 필드 자료형의 변경
-- ALTER TABLE 테이블 명 MODIFY 필드명 자료형 [ 디폴트 값이나 제약사항 ]
-- varchar2(12) 였던 memberlist 테이블의 name필드를 varchar2(30)으로 변경
alter table memberlist modify name varchar2(30);
SELECT * from memberlist;


-- 오류가 나는 이유 --> 외래키로 참조되어져있는 경우 막는다.
-- booklist의 booknum 필드를 number(5)로 자료형 변경
alter table booklist modify booknum number(5); -- 수정실패

SELECT * from booklist;
-- memberlist의 membernum필드를 number(5)로 자료형 변경
alter table memberlist modify membernum number(5); -- 수정실패

SELECT * from memberlist;

-- rentlist의 bnum필드를 number(5)로 자료형 변경
alter table rentlist modify bnum number(5); -- 수정실패


-- rentlist의 mnum필드를 number(5)로 자료형 변경
alter table rentlist modify mnum number(5); -- 수정실패

SELECT * from rentlist;


-- 외래키로 연경되어서 참조되고 , 참조하고 있는 필드들은 위의 명령으로 수정이 바로 불가능 하다.
-- 가능하게 하려면, 외래키 제약 조건을 수정하여 없에버리고, 참조되는 필드와 참조하는 필드를
-- 모두 수정한 후 외래키 제약 조건을 다시 설정한다.
-- alter 명령에 의해서 제약조건을 수정 또는 삭제하는 명령으 아래에서 학습한다.

-- 3. 필드의 추가
-- ALTER TABLE 테이블명 ADD 필드명 자료형
-- booklist에 구매등급을 저장할 수 있는 grade 필드를 varchar2(15)로 추가
alter table booklist add grade varchar2(15);

SELECT * from booklist;

-- memberlist에 성별(gender) 필드를 varchar2(3)으로 추가
alter table memberlist add gender varchar2(3);

-- memberlist에 나이(age) 필드를 number(2) 로 추가
alter table memberlist add age number(2);

SELECT * from memberlist;

-- 필드의 삭제
-- ALTER TABLE 테이블 명 DROP COLUMN 필드명

-- memberlist 테이블에서 성별 필드 제거
-- alter table memberlist drop column gender;






