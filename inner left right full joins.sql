use demo209

create table employee
(
	employeeID int not null primary key,
	employeeName varchar(255),
	employeeAge int,
	employeeCity varchar(255),
	departmentID int foreign key references department(departmentID)
)

create table department
(
	departmentID int not null primary key,
	departmmentName varchar(255),
)

--drop table employee

insert into employee(employeeID, employeeName, employeeAge, employeeCity,departmentID) values
(1,'abc',43,'delhi',3),
(2,'cde',16,'muumbai',1),
(3,'efg',25,'chennai',7),
(4,'hig',34,'bangalore',6),
(5,'fdds',12,'pune',4),
(6,'dsssd',54,'kanpur',3),
(7,'ddd',23,'faridabad',2),
(8,'qwert',65,'delhi',5),
(9,'asdfg',27,'muumbai',2),
(10,'zxcvb',19,'chennai',3),
(11,'poiu',26,'bangalore',3),
(12,'lkjh',51,'pune',1),
(13,'mnbv',34,'kanpur',2),
(14,'tghyu',32,'faridabad',2);

insert into department(departmentID, departmmentName) values
(1,'HR'),
(2,'developer'),
(3,'tester'),
(4,'coder'),
(5,'manager'),
(6,'sales'),
(7,'marketing');

---------
select e.employeeName, d.departmmentName
from employee e
left join department d
ON e.departmentID=d.departmentID

select e.employeeName, d.departmmentName
from employee e
inner join department d
ON e.departmentID=d.departmentID

select * from empRecord2

select e.employeeName, er.empName
from employee e
left join empRecord2 er
ON e.employeeCity=er.city

select e.employeeName, er.empName
from employee e
right join empRecord2 er
ON e.employeeCity=er.city

select e.employeeName, er.empName
from employee e
full join empRecord2 er
ON e.employeeCity=er.city