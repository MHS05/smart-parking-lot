create database test;

use test;

create table admin
(
	ano int not null auto_increment primary key comment '관리자번호',
	id varchar(50) comment '아이디',
	pw varchar(100) comment '비밀번호'
) comment '관리자';

create table carinfo
(
	cmno int auto_increment primary key comment '차량관리번호',
	carnum varchar(10) comment '차량번호',
	entertime datetime default now() comment '입차시간',
	exittime datetime default now() comment '출차시간',
	timecal int comment '계산시간',
	enterpic varchar(100) comment '입차사진',
	exitpic varchar(100) comment '출차사진',
	paymethod varchar(10) comment '결제수단',
	payamount int comment '결제금액',
	payclassifi varchar(10) comment '결제구분'
) comment '차량관리정보';