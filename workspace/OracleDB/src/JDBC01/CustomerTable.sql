--CustomerTable.sql

CREATE TABLE customer(
	num number(3),
	name varchar2(10),
	email varchar2(20),
	tel varchar2(15)
);

insert into customer values (1, '홍길동', 'abc1@abc.com', '010-1234-5234');
insert into customer values (2, '홍길서', 'abc2@abc.com', '010-2234-5234');
insert into customer values (3, '홍길남', 'abc3@abc.com', '010-3234-3234');
insert into customer values (4, '홍길북', 'abc4@abc.com', '010-4234-2234');
insert into customer values (5, '아무개', 'abc5@abc.com', '010-5234-1234');

select * from CUSTOMER;

-- 자바 프로젝트 안에 있지만 자바 명령을 하나도 실행하지 않음...
-- 자바 프로그램이랑은 별도의 연결이다.
-- 순수하게 데이터 베이스만 다룰때 해당 메뉴를 활용한다.









