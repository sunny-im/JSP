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
CREATE TABLE `product` (
  `pid` varchar(32) ,
  `pname` varchar(32) ,
  `pdescription` varchar(32) ,
  `pprice` varchar(32) ,
  `pfilename` varchar(32) ,
  PRIMARY KEY (`pid`)
)DEFAULT CHARSET=utf8 ;

--member 테이블
CREATE TABLE `member` (
  `cid` varchar(32) ,
  `cpassword` varchar(32) ,
  `cname` varchar(32) ,
  `cgender` varchar(32) ,
  `cbirth` varchar(32) ,
  `cemail` varchar(32) ,
  `cphone` varchar(32) ,
  `caddress` varchar(32) ,
  `cregiday` varchar(32),
  PRIMARY KEY (`cid`)
) DEFAULT CHARSET=utf8;