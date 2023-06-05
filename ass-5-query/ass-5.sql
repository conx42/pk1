-- 1. List all the employee names, dept name and the city, in department name order.
select ename,dname,loc from emp,dept where emp.deptno=dept.deptno order by dname;

-- 2. List all employees working in Dallas in descending order of salary.
select * from emp where deptno in (select deptno from dept where loc='DALLAS') order by sal desc;

-- 3. List employee name, department name, job and location of all employees who work in DALLAS.
select ename,dname,job,loc from emp,dept where emp.deptno=dept.deptno and loc='DALLAS';

-- 4. List the employee name, salary, PF, HRA, DA and gross salary; order the result in ascending order of gross. PF is 10% of salary, HRA is 60% of salary and DA is 40% of salary.
select ename,sal,sal*0.1 PF,sal*0.6 HRA, sal*0.4 DA,(sal*0.1+sal*0.6+sal*0.4+sal) Gross_sal from emp order by 
Gross_sal;

-- 5. Display names and salary of all the employees who report to KING.
select ename,sal from emp where mgr=(select empno from emp where ename='KING');

-- 6. List all employees who work in DALLAS and earn more than any employee working in Chicago.
select ename, loc, sal from emp, dept where emp.deptno=dept.deptno and loc = 'DALLAS' and sal>(select 
max(sal) from emp, dept where loc= 'CHICAGO' and emp.deptno=dept.deptno);

-- 7. List all employees who work in the same post as Smith.
Select ename, job from emp where job=(select job from emp where ename= 'SMITH');

-- 8. Find the job with the highest average salary.
Select job from emp where sal = (select max(avg(sal)) from emp group by job);

-- 9. List the top 10 earners in the company.
Select ename, sal from (select ename, sal from emp order by sal desc) where rownum <=10;

-- 10. Display the names of all employees’ replacing ‘A’ with ‘a’.
Select replace (ename, 'A', 'a') from emp;

-- 11. Show the salary of all the employees rounding it to the nearest Rs.1000/-.
Select ename, sal, round (sal, -3) from emp;

-- 12. Show the first three and last three characters of the names of all the employees.
Select substr(ename,1,3), substr(ename, -3) from emp;
