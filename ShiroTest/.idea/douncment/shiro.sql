create database shiro DEFAULT CHARSET utf8;

use shiro;

CREATE TABLE users(
  id INT PRIMARY KEY auto_increment,
  username VARCHAR(100),
  password VARCHAR(100),
  password_salt VARCHAR(100)
);

CREATE TABLE user_roles(
  id INT PRIMARY KEY auto_increment,
  username VARCHAR(100),
  role_name VARCHAR(100)
);

CREATE TABLE roles_permissions(
  id INT PRIMARY KEY auto_increment,
  role_name VARCHAR(100),
  permission VARCHAR(200)
);

create table t_user(
  id int primary key AUTO_INCREMENT,
  name varchar(100),
  password varchar(100),
  gender tinyint
);

create table t_role(
  id int PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  des VARCHAR(100)
);

create table t_user_role(
  id int PRIMARY KEY AUTO_INCREMENT,
  user_id int,
  role_id int
);

create table t_module(
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100)
);

create table t_permission(
  id int PRIMARY KEY AUTO_INCREMENT,
  permission VARCHAR(200),
  des_zh VARCHAR(100),
  module_id int
);

create TABLE t_role_permission(
  id int PRIMARY KEY AUTO_INCREMENT,
  role_id int,
  permission_id int,
  set_time datetime
);