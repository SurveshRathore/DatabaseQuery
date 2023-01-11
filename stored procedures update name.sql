create procedure sp_updateEmployeeName
@name varchar(255)
,@id int
AS
BEGIN
	update employee set employeeName = @name where employeeID = @id
	
END;


--exec sp_updateEmployeeName @name = 'sarvesh', @id = 9

--exec sp_selectAll