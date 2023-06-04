Create table sales_order(
Order_No varchar2(6) PRIMARY key,
check(Order_No like 'O%'),
Order_date Date,
Client_No varchar2(6) REFERENCES client_master(Client_No),
Salesman_No varchar2(6) REFERENCES salesman_master(Salesman_No),
Delivery_type Char(1) DEFAULT 'F' check(Delivery_type in ('P','F')),
Bill_y_n char(1),
Delivery_date date ,
Order_status varchar2(10),
constraint ck_order_status check(Order_status in ('InProcess','Fullfilled','BackOrder','Cancelled')),
constraint ck_delivery_date check (Delivery_date >= Order_date)
);
insert into sales_order VALUES ('O19001','12-Jan-96','C001','S001','F','N','20-Jan-96','InProcess');
insert into sales_order VALUES ('O19002','25-Jan-96','C002','S002','P','N','27-Jan-96','BackOrder');
insert into sales_order VALUES ('O46865','18-Feb-96','C003','S003','F','Y','20-Feb-96','Fullfilled');
insert into sales_order VALUES ('O19003','03-Apr-96','C001','S001','F','Y','07-Apr-96','Fullfilled');
insert into sales_order VALUES ('O46866','20-May-96','C004','S002','P','N','22-May-96','Cancelled');
insert into sales_order VALUES ('O19008','24-May-96','C005','S004','F','N','26-May-96','InProcess');