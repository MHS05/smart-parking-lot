create database test;

use test;

create table admin
(
	ano int not null auto_increment primary key comment '�����ڹ�ȣ',
	id varchar(50) comment '���̵�',
	pw varchar(100) comment '��й�ȣ'
) comment '������';

create table carinfo
(
	cmno int auto_increment primary key comment '����������ȣ',
	carnum varchar(10) comment '������ȣ',
	entertime datetime default now() comment '�����ð�',
	exittime datetime default now() comment '�����ð�',
	timecal int comment '���ð�',
	enterpic varchar(100) comment '��������',
	exitpic varchar(100) comment '��������',
	paymethod varchar(10) comment '��������',
	payamount int comment '�����ݾ�',
	payclassifi varchar(10) comment '��������'
) comment '������������';