drop database if exists test;
create database test;
use test;
create table t1(c int);
insert into t1 (c) values (1);
check table t1;
drop table t1;
drop database test;