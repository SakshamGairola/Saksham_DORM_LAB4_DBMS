-- Create Tables Script

-- create database
create database if not exists ecommerce;

-- selecting database
use ecommerce;

show tables;
-- creating tables

-- supplier Table
create table if not exists supplier (
	supp_ID int,
    supp_name varchar(50) not null,
    supp_city varchar(50) not null,
    supp_phone varchar(50) not null,
    primary key(supp_ID));
    
--  customer Table
create table if not exists customer(
	cus_ID int,
    cus_name varchar(20) not null,
    cus_phone varchar(10) not null,
    cus_city varchar(30) not null,
    cus_gender char,
    primary key(cus_ID));
    
-- category Table
create table if not exists category (
	cat_ID int,
	cat_name varchar(20) not null,
    primary key(cat_ID));

-- product Table
create table if not exists product (
	pro_ID int,
    pro_name varchar(20) not null default "Dummy",
    pro_desc varchar(60),
    cat_ID int,
    primary key(pro_ID),
    foreign key (cat_ID) references category(cat_ID));

-- supplier_pricing Table
create table if not exists supplier_pricing (
	pricing_ID int,
    pro_ID int,
    supp_ID int,
    supp_price int default 0,
    primary key(pricing_ID),
    foreign key(supp_ID) references supplier(supp_ID),
    foreign key(pro_ID) references product(pro_ID));
 
-- orders Table
create table if not exists orders (
	ord_ID int,
    ord_amount int not null,
    ord_date date not null,
    cus_ID int,
    pricing_ID int,
    primary key(ord_ID),
    foreign key(cus_ID) references customer(cus_ID),
    foreign key(pricing_ID) references supplier_pricing(pricing_ID));

--  rating Table
create table if not exists rating (
	rat_ID int,
	ord_ID int,
	rat_rtstars int not null,
	primary key(rat_ID),
    foreign key (ord_id) references orders(ord_ID));
-- drop database ecommerce;