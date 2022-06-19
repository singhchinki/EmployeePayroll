Create database Payroleservice
use Payroleservice;

CREATE TABLE employee_payrole(
	Id int Identity(1,1) PRIMARY KEY,
	Name varchar (200),
	Salary float,
	StartDate date
	);