CREATE TABLE TBL_SHOOSE (
  sId varchar(45) NOT NULL PRIMARY KEY,
  sName varchar(45),
  sImg VARCHAR(200),
  sSize INT,
  sPrice INT,
  sStock INT,
  memberId varchar(45),
  FOREIGN KEY (memberId) REFERENCES TBL_MEMBER(memberId)
on update cascade on delete CASCADE
) CHARSET=UTF8MB4;

CREATE TABLE TBL_CART (
  cId int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cQuantity INT,
  cPriceAll INT,
  cPayment varchar(45) DEFAULT '미결제',
  cDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  sId varchar(45),
  memberId varchar(45),
  FOREIGN KEY (memberId) REFERENCES TBL_MEMBER(memberId)
on update cascade on delete CASCADE,
  FOREIGN KEY (sId) REFERENCES TBL_SHOOSE(sId)
on update cascade on delete CASCADE
) CHARSET=UTF8MB4;

call create_sequence('TBL_CART');

update sequences set currval = 0 where name='TBL_CART';

-------------------
create table sequences(
name varchar (32),
currval bigint unsigned
);

--시퀀스 생성시작
DELIMITER $$
CREATE  PROCEDURE create_sequence(IN the_name TEXT)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	delete from sequences where name = the_name;
    insert into sequences values(the_name,0);
END$$


-- currval 함수 생성
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER $$

CREATE FUNCTION currval (the_name varchar(32))
RETURNS bigint unsigned
modifies sql data
deterministic
BEGIN
	declare ret BIGINT unsigned;
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    select ifnull(max(currval),1) into ret from sequences where name = the_name limit 1;
RETURN ret;
END $$


-- nextval 함수 생성
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER $$

CREATE FUNCTION nextval (the_name varchar(32))
RETURNS bigint UNSIGNED
modifies sql DATA
deterministic
BEGIN
	declare ret BIGINT UNSIGNED;
    update sequences set currval = currval+1 where name = the_name;
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    select currval into ret from sequences where name = the_name limit 1;
RETURN ret;
END $$

----
INSERT INTO `hyport1`.`TBL_SHOOSE` (`sId`, `sName`, `sImg`, `sSize`, `sPrice`, `sStock`) VALUES ('sd6220', '테이턴트 카프스킨', '../assets/images/sandle/sandals6.jpg', '220', '1458000', '100');
INSERT INTO `hyport1`.`TBL_SHOOSE` (`sId`, `sName`, `sImg`, `sSize`, `sPrice`, `sStock`) VALUES ('sd6230', '테이턴트 카프스킨', '../assets/images/sandle/sandals6.jpg', '230', '1458000', '100');
INSERT INTO `hyport1`.`TBL_SHOOSE` (`sId`, `sName`, `sImg`, `sSize`, `sPrice`, `sStock`) VALUES ('sd6240', '테이턴트 카프스킨', '../assets/images/sandle/sandals6.jpg', '240', '1458000', '100');
INSERT INTO `hyport1`.`TBL_SHOOSE` (`sId`, `sName`, `sImg`, `sSize`, `sPrice`, `sStock`) VALUES ('sd6250', '테이턴트 카프스킨', '../assets/images/sandle/sandals6.jpg', '250', '1458000', '100');
INSERT INTO `hyport1`.`TBL_SHOOSE` (`sId`, `sName`, `sImg`, `sSize`, `sPrice`, `sStock`) VALUES ('sd6260', '테이턴트 카프스킨', '../assets/images/sandle/sandals6.jpg', '260', '1458000', '100');
INSERT INTO `hyport1`.`TBL_SHOOSE` (`sId`, `sName`, `sImg`, `sSize`, `sPrice`, `sStock`) VALUES ('sd6270', '테이턴트 카프스킨', '../assets/images/sandle/sandals6.jpg', '270', '1458000', '100');
INSERT INTO `hyport1`.`TBL_SHOOSE` (`sId`, `sName`, `sImg`, `sSize`, `sPrice`, `sStock`) VALUES ('sd6280', '테이턴트 카프스킨', '../assets/images/sandle/sandals6.jpg', '280', '1458000', '100');
INSERT INTO `hyport1`.`TBL_SHOOSE` (`sId`, `sName`, `sImg`, `sSize`, `sPrice`, `sStock`) VALUES ('sd6290', '테이턴트 카프스킨', '../assets/images/sandle/sandals6.jpg', '290', '1458000', '100');
