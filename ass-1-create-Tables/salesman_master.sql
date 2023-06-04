CREATE table salesman_master(
Salesman_No varchar2(6) PRIMARY key ,
CHECK(Salesman_No like 'S%'),
Salesman_name varchar2(30) not null,
Address1 varchar2(30) not null,
Address2 varchar2(30),
City varchar2(20),
Pincode NUMBER(8),
State VARCHAR2(20),
Sal_amt number(8,2) not null check(Sal_amt > 0)
);
insert into salesman_master values ('S001','Kiran','A/14','Worli','Bombay',400002,'Maharastra',3000);
insert into salesman_master values ('S002','Manish','65','Nariman','Bombay',400001,'Maharastra',3000);
insert into salesman_master values ('S003','Ravi','P-7','Bandra','Bombay',400032,'Maharastra',3000);
insert into salesman_master values ('S004','Asish','A/5','Juhu','Bombay',400044,'Maharastra',3000);
