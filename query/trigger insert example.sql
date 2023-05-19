use practiceDB

create table firstTriggerTable
(
	FirstTableId int primary Key identity(1,1),
	descrption varchar(255)
)

create table triggerTable
(
	triggerTableId int primary Key identity(1,1),
	FirstTbId int,
	descfirst varchar(255)
)

create trigger trPerform
on firstTriggerTable
after insert, update, delete
as
begin
	insert into triggerTable (FirstTbId, descfirst) select FirstTableId, descrption from firstTriggerTable
end
----------------------------------
insert into firstTriggerTable(descrption) values('first')
insert into firstTriggerTable(descrption) values('second')
update firstTriggerTable set descrption = 'update' where FirstTableId = 2
delete from firstTriggerTable
select * from triggerTable
