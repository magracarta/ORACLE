CREATE TABLE `scott`.`member` (
  `userid` VARCHAR(30) NOT NULL,
  `pwd` VARCHAR(30) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `phone` VARCHAR(30) NULL,
  `email` VARCHAR(30) NULL,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- userid , pwd, name , phone, email

insert into scott.member (userid, pwd, name, phone, email) 
values ('id1','q1w2e3','김민주','010-2236-0381','rmfoal1996@naver.com');

insert into scott.member (userid, pwd, name, phone, email) 
values ('id2','1234','홍길동','010-1234-4567','id2@naver.com');

insert into scott.member (userid, pwd, name, phone, email) 
values ('id3','134679','지창욱','010-3214-9874','id3@naver.com');

insert into scott.member (userid, pwd, name, phone, email) 
values ('id4','789456','허삼','010-4567-1234','id4@naver.com');



CREATE TABLE `scott`.`board` (
  `boardnum` INT NOT NULL AUTO_INCREMENT,
  `writer` VARCHAR(30) NULL,
  `subject` VARCHAR(100) NOT NULL,
  `content` VARCHAR(1000) NOT NULL,
  `writedate` DATETIME NULL DEFAULT now(),
  `readcount` INT NULL DEFAULT 0,
  PRIMARY KEY (`boardnum`),
  INDEX `bfk1_idx` (`writer` ASC) VISIBLE,
  CONSTRAINT `bfk1`
    FOREIGN KEY (`writer`)
    REFERENCES `scott`.`member` (`userid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- boardnum , writer , subject , content , writedate , readcount
insert into scott.board ( writer, subject, content ,writedate, readcount) 
values ('id1','헌법개정안','헌법개정안은 국회가 의결한 후' ,str_to_date('2020-03-05', '%Y-%m-%d'),20);
insert into scott.board ( writer, subject, content ,writedate, readcount) 
values ('id3','시바견 인기','너무나도 귀여운 시바견 꼭 키우세용!' ,str_to_date('2022-05-15', '%Y-%m-%d'),1000);
insert into scott.board ( writer, subject, content ,writedate, readcount) 
values ('id4','포메라니안 짱짱맨!','포메는 너무 귀여운것 같습니다!!!' ,str_to_date('2024-01-31', '%Y-%m-%d'),250);
insert into scott.board ( writer, subject, content ) 
values ('id4','포메 사료','포메 사료좀 추천해주세요! 제곡내' );
insert into scott.board ( writer, subject, content ) 
values ('id2','불금의 공부!','불금인데도 공부하는 사람이 있다!?' );


select * from scott.member;
select * from scott.board;


-- boardDetail board
--b num (boardnum) ,a name, a  email , b writer , b subject , b content , b writedate , b readcount


CREATE OR REPLACE VIEW boardDetail AS
SELECT b.boardnum as num ,a.name , a.email , b.writer , b.subject , b.content , date_format(b.writedate , '%Y-%m-%d') as writedate ,b.readcount
FROM member a, board b
WHERE a.userid = b.writer;

select * from boardDetail;

