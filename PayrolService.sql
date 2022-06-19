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