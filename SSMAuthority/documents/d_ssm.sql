CREATE DATABASE d_ssm DEFAULT charset utf8;

use d_ssm;

CREATE TABLE d_ssm.t_role
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20)
);

CREATE TABLE d_ssm.t_user
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    phone VARCHAR(11),
    password VARCHAR(50)
);
CREATE UNIQUE INDEX t_user_phone_uindex ON d_ssm.t_user (phone);

CREATE TABLE d_ssm.t_user_role
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    role_id INT
);

CREATE TABLE d_ssm.t_module
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30)
);
CREATE UNIQUE INDEX t_module_name_uindex ON d_ssm.t_module (name);

CREATE TABLE d_ssm.t_permission
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    des_zh VARCHAR(30),
    module_id int
);
CREATE UNIQUE INDEX t_permission_name_uindex ON d_ssm.t_permission (name);

CREATE TABLE d_ssm.t_role_permission
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    role_id INT,
    permission_id INT
);
