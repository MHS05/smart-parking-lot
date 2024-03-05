create database sps;

use sps;

create table admin
(
	ano int not null auto_increment primary key comment '�����ڹ�ȣ',
	id varchar(50) comment '���̵�',
	pw varchar(100) comment '��й�ȣ'
) comment '������';

create table carinfo
(
	cmno int auto_increment primary key comment '����������ȣ',
	carnum varchar(10) default 'N' comment '������ȣ',
	entertime datetime default now() comment '�����ð�',
	exittime datetime comment '�����ð�',
	timecal int comment '���ð�',
	enterpic varchar(100) comment '��������',
	exitpic varchar(100) comment '��������',
	paymethod varchar(10) comment '��������',
	payamount int comment '�����ݾ�',
	payclassifi varchar(10) comment '��������'
) comment '������������';

create table exitpic
(
	cmno int auto_increment primary key comment '����������ȣ',
	carnum varchar(10) default 'N' comment '������ȣ',
	exitpic varchar(100) default 'N' comment '�ӽ���������'
) comment '��������';

create table parkingcardetect
(
	managecctv int auto_increment primary key comment 'cctv������ȣ',
	cctv varchar(100) comment '������cctv',
	totalspace varchar(100) comment '���ڸ���',
	totalcar varchar(100) default 'N' comment '����������'
)comment '��������Ž��';
