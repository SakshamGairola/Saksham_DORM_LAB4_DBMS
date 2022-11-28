-- Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select t2.cus_gender as "Gender", count(t2.cus_ID) as "Customer Count "
from(
	select t1.cus_ID, t1.cus_gender
	from(
		select customer.cus_name, customer.cus_gender, orders.* 
		from customer 
		inner join orders 
		on customer.cus_ID = orders.cus_ID 
		where orders.ord_amount >= 3000) as t1
	group by t1.cus_ID) as t2
group by t2.cus_gender;


-- Display all the orders along with product name ordered by a customer having Customer_Id=2
select t1.*, product.pro_name
	from product
    inner join(
		select orders.*, supplier_pricing.pro_ID
        from orders
        inner join supplier_pricing
        on orders.pricing_ID = supplier_pricing.pricing_ID) as t1
	on t1.pro_ID = product.pro_ID
    where t1.cus_ID = 2;

-- Display the Supplier details who can supply more than one product.
select supplier.*
	from supplier
    inner join(
		select supp_ID, count(pro_ID) as "ProductCount"
        from supplier_pricing
        group by supp_ID) as t1
	on supplier.supp_ID = t1.supp_ID
    where t1.ProductCount > 2;

-- Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select category.cat_ID,category.cat_name, min(t3.min_price) as Min_Price
	from category
    inner join(
		select product.cat_ID, product.pro_name, t2.*
        from product
        inner join(
			select pro_ID, min(supp_price) as Min_Price
				from supplier_pricing
                group by pro_ID) as t2
		where t2.pro_ID = product.pro_ID) as t3
	where t3.cat_ID = category.cat_ID
    group by t3.cat_ID;

-- Display the Id and Name of the Product ordered after “2021-10-05”.
select product.pro_ID, product.pro_name
	from product
	inner join(
		select pro_ID
        from supplier_pricing
        inner join(
				select pricing_ID
					from orders
                    where orders.ord_date>'2021-10-05') as t1
		on t1.pricing_ID = supplier_pricing.pricing_ID) as t2
	on t2.pro_ID = product.pro_ID;

-- Display customer name and gender whose names start or end with character 'A'.
select cus_name, cus_gender
	from customer
    where cus_name like 'A%' or cus_name like '%A';

-- Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

DELIMITER &&
create procedure proc()
	begin
		select supplier.supp_ID, supplier.supp_name, t4.rating,
			case
				when rating = 5 then "Excellent Service"
				when rating > 4 then "Good Service"
				when rating > 2 then "Average Service"
				else "Poor Service"
				end as "Type of Service"
			from supplier
			inner join (
				select t3.supp_ID, avg(t3.rat_rtstars) as rating
				from(
					select t2.rat_rtstars, supplier_pricing.supp_ID
					from supplier_pricing
					inner join(
						select t1.rat_rtstars, orders.pricing_ID
							from orders
							inner join(
								select ord_ID, rat_rtstars
								from rating) as t1
							on t1.ord_ID = orders.ord_ID) as t2
					on t2.pricing_ID = supplier_pricing.pricing_ID) as t3
				group by t3.supp_ID) as t4
			on supplier.supp_ID = t4.supp_ID;
	end &&
DELIMITER ;    
call proc();
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
