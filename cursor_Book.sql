use practiceDB

select * from BookStoreDB.dbo.BookTable

Declare
	@BookName varchar(255),
	@DiscountPrice int;


declare cursor_Book cursor
for select 
	BookName, DiscountPrice

	from 
		BookStoreDB.dbo.BookTable


OPEN cursor_Book;

Fetch next from cursor_book into
	@BookName,
	@DiscountPrice;

while @@FETCH_STATUS = 0
	Begin
		print @BookName + ' ' +CAST(@DiscountPrice AS varchar)

		Fetch next from cursor_book into
		@BookName,
		@DiscountPrice;
	END;

CLOSE cursor_book