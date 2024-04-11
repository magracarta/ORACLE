-- 05_DDL_Seaunce.sql

-- * 오라클 - 시퀀스(Sequence)
--		: 테이블 내의 중복되지 않는 숫자를 자동으로 생성하는 자동 번호 발생기.
-- 		: 테이블 생성 후 시퀀스(일련번호)를 따로 만들어야 한다.


-- 생성 방법
-- create sequence 시퀀스 이름 start with  시작 숫자 increment by 증가량;

-- 주로 number 형식에 기본키값으로 사용합니다.
-- 일련번호정도로 이해하셔도 무방합니다.
-- number(자리수) : 자료형의 자리수가 몇자리냐에 따라 그 만틈 숫자가 증가할 수 있습니다.

--[1] 시퀀스의 생성
CREATE SEQUENCE book_seq START WITH 1 INCREMENT BY 1;
-- 인서트에서 삽입 오류가 났을 때 테이블이 안들어 갔어도 시퀀스의 값은 증감한다.


INSERT INTO booklist values( book_seq.nextVal, '일곱해의 마지막', 2020, 12150,2000 ,'all');

INSERT INTO booklist values( book_seq.nextVal, '봉제인형 살인사건', 2019, 13150,2000 ,'18');

INSERT INTO booklist values( book_seq.nextVal, '쇼코의 미소', 2023, 13420,2000 ,'12');
INSERT INTO booklist VALUES (book_seq.nextVal , '아무책', 2024, 20000,30000,'30');

SELECT * from booklist;





-- [3] 시퀀스 수정 : 최대 증가값을 14까지로 제한.
alter sequnce book_seq maxvalue 14;

-- [4] 시퀀스 삭제
drop sequence book_seq;

-- [5] 시퀀스 재생성 : 다음 숫자부터 시작하게 하여 기존 레코드와 중복 되지 않게 한다.
create sequence book_seq start with 15 increment by 1;

-- 1 부터 1씩 늘어나는 member_seq rent_seq 를 생성해주세요.
create sequence member_seq start with 1 increment by 1;
create sequence rent_seq start with 1 increment by 1;

SELECT * from memberlist;



