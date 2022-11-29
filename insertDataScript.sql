-- Insert data Script

-- inserting in supplier Table
insert into supplier (supp_ID, supp_name, supp_city, supp_phone)
	values
        (1,"Rajesh Retails","Delhi",'1234567890'),
        (2,"Appario Ltd.","Mumbai",'2589631470'),
        (3,"Knome products","Banglore",'9785462315'),
        (4,"Bansal Retails","Kochi",'8975463285'),
        (5,"Mittal Ltd.","Lucknow",'7898456532');

-- inserting in customer Table
insert into customer (cus_ID, cus_name, cus_phone, cus_city, cus_gender)
	values
        (1,"AAKASH",'9999999999',"DELHI",'M'),
        (2,"AMAN",'9785463215',"NOIDA",'M'),
        (3,"NEHA",'9999999999',"MUMBAI",'F'),
        (4,"MEGHA",'9994562399',"KOLKATA",'F'),
        (5,"PULKIT",'7895999999',"LUCKNOW",'M');

-- inserting in category Table
insert into category (cat_ID, cat_name)
	values
        (1,"BOOKS"),
        (2,"GAMES"),
        (3,"GROCERIES"),
        (4,"ELECTRONICS"),
        (5,"CLOTHES");


-- inserting in product Table
insert into product (pro_ID, pro_name, pro_desc, cat_ID)
	values
        (1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2),
        (2,"TSHIRT","SIZE-L with Black, Blue and White variations",5),
        (3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4),
        (4,"OATS","Highly Nutritious from Nestle",3),
        (5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1),
        (6,"MILK","1L Toned MIlk",3),
        (7,"Boat EarPhones","1.5Meter long Dolby Atmos",4),
        (8,"Jeans","Stretchable Denim Jeans with various sizes and color",5),
        (9,"Project IGI","compatible with windows 7 and above",2),
        (10,"Hoodie","Black GUCCI for 13 yrs and above",5),
        (11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1),
        (12,"Train Your Brain","By Shireen Stephen",1);

-- inserting in supplier_pricing Table
insert into supplier_pricing (pricing_ID, pro_ID, supp_ID, supp_price)
	values
        (1,1,2,1500),
        (2,3,5,30000),
        (3,5,1,3000),
        (4,2,3,2500),
        (5,4,1,1000),
        (6,12,2,780),
        (7,12,4,789),
        (8,3,1,31000),
        (9,1,5,1450),
        (10,4,2,999),
        (11,7,3,549),
        (12,7,4,529),
        (13,6,2,105),
        (14,6,1,99),
        (15,2,5,2999),
        (16,5,2,2999);

-- inserting in orders Table
insert into orders (ord_ID, ord_amount, ord_date, cus_ID, pricing_ID)
	values
        (101,1500,"2021-10-06",2,1),
        (102,1000,"2021-10-12",3,5),
        (103,30000,"2021-09-16",5,2),
        (104,1500,"2021-10-05",1,1),
        (105,3000,"2021-08-16",4,3),
        (106,1450,"2021-08-18",1,9),
        (107,789,"2021-09-01",3,7),
        (108,780,"2021-09-07",5,6),
        (109,3000,"2021-09-10",5,3),
        (110,2500,"2021-09-10",2,4),
        (111,1000,"2021-09-15",4,5),
        (112,789,"2021-09-16",4,7),
        (113,31000,"2021-09-16",1,8),
        (114,1000,"2021-09-16",3,5),
        (115,3000,"2021-09-16",5,3),
        (116,99,"2021-09-17",2,14);

--  inserting in rating Table
insert into rating (rat_ID, ord_ID, rat_rtstars)
	values
        (1,101,4),
        (2,102,3),
        (3,103,1),
        (4,104,2),
        (5,105,4),
        (6,106,3),
        (7,107,4),
        (8,108,4),
        (9,109,3),
        (10,110,5),
        (11,111,3),
        (12,112,4),
        (13,113,2),
        (14,114,1),
        (15,115,1),
        (16,116,0);