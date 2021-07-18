--创建表空间
CREATE DATABASE IF NOT EXISTS BOOT DEFAULT CHARSET UTF8 COLLATE UTF8_GENERAL_CI;
/**1、用户表*/
DROP TABLE IF EXISTS SYS_USER;
CREATE TABLE SYS_USER (
    SU_ID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    USER_ID VARCHAR(50) UNIQUE COMMENT '用户名',
    USER_NAME VARCHAR(50) COMMENT '用户名称',
    PASS_WORD VARCHAR(50) COMMENT '密码',
    IS_DELETE CHAR (1) COMMENT '是否删除',
    SYS_UPDATE_DATE DATE COMMENT '更新时间',
    SYS_CREATE_DATE DATE COMMENT '创建时间'
) COMMENT = '用户信息表';
/**2、角色表*/
DROP TABLE IF EXISTS SYS_ROLE;
CREATE TABLE SYS_ROLE(
    ROLE_ID   INT PRIMARY KEY AUTO_INCREMENT COMMENT '角色ID',
    ROLE_NAME VARCHAR(50) COMMENT '角色名称',
    DESCRIPTION VARCHAR(50) COMMENT '角色描述',
    SYS_UPDATE_DATE DATE COMMENT '更新时间',
    SYS_CREATE_DATE DATE COMMENT '创建时间'
) COMMENT = '角色表';
CREATE INDEX INDEX_ROLE_NAME ON SYS_ROLE (ROLE_NAME);
/**3、用户角色表*/
DROP TABLE IF EXISTS SYS_USER_ROLE;
CREATE TABLE SYS_USER_ROLE(
    SUR_ID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    USER_ID  VARCHAR(50) COMMENT '用户ID',
    ROLE_ID  INT COMMENT '角色ID',
    SYS_UPDATE_DATE DATE COMMENT '更新时间',
    SYS_CREATE_DATE DATE COMMENT '更新时间'
) COMMENT = '用户角色表';
CREATE INDEX INDEX_USER_ID ON SYS_USER_ROLE (USER_ID);
/**4、菜单表*/
DROP TABLE IF EXISTS SYS_MENU;
CREATE TABLE SYS_MENU(
    MENU_ID   INT PRIMARY KEY AUTO_INCREMENT COMMENT '菜单ID',
    MENU_CODE VARCHAR(200) COMMENT '菜单编码',
    MENU_NAME VARCHAR(200) COMMENT '菜单名称',
    PARENT_ID INT COMMENT '父级菜单ID',
    MENU_ICON VARCHAR(200) COMMENT '菜单图标',
    MENU_URL  VARCHAR(200) COMMENT '菜单路径',
    ORDER_NUM INT COMMENT '菜单序号',
    IS_DELETE CHAR(1) COMMENT '是否删除',
    SYS_UPDATE_DATE DATE COMMENT '更新时间',
    SYS_CREATE_DATE DATE COMMENT '更新时间'
) COMMENT = '菜单表';
CREATE INDEX INDEX_MENU_CODE ON SYS_MENU (MENU_CODE);
/**5、角色菜单表*/
DROP TABLE IF EXISTS SYS_ROLE_MENU;
CREATE TABLE SYS_ROLE_MENU(
    SRM_ID   INT PRIMARY KEY AUTO_INCREMENT COMMENT '菜单ID',
    ROLE_ID   INT COMMENT '菜单名称',
    MENU_ID   INT COMMENT '父级菜单ID',
    SYS_UPDATE_DATE DATE COMMENT '更新时间',
    SYS_CREATE_DATE DATE COMMENT '创建时间'
) COMMENT = '角色菜单表';
CREATE INDEX INDEX_ROLE_ID ON SYS_ROLE_MENU (ROLE_ID);