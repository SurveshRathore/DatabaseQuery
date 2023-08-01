use practiceDB

create table EngStudent
(
	ID UNIQUEIDENTIFIER primary key default NEWID(),
	StudentName varchar(255)
)

insert into EngStudent (StudentName) values ('ABC')
insert into EngStudent (StudentName) values ('CDE'), ('EDR')
select * from EngStudent

create table MathStudent
(
	ID UNIQUEIDENTIFIER primary key default NEWID(),
	StudentName varchar(255)
)
insert into MathStudent (StudentName) values ('XYZ'), ('QAZ')
select * from MathStudent

create table studentMathEng 
(
	ID UNIQUEIDENTIFIER primary key,
	StudentName varchar(255)
)
GO
Insert into studentMathEng
select * from practiceDB.dbo.EngStudent
UNION ALL
select * from practiceDB.dbo.MathStudent

select * from studentMathEng

