-- 1. Display the names of all employees’ right aligning them to 15 characters.
select lpad(empno,15) from emp;

-- 2. Display the names of all employees’ padding them to the right up to 15 characters with ‘*’.
select lpad(empno,15,'*') from emp;

-- 3. Find the details of all the managers in department 10 and all clerks in department 20 and all employees who are neither managers nor clerks but whose salary is more than or equal to 2000/-.
select * from emp where (job='MANAGER' and deptno=10) or (job='CLERK' and 
deptno=20) or (job!='MANAGER' and job != 'CLERK'and sal>=2000);

-- 4. List all the employees who have joined between 01/02/81 and 31/08/81.
select ename,hiredate from emp where hiredate between '1-FEB-81' and '31-AUG-81';

-- 5. List all the employees who were joined as manager during 1981.
select ename,hiredate,job from emp where job='MANAGER' and
to_char(hiredate,'YY')=81;

-- 6. List the employees whose salaries are 800, 1600 or 2450.
select ename, sal from emp where sal in (800,1600,2450);

-- 7. List the names of all employees who are either ‘clerkes’ or ‘salesman’ or ‘analyst’.
select ename, job from emp where job in ('MANAGER','CLERK','ANALYST');

-- 8. List the total number of employees and the average salaries of the different departments.
select count(ename), avg(sal) from emp group by deptno;

-- 9. Calculate the average salary of all employees whose department is 30.
select avg(sal) from emp where deptno=30;

-- 10. Calculate the minimum salary earn by a ‘clerks’.
select min(sal) from emp where job='CLERK';

-- 11. Calculate the maximum salary earn by salesman.
select max(sal) from emp where job='SALESMAN';

-- 12. Find the names of those employees whose immediate boss is in different department.

-- 13. Calculate the no of employees who are not getting any commission.
select count(ename) from emp where comm is NULL;

-- 14. Find the department is not having any employee.
select deptno from emp;
select dname from dept where deptno not in (10,20,30);