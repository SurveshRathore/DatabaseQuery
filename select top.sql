use demo209

insert into empRecord values('ddd',25),('fgf',25),('dfff',25),('sddfg',25)
insert into empRecord values('ddd',23),('fgf',23),('dfff',23),('sddfg',23)
insert into empRecord values('ddd',12),('fgf',12),('dfff',12),('sddfg',12)
select * from empRecord 

select top 3 *
from empRecord
order by age asc