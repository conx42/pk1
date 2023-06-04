create table client_master(
Client_no varchar2(6) primary key check (Client_no like 'C%'),
Name varchar2(30) NOT NULL,
Address1 varchar2(30) ,
Address2 varchar2(30) ,
City varchar2(15) ,
State varchar2(15) ,
Pincode Number(6) ,
Balance_due Number(10,2) 
);
INSERT INTO client_master VALUES('C001','Ivan Bayross','P-76','Worli','Bombay','Maharastra',400054,15000);
INSERT INTO client_master VALUES('C002','Vandana Satiwal','128','Adams Street','Madras','Tamil 
Nadu',780001,0);
INSERT INTO client_master VALUES('C003','Pramada Jaguste','157','Gopalpur','Kolkata','West
Bengal',70058,5000);
INSERT INTO client_master VALUES('C004','Basu Navindgi','A/12','Nariman','Bombay','Maharastra',400056,0);
INSERT INTO client_master VALUES('C005','Ravi Sreedharan','B/34','Rajnagar','Delhi','Delhi',100001,2000);
INSERT INTO client_master VALUES('C006','Rukmini','Q-12','Bandra','Bombay','Maharastra',400050,0);