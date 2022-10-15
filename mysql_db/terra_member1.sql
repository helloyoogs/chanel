CREATE TABLE member1 (
   id varchar(45) NOT NULL PRIMARY KEY,
   pw varchar(45),
   name varchar(40),
   phone varchar(45),
   email varchar(45),
   address varchar(45)
 )CHARSET=UTF8MB4;
 
 CREATE TABLE terra_board1 (
   bId int NOT NULL PRIMARY KEY,
   bName varchar(45) DEFAULT NULL,
   bTitle varchar(100) DEFAULT NULL,
   bContent varchar(300) DEFAULT NULL,
   bDate timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   bHit int DEFAULT '0',
   bGroup int DEFAULT NULL,
   bStep int DEFAULT NULL,
   bIndent int DEFAULT NULL
 ) CHARSET=UTF8MB4;
