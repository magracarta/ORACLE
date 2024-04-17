--12_GroupFunction

-- 테이블내의 하나의 필드값들 전체로 하는 함수

SELECT SUM( inprice ) as "입고가격합계" FROM BOOKLIST;
SELECT SUM(rentprice) as "대여가격합계" FROM BOOKLIST WHERE inprice >= 18000;


-- 갯수 ( COUNT )
SELECT COUNT(*) as "회원수" FROM memberlist;
SELECT COUNT(*) as "회원수" FROM memberlist where bpoint >=100;

-- 평균 ( AVG )
SELECT AVG( inprice ) as "입고가격 평균" from BOOKLIST;
--												소수점 몇자리까지 남길 것인다.

-- 숫자로 다른 숫자를 계산 시킬일이 있으면 round로 써야한다. 수치데이터로 남겨야함으로
SELECT ROUND(AVG( inprice ) , 0) as "입고가격 평균" from BOOKLIST;

-- TO_CHAR로 변경된 숫자는 문자로 변경된 것이므로 명령실행 이후  숫자로서의 기능이 상실됩니다. 다른 숫자와 계산 불가
-- 화면에 출력 하고 말거면 TO_CHAR 로 문자열 (컴마 포함) 로 되어있기 때문에 다른 숫자랑 계산 불가
SELECT TO_CHAR(AVG( inprice ) , '999,999,999') as "입고가격 평균" from BOOKLIST;


-- MAX : 최대값
-- SEQUENCE에 의해서 방금 추가된 자동 증가번호를 조회할대 많이 사용합니다.
SELECT MAX(inprice) FROM booklist;
SELECT MAX(booknum) FROM booklist; -- 번호의 최근 번호를 조회하기 위해서 사용하기도한다.ex)booknum

-- MIN : 최솟값
SELECT MIN(inprice) FROM booklist; 



-- GROUP BY
-- 그룹함수의 결과들을 다른 필드의 그룹으로 재구성
SELECT COUNT (*) AS "총대여건수" FROM RENTLIST; -- 대여권수

-- 도서별 대여건수 
SELECT bnum as "도서번호",  COUNT(*) AS "도서별 대여건수" , SUM(discount) AS "할인금액합계"
FROM RENTLIST GROUP BY bnum;


-- RENTLIST 테이블에서 대여일자(RENTDATE) 별 대여건수와 할인금액 평균
SELECT rentdate AS 대여일자 , COUNT (*) AS 대여건수
FROM rentlist GROUP BY rentdate ORDER BY rentdate DESC;


-- HAVING
-- 그룹핑된 내용들에 조건을 붙일때
SELECT rentdate AS 대여일자, COUNT(*) AS 대여건수 , AVG(discount) AS "할인 금액 평균"
FROM rentlist
GROUP BY rentdate
HAVING AVG(discount) >= 150
ORDER BY rentdate DESC;



























