이름
번호 -> 카카오 인증


이름 NAME
번호 PHONE
주소 ADDRESS
선호하는 자산 종류 MONEY



차트는 트레이딩뷰
뉴스는 네이버뉴스


create table COIN_MEMBER(
NAME varchar(20) PRIMARY KEY,
Email varchar(20) not null,
MONEY varchar(20) check(MONEY in ('부동산','코인','주식')) not null,
id varchar(20) not null,
password varchar(20) not null
);


create table COIN_board(
board_number number PRIMARY KEY,
board_title varchar2(20) not null,
ID varchar2(20) ,
board_date date not null ,
board_count number not null,
board_good number not null,
board_bad number not null,
CONSTRAINT FK_MEMBER FOREIGN KEY (ID) REFERENCES COIN_MEMBER(ID) on delete cascade
);




