SELECT * FROM 账号表

insert into 账号表 values('88888888','软件之家','软件之家','123456789012345678','1234','localhost','8888','科技创造未来....','1.png',22,'男','离线')

create table 账号表
(
	QQ号码 varchar(10) primary key,
	昵称 varchar(20),
	真实姓名 varchar(20),
	身份证号码 varchar(18),
	密码 varchar(20),
	IP地址 varchar(20),
	通信端口 int check(通信端口>1000 and 通信端口<65535),
	个性签名 varchar(200),
	头像 varchar(20),
	年龄 int check (年龄>0 and 年龄<120),
	性别 varchar(20) check (性别 in('男','女')),
	状态 varchar(4)
)
create table 朋友表
(
	ID int identity(1,1) primary key,
	本人号码 varchar(10) references  账号表(QQ号码),
	朋友号码 varchar(10) references  账号表(QQ号码),
	分组ID  varchar(10),
	黑名单 int default 1
)
create table 消息表
(
	ID int identity(1,1) primary key,
	发送号码 varchar(10) references  账号表(QQ号码),
	接收号码 varchar(10) references  账号表(QQ号码),
	分组ID  varchar(10)
)
