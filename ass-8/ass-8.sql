1. a) Create a table whose structure will be as follows:
		Table Name: Prime_Entry
________________________________________
| Column Name | Data Type | Attributes |
----------------------------------------
|	Num_id 	  |	Number(3) |	Primary Key|
----------------------------------------
|	Prime_num |	Number(3) |	Not Null   |
----------------------------------------
set serveroutput on;
create table prime_entry(
	num_id number(3) primary key, 
	prime_num number(3) not null
);

create sequence seq
start with 1
increment by 1
/

/*
b) Write a PL/SQL block of code that will take a number from user and test
whether the numberis prime or not. If the number is prime, then enter into above
table by generating NUMID automatically.*/
-----------------------------------------------
set serveroutput on;

declare
	num number;
	j number;
	n number;
	i number;
	flag number;
	g number;
begin
	num:=&n;
	n:=TRUNC(num/2);
	for i in 2..n
	loop
		if(mod(num,i)=0)then
			flag:=1;
			exit;
		else
			flag:=0;
		end if;
	end loop;
	dbms_output.put_line('---------------------');
	if(flag=1)then
		dbms_output.put_line(num||' is not prime');
	else
		select seq.nextval into g from dual;
		insert into prime_entry values(g,num);
	end if;
end;
/
---------------
/*
c) Now add a checking for same prime number entry. It will show - ‘Number
already exists in database’ for same prime number entry. Write a function to test
whether given number exist or not.*/
--------------------
set serveroutput on;

create or replace function prime_test(id number) return number 
is
num number(20);
begin 
	select num_id into num from prime_entry where prime_num=id;
	return 1;
	exception
		when no_data_found then 
		return 0;


end;
/

declare
	num number;
	j number;
	i number;
	n number;
	flag number;
	x number;
begin
	num:=&n;
	n:=TRUNC(num/2);
	for i in 2..n
	loop
		if(mod(num,i)=0)then
			flag:=1;
			exit;
		else
			flag:=0;
		end if;
	end loop;
	dbms_output.put_line('---------------------');
	if(flag=1)then
		dbms_output.put_line(num||' is not prime');
	else
		x:=prime_test(num);
		if(x=0)then
			insert into prime_entry values(seq.nextval, num);
		else 
			dbms_output.put_line('Already exists in the table. ');
		end if;
	end if;
end;
/
----------------------------------------------------
2. Create the following table:
Table Name: Acc_details

|Column_Name | Data type | Size | Attributes |
|  Acc_no    | Varchar2  |  8   | Primary Key|
|  Name      | Varchar2  |  20  |  Not Null  |
|  Address   | Varchar2  |  20  |  Not Null  |
|  DOB       |  Date     |      |  Not Null  |
|  Sex 		 |  Char     |   1  | Not Null, Values|
|			 |           |      |	(’M’, ‘F’)	  |
|Contact_no  | Number    |10    | Not Null		|
|Last_trans_date| Date| 		|	Not Null	|
|Total_amt 	 |Number     |12,4  |Not Null		|
|Acc_status	 | Char 	 |1     | Not Null, Values|
|			 |			 |		|	(’A’, ‘I’) 	  |
---------------------------------------------------

create table Acc_details(
	Acc_No varchar2(8) primary key,
	Name varchar2(20) not null,
	Address varchar2(50) not null,
	DOB date not null,
	sex char(1) check (sex in ('M', 'F')),
	contact_no number(10) not null,
	last_trans_date date not null,
	Total_cost number(14,2) not null,
	Acc_status char(1) not null check(Acc_status in ('A', 'I'))
);



-----------------------------------------
Table Name: Transactions_Acc
--------------------------------------------------
Column_Name Data type Size Attributes
Transaction_id Number 8 Primary Key
Acc_no Number 8 References
Acc_details.Acc
_no

Deposit_amt Number 12,4
Withdraw_amt Number 12,4
Mode_trans Char 5 Not Null
Cheque_no Number 6 Default 0
Trans_date Date Not Null
/*
When a specific account will be deleted then all the transaction details from
Transactions_acc will be deleted for that account number.
*/
-------------------------------------------------------
create table Transaction_Acc(
	Transaction_Id number(8) primary key,
	Acc_No varchar2(8) references Acc_details on DELETE CASCADE,
	Deposit_amt number(12,4),
	Withdraw_amt number(12,4),
	Mode_trans char(5) not null,
	Check_no number(6) default 0,
	Trans_date date not null
);
desc Acc_details;
desc Transaction_acc;

insert into Acc_details values('001', 'AMIT', 'BK-256', '12-JAN-2012', 'M', 9836773258, 
'13-JUN-2012', 12000, 'A');

select * from Acc_details;

insert into Transaction_Acc values(002, '001', 11000, 5000, 'A', 101, '12-JUN-2012');
insert into Transaction_Acc values(003, '001', 12000, 6000, 'B', 102, '13-JUL-2012');

select * from Transaction_Acc;



delete from Acc_details where Acc_no='001';
select * from Acc_details;
select * from Transaction_Acc;