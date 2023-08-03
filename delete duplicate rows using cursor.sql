use demo209

create table employeeSample
(
	employeeName varchar(255),
	employeeAge int,
	employeeCity varchar(255),
	departmentID int
)

select * from employeeSample

insert into employeeSample(employeeName, employeeAge, employeeCity, departmentID) values
('zxcvb',19,'chennai',3), ('zxcvb',19,'chennai',3), ('zxcvb',19,'chennai',3), ('zxcvb',19,'chennai',3), ('zxcvb',19,'chennai',3), ('zxcvb',19,'chennai',3),
('poiu',26,'bangalore',3), ('poiu',26,'bangalore',3), ('poiu',26,'bangalore',3), ('poiu',26,'bangalore',3), ('poiu',26,'bangalore',3),
('lkjh',51,'pune',1), ('lkjh',51,'pune',1), ('lkjh',51,'pune',1), ('lkjh',51,'pune',1), ('lkjh',51,'pune',1), ('lkjh',51,'pune',1), ('lkjh',51,'pune',1)

DECLARE @EmpName varchar(255), @EmpAge int, @EmpCity varchar(255), @EmpDepID int, @Count INT
DECLARE DuplicateCursor CURSOR
FOR SELECT employeeName, employeeAge, employeeCity, departmentID, Count(1) as c FROM employeeSample GROUP BY employeeName, employeeAge, employeeCity, departmentID
 
OPEN DuplicateCursor
FETCH NEXT FROM DuplicateCursor INTO @EmpName, @EmpAge, @EmpCity, @EmpDepID, @Count
WHILE @@FETCH_STATUS = 0
BEGIN
    DELETE TOP (@Count-1) FROM employeeSample
    WHERE employeeName = @EmpName AND employeeAge = @EmpAge AND employeeCity = @EmpCity AND departmentID = @EmpDepID
    FETCH NEXT FROM DuplicateCursor INTO @EmpName, @EmpAge, @EmpCity, @EmpDepID, @Count
END

select * from employeeSample