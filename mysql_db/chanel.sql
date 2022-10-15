CREATE TABLE TBL_MEMBER(
	memberId VARCHAR(45) PRIMARY KEY,
	memberPw VARCHAR(45),
	memberAge int(3),
	memberGender VARCHAR(45),
	memberEmail VARCHAR(45),
	memberZipcode VARCHAR(45),
	memberAddress VARCHAR(45),
	memberAddressDetail VARCHAR(45),
	memberAddressEtc VARCHAR(45)
)CHARSET=UTF8MB4;

INSERT INTO TBL_MEMBER
(MEMBERID, MEMBERPW, MEMBERAGE, MEMBERGENDER, MEMBEREMAIL, MEMBERZIPCODE, MEMBERADDRESS, MEMBERADDRESSDETAIL, MEMBERADDRESSETC)
VALUES('hds1234', '1234', 20, '남자', 'ted@han.com', '12341', '서울시 강남구 역삼동', '100동 100호', '');

SELECT * FROM TBL_MEMBER;



-- Board 생성

CREATE TABLE TBL_BOARD(
	boardNum int(38) AUTO_INCREMENT,
	boardTitle VARCHAR(45),
	boardContent VARCHAR(45),
	boardId VARCHAR(45),
	boardDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	readCount int(38) DEFAULT 0,
	CONSTRAINT PK_BOARD PRIMARY KEY(boardNum),
	CONSTRAINT FK_BOARD_MEMBER FOREIGN KEY(boardId)
	REFERENCES TBL_MEMBER(memberId)
)CHARSET=UTF8MB4;

-- TBL_FILES 테이블 설정

CREATE TABLE TBL_FILES(
	fileName VARCHAR(45) PRIMARY KEY,
	boardNum int(38),
	fileNameOriginal VARCHAR(45),
	CONSTRAINT FK_FILES_BOARD FOREIGN KEY(boardNum)
	REFERENCES TBL_BOARD(boardNum)
)CHARSET=UTF8MB4;

SELECT * FROM TBL_FILES;


-- TBL_REPLY 테이블 설정

CREATE TABLE TBL_REPLY(
	replyNum int(38) AUTO_INCREMENT,
	boardNum int(38),
	memberId VARCHAR(45),
	replyContent VARCHAR(45),
	CONSTRAINT PK_REPLY PRIMARY KEY(replyNum),
	CONSTRAINT FK_REPLY_BOARD FOREIGN KEY(boardNum)
	REFERENCES TBL_BOARD(boardNum) ON DELETE CASCADE
)CHARSET=UTF8MB4;


SELECT * FROM TBL_REPLY;

INSERT INTO TBL_BOARD
SELECT boardNum, boardTitle, boardContent, boardId, NOW(), 0 FROM TBL_BOARD;

SELECT * FROM TBL_BOARD LIMIT 1, 10;

------

ALTER TABLE TBL_REPLY AUTO_INCREMENT=1; 
ALTER TABLE TBL_BOARD AUTO_INCREMENT=1;

-- - foreign key를 무시하고 입력하도록 처리

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO TBL_BOARD
(boardNum, boardTitle, boardContent, boardId)
VALUES(NULL,'테스트1', '테스트내용1', 'hds1');


INSERT INTO TBL_REPLY
(replyNum, boardNum, memberId, replyContent)
VALUES(NULL, 271, 'hds1', '테스트 댓글');

-- 다시 원상 복구

SET FOREIGN_KEY_CHECKS = 1;

-------------
-- insert into mvc_board(bId,bName,bTitle,bContent,bHit,bGroup,bStep,bIndent) VALUES
-- (nextval('mvc_board'),'name','title','content',0,currval('mvc_board'),0,0);


