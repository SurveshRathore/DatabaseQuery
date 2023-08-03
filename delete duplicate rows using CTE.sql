use demo209

select * from employee
insert into employee(employeeName, employeeAge, employeeCity, departmentID)

create table employeeSample
(
	employeeName varchar(255),
	employeeAge int,
	employeeCity varchar(255),
	departmentID int
)

insert into employeeSample(employeeName, employeeAge, employeeCity, departmentID) values
('zxcvb',19,'chennai',3), ('zxcvb',19,'chennai',3), ('zxcvb',19,'chennai',3), ('zxcvb',19,'chennai',3), ('zxcvb',19,'chennai',3), ('zxcvb',19,'chennai',3),
('poiu',26,'bangalore',3), ('poiu',26,'bangalore',3), ('poiu',26,'bangalore',3), ('poiu',26,'bangalore',3), ('poiu',26,'bangalore',3),
('lkjh',51,'pune',1), ('lkjh',51,'pune',1), ('lkjh',51,'pune',1), ('lkjh',51,'pune',1), ('lkjh',51,'pune',1), ('lkjh',51,'pune',1), ('lkjh',51,'pune',1)


WITH duplicateData AS
(
            SELECT employeeName,employeeAge,employeeCity,departmentID, ROW_NUMBER() OVER(PARTITION BY employeeName ORDER BY employeeName) AS rowno  FROM employeeSample
)
DELETE duplicateData WHERE rowno >1


select * from employeeSample