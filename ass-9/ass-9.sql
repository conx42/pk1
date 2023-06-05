/*
1. Write a PL/SQL block of code that first withdraws an amount of Rs. 500.
Then again withdraws Rs. 500. Now if the current balance of a specific
account number is less than Rs. 1000 then undo thelast withdraw just
made.*/
create table Acc_details
(
 Acc_No varchar2(8) primary key,
 Name varchar2(20) not null,
 Address varchar2(50) not null,
 DOB date not null,
 sex char(1) check (sex in ('M', 'F')),
 contact_no number(10) not null,
 last_trans_date date not null,
 Total_amt number(14,2) not null,
 Acc_status char(1) not null check(Acc_status in ('A', 'I'))
);
insert into Acc_details values('001', 'AMIT', 'BK-256', '12-JAN-2012', 'M', 9836773258, 
'13-JUN-2012', 12000, 'A');
insert into Acc_details values('002', 'SUMIT', 'AB-125', '10-FEB-2012', 'M', 9830073258, 
'13-JAN-2012', 1500, 'A');
insert into Acc_details values('003', 'RAMIT', 'BG-350', '25-JAN-2013', 'M', 9877363258, 
'15-JUL-2012', 10000, 'A');
set serveroutput on
declare
   n number(20);
   t number(20);
   amt number:=500;
begin
   n:=&n;
   update Acc_details set Total_amt=Total_amt-amt where
   Acc_No=n;
   commit;
   savepoint s;
   update Acc_details set Total_amt=Total_amt-amt where
   Acc_No=n;
   select Total_amt into t from Acc_details where Acc_No=n;
   if(t < 1000) then
 	 dbms_output.put_line('Balance after 2nd Transaction = ' || t);
 	 dbms_output.put_line('!!!!! Insufficient Balance !!!! ');
 	 rollback to savepoint s;
 	 dbms_output.put_line('Balance after Rollback = ' || t);
   else
     commit;
     select Total_Amt into t from Acc_details where Acc_No=n;
     dbms_output.put_line('Balance after COMMIT = ' || t);
   end if;
end;
/



desc Acc_details;


select * from Acc_details;
/*
2. Write a PL/SQL block of code to update the location of specific
department number that will be taken from user. Display an
appropriate message using SQL%FOUND based on existence of the
record in the Department table and display an appropriate message
using SQL%NOTFOUND based on the non-existence of the record in
Department Table.*/

select * from dept;
set serveroutput on
declare
  dno number:=&dno;
  loc1 varchar2(10):='&loc';
begin
  update Dept set loc=loc1 where Deptno=dno;
  if sql%found then
   dbms_output.put_line(' The updated loc is ' || loc1);
  end if;
  if sql%notfound then
    dbms_output.put_line(' The updated loc is not found. ');
  end if;
end;
/

/*
3. Write a PL/SQL block that will show an Employee name for a given
Employee number. Here you try to enter a wrong Employee number
and show an appropriate message i.e. NOT FOUND using exception
handling.*/

set serveroutput on
declare
	ename varchar2(20);
	Eno number:=&Eno;
begin
	select ename into ename from Emp where Empno=Eno;
	dbms_output.put_line(' The Employee name is ' || ename);
	exception
	when NO_DATA_FOUND then
	dbms_output.put_line(' The Employee is not found for the given Emp No. ');
end;
/

select * from emp;

/*
4. Write a PL/SQL block of code using your own exception handling that
will show an error message whenever you want to insert a null value
in a not null column.*/

set serveroutput on
declare
	IN_ERR exception;
	Pragma
	exception_init(IN_ERR, -01400);
begin
	insert into Emp values (null,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mmyyyy'),2850, null, 30);
	exception
	when IN_ERR then
		dbms_output.put_line(' Cannot insert Null values in not Null column. ');
end;
/


/*
5. a) Create a table Emp_sal_inc that have three column (Emp_id,
Cur_sal, Inc_date).
b) Now write a PL/SQL block of code will allow 2% salary increment of
all employee of RESEARCH department. After that all records are to
be inserted into the above table i.e. Emp_sal_inc.*/

set serveroutput on
create table Emp_sal_inc(
	Emp_id number(10), 
	cur_sal number(20,4), 
	inc_date date
);
declare
	cursor cur is
		select Empno, Sal from Emp where Deptno=(Select Deptno from Dept where Dname='RESEARCH');
	Emp_id number;
	Emp_sal Emp.Sal%type;
begin
	open cur;
	if cur%isopen then
	  loop
      fetch cur into Emp_id, Emp_sal;
      exit when cur%notfound;
      update Emp set Sal=Sal*1.02 where Empno=Emp_id;
      select Sal into Emp_sal from Emp where Empno=Emp_id;
      insert into Emp_sal_inc values(Emp_id, Emp_sal, SYSDATE);
    end loop;
    commit;
    dbms_output.put_line(cur%rowcount);
   else
     dbms_output.put_line(' Cursor not open....');
   end if;
   close cur;
end;
/
select * from Dept;
select * from Emp;
select * from Emp_sal_inc;