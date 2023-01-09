--query to creates a new database
create database practiceDB

--query to  lists all databases in the SQL Server:
SELECT 
    name
FROM 
    master.sys.databases
ORDER BY 
    name;

--query to  lists all databases in the SQL Server using the stored procedure sp_databases:
	EXEC sp_databases;

--The following example uses the DROP DATABASE statement to delete the TestDb database:
--DROP DATABASE IF EXISTS TestDb;

