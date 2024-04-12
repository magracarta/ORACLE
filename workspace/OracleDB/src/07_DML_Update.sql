--07_DML_Update

-- 데이터 변경 - 수정(UPDATE)
-- UPDATE 테이블 명 SET 변경내용 WHERE 검색 조건
SELECT * FROM MEMBERLIST;

UPDATE MEMBERLIST SET age = 30 , phone = '010-0000-1111'  WHERE membernum = 3;
-- WHERE 조건이 없으면 모든 레코드의 값이 변경된다.


-- 명령문에 WHERE 이후 구문은 생략 가능하다.
-- 다만 이부분을 생략하면 모든 레코드를 대상으로 해서 UPDATE 명령이 실행되어 모든 레코드가 수정된다.
-- 검색조건 : 필드명 (비교- 관계연산자) 조건값 으로 이루어진 조건연산이며, 흔히 자바에서 if()
-- if 괄호안에 사용했던 연산을 그대로 사용하는 게 보통이다.
-- 나이가 29세 이상 -> WHERE AGE >=29
-- 두개 이상의 필드를 수정하고자 한다면 (,) 로 구분해서 기술한다.
-- 복합 조건을 사용하고자 한다면 and , or 등을 사용한다. ( && -> and, || -> or, !=> Not )


select * from booklist;
-- booklist 테이블의 도서 제목 '봉제인형 살인사건' 도서의 grade를 '18' 로 수정하세요.
UPDATE BOOKLIST set grade = '18' WHERE title = '봉제인형 살인사건';
UPDATE BOOKLIST set grade = '18' WHERE title like '봉제인형%';
UPDATE BOOKLIST set grade = '18' WHERE title like '%살인사건';
UPDATE BOOKLIST set grade = '18' WHERE title like '%인형%';
--% 어떤 글자로도 대치 될수 있다.
-- 글자를 정확하게 쓰지 않아도 조회 할수 있게 해주는 키워드 like

-- booklist의 모든 도서의 대여가격(rentprice)를 10% 이상으로 인상한 값으로 수정하세요.
UPDATE booklist set rentprice = rentprice+(rentprice*0.1);
UPDATE booklist set rentprice = rentprice*1.1;

-- memberlist에서 사은 포인트 (bpoint)가 300 이상인 회원의 bpoint 에 30점을 가산해주세요.
UPDATE memberlist set bpoint = bpoint + 30 where bpoint >= 300;

-- 생년월일이 NULL인 회원의 생년월일을 2000-01-01 로 AGE를 23으로 변경하세요.
UPDATE memberlist set age = 23 , birth ='2000-01-01' where   birth is null;

select * from memberlist;

--GENDER가 NULL인 회원의 GENDER를  'M'으로 변경하세요.
UPDATE memberlist set gender = 'M' where gender is null;



-- 외래키로 참조되는 필드를 수정
UPDATE booklist set booknum = 17 where booknum =30;

-- rentlist에 bnum에 7번이 없다면 변경이 가능
-- rentlist에 bnum에 7번이 없다면 변경이 불가능.
-- ORA-02292: integrity constraint (SCOTT.FK1) violated - child record found

-- 해결방법 #1 외래키를 지우고 해당 booknum 과 bnum을 함꼐 수정한 후 다시 외래키를 설정
-- 해결방법 #2 PL/SQL 의 트리거 기능을 이용해서 동시에 변경  -> My SQL에서는 자동으로 수정해주는 기능이 있어 신경 X

-- 레코드의 삭제 
-- delete from 테이블명 where 조건식
-- where 조건식이 생략되면 모든 레코드가 삭제

-- rentlist 테이블에서 discount 가 10 이하인 레코드를 삭제;
delete from rentlist where discount where discount <=10;

-- 삭제의 제한
delete from BOOKLIST where booknum =30; -- 삭제 실패
-- ORA-02292: integrity constraint (SCOTT.FK1) violated - child record found


-- 해결 방법 #1
-- 이를 해결하려면 우선 rentlist 테이블에 해당 도서 대여목록 레코드(child record)를 모두 삭제한 후
-- booklist 테이블에서 해당 도서를 삭제
delete from rentlist where bnum = 30;
delete from BOOKLIST WHERE booknum = 30;



-- 해결 방법 #2
-- 외래키 제약 조건을 삭제한 후 다시 생성
-- 외래키 생성시에 "옵션을 추가해서"
-- "참조되는 값(parents recored)이 삭제되면 참조하는 값(child recored)도 같이 삭제" 되게 구성한다.

-- 외래키 삭제
ALTER table rentlist drop constraint fk1;

--새로운 외래키 추가
ALTER table rentlist add constraint fk1
FOREIGN KEY(bnum) REFERENCES booklist(booknum) on delete cascade; -- cascade 종속 삭제
-- 오라클에선 UPDATE 기능이 없고 mySQL 은 가능


select * from booklist;
select * from rentlist;

--memberlist 테이블에서 회원 한명을 삭제하면, rentlist테이블에서도 해당회원이 대여한 기록을 같이 삭제하도록
-- 외래키 설정을 바꿔주세요 (외래키 제약조건 삭제 후 재생성)

alter table rentlist drop constraint fk2;
alter table rentlist add constraint fk2
foreign key (mnum) references memberlist(membernum) on delete cascade;









