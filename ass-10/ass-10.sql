/*
1. Write a PL/SQL block that will add 2% interest of all customer of a bank
for active account.
i) For updating Acc_details updating, you have to use Cursor.
ii) For entry in Transaction_Acc, you have to use procedure.
iii) For Generation Transaction_id, you have to use function.*/
-------------------------------------------------------
-- sol - i
set serveroutput on
declare 
	cursor add_interest
	is 
 	select Acc_no,Total_cost from Acc_details where Acc_status='A';
 	varaccn Acc_details.Acc_no%type;
 	varamt Acc_details.Total_cost%type;
 		begin
 		open add_interest;
 		if add_interest % isopen then
			loop
			fetch add_interest into varaccn,varamt;
			exit when add_interest%notfound;
			update Acc_details set Total_cost=varamt*1.02 where Acc_no=varaccn;
			dbms_output.put_line(varaccn || ' is updated');
			end loop;
 		else
 			dbms_output.put_line('Curson not opened.');
		end if;
		close add_interest;
		commit;
		end;
/
-- sol - ii) & iii)
set serveroutput on
create function Max_id return number 
is
	var_id number(4);
	begin
	select max(Transaction_id) into var_id from Transaction_acc;
		if var_id is null then
		var_id:=200;
		else
		var_id:=var_id+1;
		end if;
		return var_id;
		exception
		when no_data_found then
		return var_id;
	end;
/

create procedure Transaction_entry(varaccn in Acc_details.Acc_no%type, varamt in 
Acc_details.Total_cost%type)
	is
	vartid Transaction_acc.Transaction_id%type;
	begin
	vartid:=Max_id();
   insert into Transaction_acc values(vartid, varaccn,varamt, 0, 'CHQ',0,Sysdate);
   	dbms_output.put_line(' Data inserted with Id ' ||vartid);
	end;
/
declare 
	cursor add_interest
	is
select Acc_no, Total_cost from Acc_details where Acc_status='A';
	varaccn Acc_details.Acc_no%type;
	varamt Acc_details.Total_cost%type;
	begin
	open add_interest;
	if add_interest%isopen then
		loop
		fetch add_interest into varaccn, varamt;
		exit when add_interest%notfound;
update Acc_details set Total_cost=varamt*1.02 where Acc_no=varaccn;
	dbms_output.put_line( varaccn || ' is updated ');
	varamt:=varamt*1.02;
	Transaction_entry(varaccn, varamt);
	end loop;
	else
		dbms_output.put_line('Cursor not opened. ');
	end if;
	close add_interest;
	commit;
	end;
/




/*2. a) Create the following table: (Table Name:– Emp_audit)
Column_Name Data
type

Size Attributes
Emp_no Number 4 Primary Key
Dept_no Number 4 Not Null, Ref.
department.dept_no

Status Varchar
2

8

Salary Number 8,2 Not Null
Audit_date Date Not Null
b)Write a trigger that must keep track of records (in above table) that
are being deleted or updated from Employee table.
c) Write a SQL command to update the employee entry and describe
the output.*/
----------------------------
-- sol a,b & c)
set serveroutput on
create table Emp_audit
(Emp_no number(4) primary key,
	Dept_no number(4) not null references Dept,
	Status varchar2(8),
	Salary number(8,2) not null, 
	Audit_date date not null);
----------------------------------------------------------------------------------------------
set serveroutput on
drop trigger trg_sal;
create trigger trg_sal after 
update or delete on Emp for each row
 declare
	status varchar2(20);
	begin
		if updating then
		status:='UPDATE';
		end if;
		if deleting then
		status:='DELETE';
		end if;
  insert into Emp_audit values(:Old.empno, :Old.deptno,status, :Old.Sal,SYSDATE);

	end;
/
------------
update Emp set Sal=2050 where Empno=7499;
------------
select * from Emp_audit;