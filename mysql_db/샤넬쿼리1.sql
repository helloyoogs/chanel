-- TBL_MEMBER 테이블 설정

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
	boardNum int(38),
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
	replyNum int(38),
	boardNum int(38),
	memberId VARCHAR(45),
	replyContent VARCHAR(45),
	CONSTRAINT PK_REPLY PRIMARY KEY(replyNum),
	CONSTRAINT FK_REPLY_BOARD FOREIGN KEY(boardNum)
	REFERENCES TBL_BOARD(boardNum) ON DELETE CASCADE
)CHARSET=UTF8MB4;




SELECT * FROM TBL_REPLY;



-- currval 함수 생성
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER $$
CREATE FUNCTION chanel_currval(the_name VARCHAR(45))
RETURNS bigint unsigned
modifies sql DATA
DETERMINISTIC
BEGIN
	declare ret BIGINT unsigned;
    select ifnull(max(currval),1) into ret from sequences where name = the_name limit 1;
RETURN ret;
END $$

DELIMITER $$
CREATE FUNCTION chanel_nextval(the_name VARCHAR(45))
RETURNS bigint UNSIGNED
modifies sql DATA
DETERMINISTIC
BEGIN
	declare ret BIGINT UNSIGNED;
    update sequences set currval = currvalcreate_sequence+1 where name = the_name;
    select currval into ret from sequences where name = the_name limit 1;
RETURN ret;
END $$
