SELECT * FROM �˺ű�

insert into �˺ű� values('88888888','���֮��','���֮��','123456789012345678','1234','localhost','8888','�Ƽ�����δ��....','1.png',22,'��','����')

create table �˺ű�
(
	QQ���� varchar(10) primary key,
	�ǳ� varchar(20),
	��ʵ���� varchar(20),
	���֤���� varchar(18),
	���� varchar(20),
	IP��ַ varchar(20),
	ͨ�Ŷ˿� int check(ͨ�Ŷ˿�>1000 and ͨ�Ŷ˿�<65535),
	����ǩ�� varchar(200),
	ͷ�� varchar(20),
	���� int check (����>0 and ����<120),
	�Ա� varchar(20) check (�Ա� in('��','Ů')),
	״̬ varchar(4)
)
create table ���ѱ�
(
	ID int identity(1,1) primary key,
	���˺��� varchar(10) references  �˺ű�(QQ����),
	���Ѻ��� varchar(10) references  �˺ű�(QQ����),
	����ID  varchar(10),
	������ int default 1
)
create table ��Ϣ��
(
	ID int identity(1,1) primary key,
	���ͺ��� varchar(10) references  �˺ű�(QQ����),
	���պ��� varchar(10) references  �˺ű�(QQ����),
	����ID  varchar(10)
)
