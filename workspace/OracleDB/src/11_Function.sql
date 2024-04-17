-- 11_Function.sql

-- [1] 샘플 테이블인 dual 테이블
select * from tab;
select * from dual;

-- [2] 임시 데이터 출력
select 1234*1234 from dual;


-- *** 문자열 처리 관련 함수 ***
-- lower(), upper(), initcap()
select lower('hong Gil Dong') as 소문자 from dual;
select upper('hong Gil Dong') as "대문자" from dual;
select initcap('hong Gil Dong') as "첫글자만 대문자" from dual;

select lower( ename ) as "이름" from emp;
select empno, upper( ename ) as "이름", initcap(job) as 직업  from emp;


-- 이어붙이기 concat() : 문자열 연결
select concat('하이미디어 IT' , '아카데미') , '하이미디어 IT' || '아카데미' from dual;
select concat(empno, ename) , empno ||'-'|| ename from emp;

-- substr() : 문자열 추출(데이터, 인덱스(1), 카운트)
select substr ('홍길동 만세', 2, 4) from dual; -- 길동 만
select substr ('홍길동 만세', 2) from dual; -- 길동 만세
-- substr 의 경우 자바의 substring 처럼 시작 번째부터 끝번째 +1 이 아니라
-- 시작 번째 부터 글자 수를 나타 냅니다. 위의 예경우 2번 째 글자부터 네글자 표시


--- *** 날짜 처리 관련 함수 ***
-- sysdate : 날짜.
select sysdate from dual ; -- 오늘 날짜와 현재시간
-- insert 명령 그리고 그외에 오늘 날짜가 필요한 곳에 폭 넓게 사용됩니다.
insert into rentlist (rentdate, numseq) values (sysdate, rent_seq.nextVal);

-- months_between() : 개월 수 차 구하기
select floor(months_between('2021-12-31' ,'2024-04-16')) as "개월수" from dual;

-- add_months() : 개월수 더하기
select add_months(sysdate, 20) from dual; -- 2025-12-16 15:4747.0

-- next_day(): 다가올 요일에 해당하는 날짜 - 오늘 날짜 (sysdate)에서 가장 가까운 일요일
select next_day(sysdate, '일요일') from dual;

-- last_day() : 해당 달의 마지막 일수
select last_day(sysdate) from dual;
select last_day('2020-12-15') from dual;


-- select와 from 사이에서 많이 사용되는 함수

-- to_date() : 문자 (String) 으로 변환 Date -> varcht2
select to_char(sysdate, 'yyyy-mm-dd')as "Date -> String" from dual;
-- select와 from 사이에서 많이 사용되는 함수

-- to_date() : 날짜형 (Date)으로 변환 varchar2 -> Date
select to_date('2019/12/31','yyyy/mm/dd') as "String -> date" from dual;
-- insert 명령에서 values()괄호안에 많이 사용되는 함수


-- 숫자 -> 문자 세자리마다 컴마를 넣어서 변환
select to_char(123456789, '999,999,999') from dual; --123,456,789

-- 여섯자리 문자를 숫자로 변환
select to_number('123456') from dual;

-- yyyy -> 년도 표시
select to_char(sysdate, 'yy"년"') from dual; --> 24년
select to_char(sysdate, 'y"년"') from dual; --> 4년

-- month, mon -> 월표시
select to_char(sysdate, 'month') from dual; -->4월
select to_char(sysdate, 'mon') from dual; -->4월
select to_char(sysdate, 'mm') from dual; --> 04
select to_char(sysdate, 'mm"월"') from dual; --> 04월


-- DD 일자를 01~31로 표시
SELECT TO_CHAR(SYSDATE,'DD') FROM DUAL; -->16
-- DDD 일자를 001~365 형태로 표시
SELECT TO_CHAR(SYSDATE,'DDD') FROM DUAL; --> 107
-- DL : 오늘 잘짜를 요일 까지 표시
SELECT TO_CHAR(SYSDATE,'DL') FROM DUAL; --> 2024 4월 16일 금요일


select to_number(to_char(sysdate, 'ddd')) - to_number(to_char(to_date('2024-01-13'), 'ddd')) from dual; --> 04



--round() : 반올림 (음수 : 소수점 이상 자리)
select round(12.3456,3) from dual;
-- 12.3456 : 반올림하려는 대상 숫자 		3 :  반올림하여 표시하고자하는 마지막 자리수







