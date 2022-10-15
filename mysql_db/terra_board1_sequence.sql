create table sequences(
name varchar (32),
currval bigint unsigned
);

--시퀀스 생성시작
DELIMITER $$
CREATE  PROCEDURE create_sequence(IN the_name text)
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
modifies sql data
deterministic
BEGIN
	declare ret BIGINT unsigned;
    update sequences set currval = currval+1 where name = the_name;
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    select currval into ret from sequences where name = the_name limit 1;
RETURN ret;
END $$

--시퀀스테이블에 데이터 추가
call create_sequence('terra_board1');


update sequences set currval = 16 where name='terra_board1';


insert into terra_board1(bId,bName,bTitle,bContent,bHit,bGroup,bStep,bIndent) VALUES
(nextval('terra_board1'),'name','title','content',0,currval('terra_board1'),0,0);









