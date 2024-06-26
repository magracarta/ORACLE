--06_DML.sql

--DML (Data Management Language) 데이터 조작언어

-- 테이블에 레코드를 조작(추가, 수정, 삭제, 조회)하기 위한 명령어들
-- INSERT(추가)
-- UPDATE(수정)
-- DELETE(삭제)
-- SELECT(조회 및 선택)


--[1] 샘플 테이블 생성
create table exam01(
	deptno number(2),
	dname varchar2(15),
	loc varchar2(15)
);


select * from exam01;

--[2] 레코드 추가

-- 레코드 추가방법 #1
insert into 테이블이름 ( 필드명1 , 필드명2, 필드명3 ,....) values ( 값1, 값2, 값3, .... );

-- 레코드 추가방법 #2
insert into 테이블 이름 values(값1, 값2, 값3,....);


-- #1과 #2의 차이점
-- #1 : 필드명과 입력되어야 하는 값들이 1:1 매칭되어 입력된다.
--		   필드명의 순서는 반드시 지켜야하는 것은 아니지만 나열된 필드명대로 값의 순서는 맞춰서 입력한다.
insert into exam01(deptno , dname,loc) values('기획부', 10,'서울'); X
insert into exam01(deptno , dname,loc) values(10,'기획부','서울'); O
insert into exam01(loc , deptno,dname) values('서울',10,'기획부'); O
-- null값을 허용하는 필드나, default 값이 있는 필드는 생략하고 입력할 수 있다.
insert into exam01 (deptno , dname) values( 10 , '기획부'); O


-- #2: 모든 필드에 해당하는 값들을 최초에 테이블 생성시에 기술한 필드순서에 맞게 모두 입력하는 방법이다.
INSERT INTO 	exam01 VALUES(10,'기획부','서울'); O
-- #2는 null 을 허용하는 곳을 비우고 입력할 수 없으며, null 이라도 직접 지정해야한다.
INSERT INTO exam01 VALUES(10, null, '서울');O

--#1과  #2 공통으로 숫자는 그냥 쓰고, 문자는 작은 따옴표로 묶어서 표현한다.


delete from booklist; --테이블의 모든 레코드를 삭제하는 명령.

-- 위 두가지 방법 중 자유롭게 선택하여서, booklist 테이블에 10개의 레코드를 주가해준다.
-- booknum은 시퀀스를 이용한다.
-- grade는 'all' '12' '18' 세가지만 골라서 입력해준다. 자신이 만든 테이블에 grade가없으면 입력하지 않아도 된다.

INSERT INTO booklist values(book_seq.nextVal, '일곱해 마지막', 2020,12150,2000,'all');
INSERT INTO booklist values(book_seq.nextVal, '봉제 인형 살인사건', 2019,13150,2000,'18');
INSERT INTO booklist values(book_seq.nextVal, '쇼코의 미소', 2023,13420,2000,'12');

insert INTO booklist(booknum, title, makeyear, inprice, rentprice, grade)
values(book_seq.nextVal, '좀비아이', 2020,12000,2500,'all');
INSERT INTO booklist values(book_seq.nextVal, '가면산장 살인사건', 2018,13320,1500,'12');
INSERT INTO booklist values(book_seq.nextVal, '나미야 잡화점의 기적', 2017,13320,2000,'18');
INSERT INTO booklist values(book_seq.nextVal, '유튜브 영상 편집', 2020,20700,2500,'all');
INSERT INTO booklist values(book_seq.nextVal, '이것이자바다', 2017,30000,3000,'18');
INSERT INTO booklist values(book_seq.nextVal, '쇼코의 미소', 2016,25000,2500,'12');
INSERT INTO booklist values(book_seq.nextVal, '쇼코의 미소', 2020,30000,3000,'all');

select * from booklist;

select * from memberlist;
ALTER TABLE memberlist RENAME COLUMN  bith to birth; 
-- memberlist 에 10명의 데이터를 추가한다. (member_seq 사용)
insert into memberlist(membernum, name, phone )
values(member_seq.nextVal, '홍길동','010-1111-2222');
insert into memberlist(membernum, name, phone )
values(member_seq.nextVal, '홍길서','010-3333-4444');
insert into memberlist(membernum, name, phone )
values(member_seq.nextVal, '홍길남','010-5555-6666');
insert into memberlist(membernum, name, phone )
values(member_seq.nextVal, '홍길복','010-7777-8888');

INSERT INTO memberlist 
values(member_seq.nextVal, '추신수', '010-5656-1234', '84/07/07' , 240, 'M',28);
INSERT INTO memberlist 
values(member_seq.nextVal, '류현진', '010-3333-1234', '83/08/08' , 142, 'F',27);

INSERT INTO memberlist 
values(member_seq.nextVal, '손흥민', '010-4444-1234', '82/09/23' , 220, 'M',23);

INSERT INTO memberlist 
values(member_seq.nextVal, '이청용', '010-6666-1234', '81/06/14' , 440, 'F',36);

INSERT INTO memberlist 
values(member_seq.nextVal, '이영표', '010-2580-1234', '82/03/16' , 140, 'M',31);

INSERT INTO memberlist 
values(member_seq.nextVal, '최지만', '010-7777-1234', '83/04/14' , 340, 'F',29);


select * from booklist;
select * from memberlist;

-- rentlist 테이블도 rent_seq를 이용해서 10개의 데이터를 추가해주세요.
select * from rentlist;
INSERT INTO rentlist VALUES(rent_seq.nextVal , '2021/10/01', 23, 2,100);
INSERT INTO rentlist VALUES(rent_seq.nextVal , '2021/10/01', 24, 2,100);
INSERT INTO rentlist VALUES(rent_seq.nextVal , '2021/10/02', 25, 6,200);
INSERT INTO rentlist VALUES(rent_seq.nextVal , '2021/10/03', 29, 8,300);
INSERT INTO rentlist VALUES(rent_seq.nextVal , '2021/10/04', 21, 9,100);
INSERT INTO rentlist VALUES(rent_seq.nextVal , '2021/10/05', 30, 10,200);
INSERT INTO rentlist VALUES(rent_seq.nextVal , '2021/10/09', 23, 10,200);

-- BNUM 은 참조키로 booklist의 booknum을 가지고있어 booknum에만 있는 숫자로만 넣어야한다.
-- Mnum  또한 memberlist의 membernum을 참조하고있어서 membernum가 가지고있는 숫자만 가능


commit 	--현재 창에서 commit는 세미콜론을 붙이지 않는다. 단일 명령이고 다른 명령과 함께 사용하지 않는 다는 뜻이다.


-- 데이터 베이스의 수많은 명령을 컴퓨터를 옮길때마다 실행시키기엔 무리가 있어
-- 백업을 사용한다.
-- 데이터 베이스 백업명령
exp userid = scott/tiger file = abc.dmp log = abc.log

--데이터 베이스 복원 명령
imp userid = scott/tiger file = abc.dmp log = abc.log full=y
--오라클의 백업 명령과 복원 명령은 모두 command창에서 실행한다.









