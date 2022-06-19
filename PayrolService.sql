Create database Payroleservice
use Payroleservice;

CREATE TABLE employee_payrole(
	Id int Identity(1,1) PRIMARY KEY,
	Name varchar (200),
	Salary float,
	StartDate date
	);

	INSERT INTO employee_payrole VALUES('Abhishek','12345','2016/03/01') ,('Viahan','13335','2018/01/05'),('Virat','525245','2019/03/01');

	select * from  employee_payrole;

	select Name,StartDate from employee_payrole where Name='Viahan';
select * from employee_payrole where StartDate between cast('2005-01-01' as date) and getdate();

alter table employee_payrole add Gender char(1);
update employee_payrole set Gender='M';
update employee_payrole set Gender='F' where Id='1';
select SUM(Salary) as TotalSalary,Gender from employee_payrole group by Gender;
select AVG(Salary) as AverageSalary from employee_payrole group by Gender;
select count(Salary) as TotalSalary,Gender from employee_payrole group by Gender;
select Min(Salary) as MinSalary,Gender from employee_payrole group by Gender;
select Max(Salary) as MaxSalary,Gender from employee_payrole group by Gender;

alter table employee_payrole add PhoneNumber bigint;
alter table employee_payrole add Department varchar(250) not null default 'HR';
alter table employee_payrole add Address varchar(250) default 'bangaluru';
select * from employee_payrole;

---RenameColomn name in existing table(Salary renamed as Basic pay)---
Exec sp_rename 'employee_payrole.Salary', 'BasicPay';
alter table employee_payrole add TaxablePay float, Deduction float,IncomeTax float,NetPay float;
Update employee_payrole set Deduction = '4000' where Department = 'HR';
Update employee_payrole set Deduction = '3000' where Department = 'Sales';
Update employee_payrole set Deduction = '2000' where Department = 'Customer Service';
Update employee_payrole set NetPay = (BasicPay-Deduction);
Update employee_payrole set TaxablePay = '1000';
Update employee_payrole set IncomeTax = '200';
select * from employee_payrole;