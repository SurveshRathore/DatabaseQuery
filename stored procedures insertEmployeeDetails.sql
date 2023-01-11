create procedure sp_insertEmployeeDetails
@id int
,@name varchar(255)
,@age int
,@city varchar(255)
,@deptId int
AS
BEGIN
	insert into employee
	(
		employeeID, employeeName, employeeAge, employeeCity, departmentID
	) 
	values
	(
		@id, @name, @age, @city, @deptId 
	)
	
END;


--exec sp_insertEmployeeDetails @id = 15, @name = 'rathore', @age = 21, @city = 'Gurugram', @deptId = 2

--exec sp_selectAll
