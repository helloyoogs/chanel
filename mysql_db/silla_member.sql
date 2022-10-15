-- 사용자 테이블 생성
CREATE TABLE ACCOUNT (
    id varchar(100) primary key,
    password varchar(256),
    name varchar(256),
    age VARCHAR(20),
    email varchar(100),
    phone varchar(20),
    address varchar(256),
    role varchar(20)
);