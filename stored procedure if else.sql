select * from ReviewTable where ReviewRating = 0

create procedure sp_reviewAction
@choice int
AS
BEGIN
	if(@choice = 0)
	
		select * from ReviewTable where ReviewRating = 0
	
	else
	
		select * from ReviewTable where ReviewRating = 1
	
END

exec sp_reviewAction @choice = 1
exec sp_reviewAction @choice = 0


select top 1 with ties *
from ReviewTable 
order by ReviewRating asc
