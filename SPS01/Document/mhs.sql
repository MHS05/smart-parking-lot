create database mhs;

use mhs;

drop table reply;
drop table community;
drop table user;
drop table category;
drop table similarity;
drop table semotion;
drop table newskeyword;
drop table clickad;
drop table news;
drop table ad;

create table user
(
	uno int not null auto_increment primary key comment 'ȸ����ȣ',
	id varchar(50) comment '���̵�',
	pw varchar(100) comment '��й�ȣ',
	name varchar(50) comment '�̸�',
	nickname varchar(50) comment '�г���',
	gender varchar(2) comment '����',
	birth varchar(6) comment '�������',
	email varchar(50) comment '�̸���',
	con varchar(10) comment 'ü��',
	joindate datetime default now() comment '��������',
	isretire varchar(2) default 'N' comment 'Ż�𿩺�',
	cocount int comment '�ۼ��ۼ�',
	recount int comment '�ۼ���ۼ�'
) comment '����';

create table category
(
	pno int auto_increment primary key comment '��ǰ��ȣ',
	ptype varchar(10) comment '��ǰ����',
	pname varchar(50) comment '��ǰ��',
	pfimage varchar(100) comment '��ǰ�̹���_��',
	ppimage varchar(100) comment '��ǰ�̹���_����',
	age varchar(10) comment '����',
	pgender varchar(5) comment '����',
	pcon varchar(10) comment 'ü��',
	link varchar(100) comment '��ũ',
	tag_age varchar(10) comment '�±�_����',
	tag_pgender varchar(10) comment '�±�_����',
	tag_pcon varchar(20) comment '�±�_ü��',
	month_start varchar(10) comment '��_����',
	month_end varchar(10) comment '��_��',
	info text comment '�⺻������ȿ��',
	takeinfo text comment '��������'
) comment 'ī�װ�';


create table community
(
	no int auto_increment primary key comment '�Խù���ȣ',
	uno int comment 'ȸ����ȣ',
	id varchar(50) comment '���̵�',
	title varchar(200) comment '����',
	type varchar(2) comment '����',
	note text comment '����',
	phyname varchar(100) comment '÷������_������',
	fname varchar(100) comment '÷������_����',
	wdate datetime default now() comment '�ۼ���',
	hit int default 0 comment '��ȸ��',
	image varchar(100) comment '�̹���_��',
	phyimage varchar(100) comment '�̹���_����',
	name varchar(100) comment 'ȸ���̸�',
	nickname varchar(100) comment 'ȸ���г���',
	recount int comment '��۰���'
	foreign key(uno) references user(uno)
) comment '�Խ���';

create table reply
(
	rno int auto_increment primary key comment '��۹�ȣ',
	no int comment '�Խù���ȣ',
	uno int comment 'ȸ����ȣ',
	id varchar(50) comment 'ȸ�����̵�',
	rnote text comment '��۳���',
	rdate datetime default now() comment '�ۼ���',
	name varchar(50) comment '�̸�',
	nickname varchar(50) comment '�г���',
	title varchar(200) comment '������',
	foreign key(no) references community(no),
	foreign key(uno) references user(uno)
) comment '���';

create table ad
(
	adno int auto_increment primary key comment '�����ȣ',
	id varchar(50) comment '�ۼ���',
	adname varchar(50) comment '��ǰ�̸�',
	adkey varchar(100) comment '����Ű����_����Ʈ',
	image varchar(100) comment '�̹���_��',
	phyimage varchar(100) comment '�̹���_����'
) comment '����';

create table news
(
	nno int auto_increment primary key comment '������ȣ',
	adno varchar(100) default 'N' comment '�����ȣ',
	id varchar(50) comment '�ۼ���',
	category varchar(2) comment 'ī�װ�',
	title varchar(200) comment '����',
	note text comment '����',
	wdate datetime default now() comment '�ۼ���',
	image varchar(100) comment '�̹���_��',
	phyimage varchar(100) comment '�̹���_����',
	emotion varchar(5) default 'N' comment '�����',
	score varchar(10) default 'N' comment '������ۼ�Ʈ'
) comment '�ǰ��ҽ�';

create table newskeyword
(
	nkeyno int auto_increment primary key comment '����Ű���������ȣ',
	nno int comment '������ȣ',
	nkey varchar(50) comment '����Ű����',
	nkeynum int comment 'Ű����󵵼�',
	foreign key(nno) references news(nno)
) comment '����Ű����';

create table semotion
(
	senno int auto_increment primary key comment '���庰������ȣ',
	nno int comment '������ȣ',
	sentance varchar(200) comment '����',
	emotion varchar(10) comment '���������',
	score varchar(10) comment '���������',
	foreign key(nno) references news(nno)
) comment '���庰���������';

create table similarity
(
	sno int auto_increment primary key comment '���絵������ȣ',
	adno int comment '�����ȣ',
	nno int comment '������ȣ',
	nkeylist varchar(100) comment '����Ű����_����Ʈ',
	adkey varchar(100) comment '����Ű����_����Ʈ',
	similary varchar(10) comment '���絵',
	foreign key(adno) references ad(adno),
	foreign key(nno) references news(nno)
) comment '���絵';

create table clickad
(
	clickadno int auto_increment primary key comment '��������������ȣ',
	adno int comment '�����ȣ',
	nno int comment '������ȣ',
	cdate datetime default now() comment '������',
	foreign key(adno) references ad(adno),
	foreign key(nno) references news(nno)
) comment '�����������';