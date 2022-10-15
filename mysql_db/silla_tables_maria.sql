CREATE TABLE member (
  id varchar(45) NOT NULL primary key,
  pw varchar(45),
  name varchar(45),
  age varchar(45),
  email varchar(200),
phone varchar(45),
  address varchar(200)
)CHARSET=UTF8MB4;

create table room(
room_no int not null primary key, 
type varchar(40), 
base_price int, 
add_price INT, 
base_person int, 
max_person int,
imgLink varchar(40)
)CHARSET=UTF8MB4;

create table reservation(
rsv_idx int auto_increment not null primary key, 
id varchar(45), 
room_no int, 
person varchar(5),review
date_in DATE, 
date_out DATE, 
cash int, 
payment varchar(12) DEFAULT '미결제', 
FOREIGN KEY (id) REFERENCES member(id)
on update cascade on delete cascade, 
FOREIGN KEY (room_no) REFERENCES room(room_no)
on update cascade on delete cascade)CHARSET=UTF8MB4;


create table review(
review_no int auto_increment not null primary key, 
review_title varchar(100),
review_content varchar(200),
type varchar(45),
room_rating varchar(45),
id VARCHAR(45),
date_in DATE,
review_date timestamp default NOW(),
FOREIGN KEY (id) REFERENCES member(id)
on update cascade on delete CASCADE
)CHARSET=UTF8MB4;

alter table review auto_increment = 1; -- auto-increament값 초기화할때 사용

insert into room values(201, 'Member Exclusive', 102600, 10000, 2, 5, '../resources/images/room-201.jpg');
insert into room values(202, 'Rewards Urban Island', 104500, 20000, 2, 6, '../resources/images/room-202.jpg');
insert into room values(203, 'Rewards Morning Delights', 106400, 30000, 3, 7, '../resources/images/room-203.jpg');
insert into room values(204, 'Rewards Suite', 106400, 30000, 3, 7, '../resources/images/room-204.jpg');
insert into room values(205, 'Rewards In Room Delights', 106400, 30000, 3, 7, '../resources/images/room-205.jpg');

