--DB 생성
CREATE TABLE member(
cid VARCHAR(32) PRIMARY KEY,
cpassword VARCHAR(32),
cname VARCHAR(32),
cgender VARCHAR(32),
cbirth VARCHAR(32),
cemail VARCHAR(32),
cphone VARCHAR(32),
caddress VARCHAR(32),
cregiday VARCHAR(32)
) DEFAULT CHARSET=utf8;

--product 테이블
CREATE TABLE product (
  pid varchar(32) PRIMARY KEY,
  pname varchar(32) ,
  pdescription varchar(32) ,
  pprice varchar(32) ,
  pfilename varchar(32) ,
)DEFAULT CHARSET=utf8 ;

--member 테이블
CREATE TABLE member (
  cid varchar(32) PRIMARY KEY,
  cpassword varchar(32) ,
  cname varchar(32) ,
  cgender varchar(32) ,
  cbirth varchar(32) ,
  cemail varchar(32) ,
  cphone varchar(32) ,
  caddress varchar(32) ,
  cregiday varchar(32),
) DEFAULT CHARSET=utf8;

--board 테이블
CREATE TABLE board (
  bid int PRIMARY KEY,
  btitle varchar(1024) ,
  bcontent varchar(2048) ,
  bmember varchar(32),
  bdate varchar(32)
) DEFAULT CHARSET=utf8;

--shipping 테이블CREATE TABLE shipping(
cid int PRIMARY KEY,
pname VARCHAR(32),
pprice VARCHAR(32),
ppricetotal VARCHAR(32),
paccount VARCHAR(32),
pstatus VARCHAR(32),
pdate DATE
) DEFAULT CHARSET=utf8;