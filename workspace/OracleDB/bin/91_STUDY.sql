CREATE TABLE musiclist(
	mno NUMBER(5),
	title varchar2(30) not null,
	singer varchar2(30) not null,
	price NUMBER(10) not null,
	grade NUMBER(2) default 2,
	createdate DATE default sysdate,
	constraint mu_pk PRIMARY KEY (mno)
);
SELECT * FROM musiclist;
SELECT * FROM tabs;
SELECT * FROM salelist;
CREATE TABLE salelist(
	sno number(5),
	name varchar(30) not null,
	age number(20) ,
	mno NUMBER(5) not null,
	constraint s_pk primary key (sno),
	constraint fk_1 foreign key (mno) REFERENCES musiclist(mno)
);



CREATE SEQUENCE music_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE sale_seq START WITH 1 INCREMENT BY 1;


INSERT INTO musiclist (mno, title,singer,price,grade) values (music_seq.nextVal, 'namchin' , '릴러말즈', 3000,3);
INSERT INTO musiclist values (music_seq.nextVal, 'wait for me', '창모', 4000, 4, sysdate);
INSERT INTO musiclist values (music_seq.nextVal, 'Loveache', 'JAEHA', 3000, 1, sysdate);
INSERT INTO musiclist values (music_seq.nextVal, 'ALL IN', 'JAEHA', 3300, 2, sysdate);
INSERT INTO musiclist values (music_seq.nextVal, 'Baggy jeans', 'NCT', 5000, 5, sysdate);
INSERT INTO musiclist values (music_seq.nextVal, 'STEAKER', 'NCT', 5000, 5, sysdate);
INSERT INTO musiclist values (music_seq.nextVal, '이쁜여자', '릴러말즈', 4000, 3, sysdate);

ALTER table salelist drop constraint fk_1;
ALTER table salelist add constraint fk_1 FOREIGN KEY (mno) REFERENCES musiclist(mno) ON delete CASCADE;
ALTER TABLE salelist add constraint age check(age between 0 and 100);

INSERT INTO salelist (sno, name,age,mno ) values (sale_seq.nextVal,'차차',30, 1 );

INSERT INTO salelist values (sale_seq.nextVal,'김민주',28, 5 );
INSERT INTO salelist values (sale_seq.nextVal,'최미현',15, 3 );
INSERT INTO salelist values (sale_seq.nextVal,'김태명',85, 6 );
INSERT INTO salelist values (sale_seq.nextVal,'타블로',12, 6 );
INSERT INTO salelist values (sale_seq.nextVal,'제하',18, 2 );

UPDATE salelist set age = '16' where mno = 6;


SELECT a.title as 노래제목, b.name as 구매자, b.age as 나이 ,a.price as 가격 , a.grade as 노래등급, a.createdate as 발행날짜  
from musiclist a, salelist b 
where a.mno = b.mno and a.title like '%for%';

SELECT a.title ||'-'|| a.singer as 노래 ,  b.name as 구매자, b.age as 나이 ,a.price as 가격 
from musiclist a, salelist b 
where a.mno = b.mno;

select sum(price) as "입고가격 총 합계" from musiclist;

select * from musiclist where price >= 5000;

CREATE OR replace view music_sale_list as select 
 a.title ||'-'|| a.singer as 노래 , b.name as 구매자, b.age as 나이 ,a.price as 가격 , a.grade as 노래등급, a.createdate as 발행날짜  
from musiclist a, salelist b 
where a.mno = b.mno;



select * from music_sale_list;

drop table salelist purge;
drop table musiclist purge;