/*
1. Create a view vw_client_master using Client_no, Name, Address1 and Bal_due
a. Insert at least 3 records to vw_client_master.
b. Update a record to vw_client_master.
c. Delete a record from vw_client_master.
And check that the above operation if the base table is affected or not.*/

create view vw_client_master as select client_no, Name, Address1, Balance_due from client_master;
insert into vw_client_master values ('C007', 'ABHISEK SINGH', 'BALLY', 15000);
insert into vw_client_master values ('C008', 'DIPAK DAS', 'SALTLAKE', 10000);
insert into vw_client_master values ('C009', 'RAMAN GUPTA', 'HOWRAH', 20000);
Update vw_client_master set Balance_due=8000 where client_no = 'C008';
Delete from vw_client_master where client_no = 'C007';
select * from vw_client_master;
select * from client_master;

--
/*
2. Create a view Vw_sales_det using Client_no, Order_no, Order_date, Product_no,
Qty_ordered, and order_status for all order which have already marked as
‘Backorder’ .(Using the tables sales_order, sales_order_details).
a. Insert a record to vw_sales_det.
b. Update the client_no for a particular order_no.
c. Delete a record.
d. Remove the views from database.
*/

create view vw_sales_det as select s1.client_no, s1.order_no, s1.order_date, s2.product_no, s2.qty_ordered, 
s1.order_status from sales_order s1, sales_order_details s2 where s1.order_no=s2.order_no and 
s1.order_status = 'BackOrder'; 
insert into vw_sales_det values ('C007', 'O19251', '12-Jan-91', 'P00091', 100, 'InProcess');
update vw_sales_det set client_no = 'C006' where order_no = 'O19002';
select * from vw_sales_det;
delete from vw_sales_det where client_no= 'C005';
select * from vw_sales_det;
drop view vw_sales_det;