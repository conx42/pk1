-- 1. Write a PL/SQL code for finding factorial of a given number
set serveroutput on
declare
	n number;
	i number;
	f number:=1;
begin
	n:=&x;
	for i in 1..n
	loop
		f:=f*i;
	end loop;
	dbms_output.put_line('Factorial of '||n||' is ' || f);
end;
/

-- 2. Write a PL/SQL code for calculating finding the sum of N numbers.
set serveroutput on
declare
	n number;
	i number;
	s number:=0;
begin
	n:=&n;
	for i in 1..n
	loop
		s:=s+i;
	end loop;
	dbms_output.put_line('Sum of first '||n||' numbers is ' || s);
end;
/

-- 3. Write a PL/SQL code for finds a given year is leap year or not.
set serveroutput on
declare
	y number;
begin
	y:=&x;
	if(mod(y,400)=0)then
		dbms_output.put_line('Leap Year');
	elsif((mod(y,4)=0) and (mod(y,100)!=0))then
		dbms_output.put_line('Leap Year');
	else
		dbms_output.put_line('NOT a Leap Year');
	end if;
end;
/

/*
4. Write a PL/SQL code for finding maximum of three numbers. (Input will be given by
the user).*/
set serveroutput on
declare
	a number;
	b number;
	c number;
begin
	a:=&a;
	b:=&b;
	c:=&c;
	if(a>b and a>c)then
		dbms_output.put_line(a || ' is the maximum');
	elsif(b>c)then
		dbms_output.put_line(b || ' is the maximum');
	else
		dbms_output.put_line(c || ' is the maximum');
	end if;
end;
/


/*
5. Write a PL/SQL code block to calculate the area of a circle for a value of radius
varying from 6 to 10. Store the radius and corresponding values of calculated
area in an empty table named Areas, Consisting of two columns Radius and
Area.*/
set serveroutput on
drop table Areas;
create table Areas(radius number(5,3), area number(10,3));
declare
	r number;
	pi constant number(8,2):=3.14;
	area number(10,2);
begin
	for r in 6..10
	loop 
		area:=pi*power(r,2);
		insert into Areas values(r,area);
	end loop;
end;
/

/*
6. Write a PL/SQL code block that will accept a client_no from the user and adds
the amount of Rs. 1000 to bal_due column, has a minimum balance of Rs. 6000.
The process is fire on client_master.*/
set serveroutput on
declare
	cli_no varchar2(6):= '&client_no';
	t_c_no number(10,2); 
begin
	select balance_due into t_c_no from client_master where client_no=cli_no;
	if(t_c_no>=6000)then
		t_c_no := t_c_no + 1000;
		update client_master set balance_due=t_c_no where client_no=cli_no;
	else
		dbms_output.put_line('The balance is below 6000.');
	end if;
end;
/
