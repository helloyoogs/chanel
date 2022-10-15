CREATE TABLE L_MEMBER (
  mId varchar(45) NOT NULL primary key,
  mPw varchar(45),
  mName varchar(45),
  mAge int,
  mEmail varchar(200),
  mPhone varchar(45),
  mAddress varchar(200)
)CHARSET=UTF8MB4;

create table L_GOODS(
gId varchar(45) NOT NULL primary key, 
gName VARCHAR(200), 
gImg varchar(200), 
gPrice INT, 
gStock INT
)CHARSET=UTF8MB4;

create TABLE L_CART(
cId int auto_increment not null primary key,
cQuantity INT,
cPriceAll int,
cPayment varchar(45) DEFAULT '미결제',
cDate timestamp default NOW(),
mId varchar(45),
gId VARCHAR(45),
FOREIGN KEY (mId) REFERENCES L_MEMBER(mId)
on update cascade on delete CASCADE,
FOREIGN KEY (gId) REFERENCES L_GOODS(gId)
on update cascade on delete CASCADE
)CHARSET=UTF8MB4;

create TABLE L_REVIEW(
rId int auto_increment not null primary key,
rTitle varchar(100),
rContent varchar(200),
rDate timestamp default NOW(),
mId varchar(45),
gId VARCHAR(45),
cId INT,
FOREIGN KEY (mId) REFERENCES L_MEMBER(mId)
on update cascade on delete CASCADE,
FOREIGN KEY (gId) REFERENCES L_GOODS(gId)
on update cascade on delete CASCADE,
FOREIGN KEY (cId) REFERENCES L_CART(cId)
on update cascade on delete CASCADE
)CHARSET=UTF8MB4;

-- alter table L_REVIEW AUTO_INCREMENT = 1; -- auto-increament값 초기화할때 사용


