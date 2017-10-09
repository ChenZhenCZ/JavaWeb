CREATE DATABASE ssm DEFAULT charset utf8;

use ssm;

create table t_uers(
  phone VARCHAR(11),
  password VARCHAR(50)
) ENGINE = InnoDB DEFAULT charset utf8;

create table t_amdin(
  phone VARCHAR(11),
  password VARCHAR(50)
) ENGINE = InnoDB DEFAULT charset utf8;

create table t_user(
  id int primary key auto_increment,
  name varchar(20),
  password varchar(50)
) ENGINE = InnoDB DEFAULT charset utf8;

create table t_product(
  id int primary key auto_increment,
  title varchar(50),
  price decimal
) ENGINE = InnoDB DEFAULT charset utf8;

create table t_order(
 id int primary key auto_increment,
 user_id int,
 order_time datetime
) ENGINE = InnoDB DEFAULT charset utf8;

create table t_order_item(
  id int primary key auto_increment,
  order_id int,
  product_id int,
  quantity int,
  unit_price decimal,
  total_cost decimal
) ENGINE = InnoDB DEFAULT charset utf8;
/* 玩家表*/
create table w_user(
  id int primary key auto_increment,
  ing_id int ,
  name VARCHAR(11),
  password VARCHAR(50),
  hone int
) ENGINE = InnoDB DEFAULT charset utf8;

/*?
  英雄表
 */
create table w_ing(
  id int primary key auto_increment,
  ingname VARCHAR (20)
) ENGINE = InnoDB DEFAULT charset utf8;
/*
  道具表
 */

create table w_dao(
  id int primary key auto_increment,
  title VARCHAR (20),
  pric  decimal
) ENGINE = InnoDB DEFAULT charset utf8;

/*
  交易表
 */
create table w_jiao(
  id int primary key auto_increment,
  u_id int,
  d_id  int,
  jiao_time datetime
) ENGINE = InnoDB DEFAULT charset utf8;
