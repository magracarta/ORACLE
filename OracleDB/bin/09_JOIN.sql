-- 09_JOIN.sql

SELECT * from emp;
SELECT * from dept;
drop table emp2;
CREATE TABLE  emp2 as select ename, deptno from emp where job = 'SALESMAN'; --테이블의 복사 
select * from emp2;


--[1] 사원명이 'SCOTT' 인 사원의 부서명을 알고 싶을때
select deptno from emp where ename = 'SCOTT'; --20
select dname from dept where deptno = 20; -- RESEARCH

--서브쿼리 사용 ----------------------------------------------------------------------------------
SELECT dname from dept where deptno = (select deptno from emp where ename = 'SCOTT');

-- JOIN
-- 두개이상의 테이블에 나눠져 있는 관련 데이터들을 하나의 테이블로 모아서 조회하고자 할때 사용하는 명령이다.

-- cross join : 두개 이상의 테이블이 조인
-- * 가장 최악의 결과를 얻는 조인 방식
select * from emp2, dept;



--equip join : 조인 대상이 되는 두 테이블에서 공통적으로 존재하는 컬럼의 값이 일치하는 행을 연결하여 결과를 생성
SELECT * FROM emp2 , dept WHERE emp2.deptno = dept.deptno;
-- 바로뒤에 변수 선언처럼 a 와 b를 선언하여 짧게 활용가능
SELECT * FROM emp2 a, dept b WHERE a.deptno = b.deptno;

SELECT * FROM emp a, dept b WHERE a.deptno = b.deptno;



-- rentlist의 대여일자 , 대여 도서번호, 대여회원번호, 할인금액을 출력하되, 도서의 제목 도서번호 옆에 출력하세요.
SELECT a.rentdate, a.bnum , b.subject ,a.mnum, a.discount FROM rentlist a, booklist b
WHERE a.bnum = b.booknum;


select * from rentlist;
select * from memberlist;

-- rentlist 의 대여일자, 대여 도서번호 , 대여회원 번호, 할인금액을 출력하되, 회원은 이름을 대여회원 번호 옆에 출력하세요.
SELECT a.rentdate, a.bnum, a.mnum, b.name  , a.discount FROM RENTLIST a, memberlist b
where a.mnum = b.membernum;

-- rentlist의 대여일자, 대여도서번호, 대여회원번호, 할인금액을 출력하되, 도서의 제목 , 회원의 이름을
-- 도서번호와 회원번호 옆에 출력하세요.
SELECT a.rentdate, a.bnum,b.subject  , a.mnum,c.name , a.discount, b.rentprice- a.discount as "매출액" 
FROM RENTLIST a, booklist b , memberlist c
where a.bnum = b.booknum and a.mnum= c.membernum;


-- non-equi join
-- 동일 컬럼이 없어서 다른 조건을 사용하여 조인
-- 조인 조건에 특정 범위내에 있는지를 조사하기 위해 조건절에 조인 조건을 '=' 연산자 이외의 비교
 SELECT * FROM emp;
 SELECT * FROM salgrade;
 
 select a.ename, a.sal, b.grade 
 from emp a , salgrade b
 where a.sal  >= b.losal and a.sal <= b.hisal;
 
  select a.ename, a.sal, b.grade 
 from emp a , salgrade b
 where a.sal  between b.losal and b.hisal;
 

-- outer join
-- 조인 조건에 만족하지 못해서 해당 결과를 출력시에 누락이 되는 문제점이 발생할때 해당 레코드를 출력하는 조인
SELECT a.booknum, a.subject, b.rentdate from BOOKLIST a, RENTLIST b
where a.booknum = b.bnum (+)

-- (+) 값이 없어도 화면에 출력해달라는 표현

--emp 테이블에는 deptno 가 40인 레코드가 하나도 없다. 그래서 조인된 결과에는 40번 부서의 이름도 loc도 표시가 안됩니다.
SELECT * from emp a , dept b
where a.deptno(+) = b.deptno;

select * from dept;
select * from emp;




-- ANSI join

-- 일반 equi 조인
select a.ename, b.dname
from emp a, dept b
where a.deptno = b.deptno;

-- Ansi inner join
-- Ansi 이너 조인의 표현방식
select ename, dname
from emp inner join dept on emp.deptno = dept.deptno;

-- Ansi 이너 조인의 표현방식 - 서로 비교되는 필드명이 같을때만 사용
select ename, dname
from emp inner join dept using(deptno);


-- Ansi outer join
-- 기존 아우터 조인의 표현방식
select * from emp, dept
where emp.bnum(+) = dept.deptno;

select * from rentlist, booklist
where rentlist.bnum(+) = booklist.booknum;

-- Ansi outer join 표현방식
SELECT * FROM emp RIGHT OUTER JOIN dept ON emp.deptno = dept.deptno;
SELECT * FROM rentlist RIGHT OUTER JOIN booklist ON rentlist.bnum = booklist.booknum;






















