use practiceDB

create table firstTriggerTable
(
	FirstTableId int primary Key identity(1,1),
	descrption varchar(255)
)

insert into firstTriggerTable(descrption) values('first')
insert into firstTriggerTable(descrption) values('second')
update firstTriggerTable set descrption = 'update' where FirstTableId = 2
delete from firstTriggerTable

select * from triggerTableOpe

-----------------------------------

create table triggerTableOpe
(
	triggerTableId int primary Key identity(1,1),
	FirstTbId int,
	descfirst varchar(255),
	operation varchar(255)
)



create trigger trPerformAction
on firstTriggerTable
after insert, update, delete
as
begin
	insert into triggerTableOpe (FirstTbId, descfirst, operation) 
	select FirstTableId, descrption, 'inserted' 
	from inserted 
	UNION ALL
	select FirstTableId, descrption, 'deleted' 
	from deleted 

end
