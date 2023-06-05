-- 1. Find the names of all clients having ‘a’ as the second letter in their names.
select name from client_master where name like '_a%' ;

-- 2. Find out the clients who do not stay in a city whose first letter is ‘B’.
select name from client_master where city not like 'B%' ;

-- 3. List the names and city of all clients who have exactly 12 characters in length and starts with ‘I’.
select name, city from client_master where length(name)=12 and name like 'I%' ;

-- 4. Find the list of all clients who stay in ‘Bombay’ or ‘Delhi’.
select name from client_master where city='Bombay' or city='Delhi' ;

-- 5. Print the list of all clients whose bal_due is greater than value 10,000.
select name from client_master where balance_due>10000;

-- 6. Print the information from sales_order table for orders places in the month of January.
select * from sales_order where to_char (order_date,'Mon')='Jan' ;

-- 7. Display the order information for client_no ‘C001’ and ‘C002’.
select * from sales_order where client_no in ('C001', 'C002');

-- 8. Find products whose selling price greater than 2000 and less than 5000.
select * from product_master where Sell_price>2000 and sell_price<5000;

-- 9. Find products whose selling price is more than 1500.Calculate a new selling price as original selling price*1.15. Rename the new column in the above query is New_price.
select Sell_price, Sell_price*1.15 New_Price from product_master;

-- 10. List the names, city and state of clients who are not in the state of ‘Maharastra’.
select name, city, state from Client_master where State!='Maharashtra' ;

-- 11. Display the month(in alphabets) and date when the order must be delivered.
select to_char(delivery_date, 'Month-dd') from Sales_order;

-- 12. Display the Order_date in the format ‘DD-Month-YY’ e.g 12-February-13.
select to_char(order_date, 'DD-Month-YY') O_date from Sales_order;

-- 13. Find the date, 15 days after today’s date.
select sysdate+15 New_date from dual;
