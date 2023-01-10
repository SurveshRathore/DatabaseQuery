create procedure sp_selectAll
AS
BEGIN
	SELECT
		employeeID, 
		employeeName, 
		employeeAge, 
		employeeCity,
		department.departmentID,
		departmmentName
	FROM
		employee
		inner join department ON department.departmentID = employee.departmentID
	ORDER BY
		departmmentName asc

END;

--EXECUTE sp_selectAll

--DROP PROCEDURE sp_selectAll;
--DROP PROC sp_selectAll;    



