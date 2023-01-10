use demo209

create table empRecord 
(
	empName varchar(255),
	age int
)

insert into empRecord(empName, age) values('hello',23)
insert into empRecord(empName, age) values('hi', 25)
insert into empRecord(empName, age) values('abd',54)
insert into empRecord(empName, age) values('fvnjj',12)
insert into empRecord(empName, age) values('iooio',64)
insert into empRecord(empName, age) values('sddff',27)
insert into empRecord(empName, age) values('qwerr',43)
insert into empRecord(empName, age) values('wer',78)

select * from empRecord

---Write Query to fetch data whose age is above 20
select * from empRecord where age>20

create table empRecord2 
(
	empName varchar(255),
	city varchar(255)
)

insert into empRecord2(empName, city) values('hello', 'delhi')
insert into empRecord2(empName, city) values('hi', 'mumbai')
insert into empRecord2(empName, city) values('abd','pune')
insert into empRecord2(empName, city) values('fvnjj','agra')
insert into empRecord2(empName, city) values('iooio','kanpur')
insert into empRecord2(empName, city) values('sddff','prayag')
insert into empRecord2(empName, city) values('qwerr','faridabad')
insert into empRecord2(empName, city) values('wer','dhdh')

select er.empName, er.age, er2.city from empRecord er, empRecord2 er2 
where er.empName = er2.empName

--------------------------
CREATE VIEW [Products Above Average Price] AS
SELECT empName, age
FROM empRecord

select * from [Products Above Average Price]