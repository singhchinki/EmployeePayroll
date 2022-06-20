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

INSERT INTO employee_payrole(Name,BasicPay,StartDate,Gender,PhoneNumber,Department,Address,TaxablePay,Deduction,IncomeTax,NetPay) VALUES('Terissa','525245','2018/03/01','F','7345787969','Sales','Mumbai','1200','1650','2000','40013');
INSERT INTO employee_payrole(Name,BasicPay,StartDate,Gender,PhoneNumber,Department,Address,TaxablePay,Deduction,IncomeTax,NetPay) VALUES('Terissa','525245','2018/03/01','F','7345787969','Marketing','Mumbai','0','0','0','0');

select * from employee_payrole;

create table Department
(
department_id int not null primary key,
department_name varchar(20) not null
)
insert into Department values(101,'Sales'),(102,'Marketing');
select * from Department;

create table payroll
(
payroll_Id int not null primary key,
basic_pay money not null,
deductions money not null,
taxable_pay money not null,
net_pay money not null,
income_tax money not null
)

insert into payroll values(201,500000,3000,2000,22000,300),
(202,600000,4000,3000,32000,400),
(203,700000,5000,4000,42000,500);
create table company
(
company_id int not null primary key,
company_name varchar(20) not null
)
insert into company values
(301,'Nokia'),
(302,'Samsung');
select * from company;

create table employee
(
employee_id int not null primary key,
employee_name varchar(70) not null,
gender char(1) not null,
address varchar(100) not null,
phone_number bigint not null,
start_date datetime not null,
company_id int not null,
payroll_id int not null,
basic_pay money not null,
foreign key(company_id) references company(company_id),
foreign key(payroll_id) references payroll(payroll_Id)
)
insert into employee values
(1,'dhiraj','M','latur',3939390910,'2020-10-2',301,201,300000),
(2,'suraj','M','pune',3939690910,'2019-10-2',302,202,40000),
(3,'kajol','F','amrvati',3959390910,'2020-10-2',301,203,600000);
select * from employee;

create table EmployeeDepartment
(
employee_Department_id int not null,
employee_id int not null,
department_id int not null,
foreign key(employee_id) references employee(employee_id),
foreign key(department_id)references Department(department_id)
)
insert into EmployeeDepartment values
(401,1,101),
(402,2,102),
(401,1,102),
(402,2,101);
select * from EmployeeDepartment;

/*Redo the UC-7 */
select sum(basic_pay) from employee where gender='M' group by gender;
select sum(basic_pay) from employee where gender='F' group by gender;
select avg(basic_pay) from employee where gender='M' group by gender;
select avg(basic_pay) from employee where gender='F' group by gender;
select min(basic_pay) from employee where gender='M' group by gender;
select min(basic_pay) from employee where gender='F' group by gender;
select max(basic_pay) from employee where gender='M' group by gender;
select max(basic_pay) from employee where gender='F' group by gender;
select count(phone_number) as 'number of gender' from employee group by gender;
