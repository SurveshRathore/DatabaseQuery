use bookstoreDB
select BookName, DiscountPrice from BookTable
where
DiscountPrice < (
	select avg(DiscountPrice)
	from BookTable

)

---------------------
use bookstoreDB
select BookName, DiscountPrice from BookTable
where
DiscountPrice > (
	select avg(DiscountPrice)
	from BookTable
)