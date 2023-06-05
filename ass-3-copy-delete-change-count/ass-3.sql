-- 1. Count the total number of orders.
select count(*) from sales_order;

-- 2. Calculate the average price of all the products.
select avg(sell_price) from product_master;
select avg(cost_price) from product_master;

-- 3. Count the number of products having price greater than or equal to 1500.
select count(*) from product_master where (cost_price>1500);

-- 4. Determine the maximum and minimum product prices. Rename the output as max_price and min_price respectively.
select min(cost_price) MIN_PRICE,max(cost_price) MAX_PRICE from product_master;

-- 5. Change the City of the Client_no ‘C005’ to ‘Madras’.
update client_master set city='MADRAS' where client_no='C005';

-- 6. Change the Bal_due of Client_no ‘C005’ to Rs.3000/-.
update client_master set balance_due='3000' where client_no='C005';

-- 7. Delete from client_master where the column state holds the value ‘Tamilnadu’.
delete from client_master where state='Tamil Nadu';

-- 8. Add a column called ‘Telephone’ of data type ‘number’ and size 10 in the table client_master.
Alter table client_master add(Telephone number(10));

-- 9. Change the size of data type Pin_code to 10 in the table client_master.
Alter table client_master modify(pincode number(10));

-- 10. Drop the column Address2 from the table client_master.
Alter table client_master drop(address2);

-- 11. Create another table client_master_duplicate with the same structure of client_master( without copying the data of the table client_master).
create table client_master_duplicate as select * from client_master where 1=2;

-- 12. Insert the data into client_master_duplicate table from client_master table.
insert into client_master_duplicate select * from client_master;

-- 13. Rename the table client_master_duplicate to c_master.
rename client_master_duplicate to c_master;

-- 14. Destroy the table c_master with its data.
drop table c_master;
