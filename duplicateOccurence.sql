--Find Duplicates From a Table in SQL Server

use bookstoreDB
select * from BookTable

select bookName, AuthorName, count(*) occurences from BookTable
group by bookName, AuthorName having count(*) > 1 