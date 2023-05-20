
create table OrderTable
(
	OrderID int primary key identity(1,1),
	CustomerID int foreign key references CustomerTable(CustomerID),
	ProductID int foreign key references ProductTable(ProductID),
)
create table CustomerTable
(
	CustomerID int primary key identity(1,1),
	CustomerName varchar(255),
	CustomerEmail varchar(255)
)
create table ProductTable
(
	ProductID int primary key identity(1,1),
	productQuantity int
)

insert into ProductTable(productQuantity) values (1),(2)
insert into CustomerTable (CustomerName, CustomerEmail) values('abc', 'abc@gmail.com'), ('xyz', 'xyz@gmail.com')
insert into OrderTable (CustomerID, ProductID) values(1,1), (1,2)

------------------------------------------------------------------ trigger----------------------
create trigger trOrderUpdateprodQuan
on OrderTable
after insert, update, delete
as
begin
	update ProductTable set productQuantity = productQuantity - 1 
end

-------------------------------------join--------------------------
select OrderTable.OrderID, OrderTable.CustomerID, OrderTable.ProductID, CustomerTable.CustomerName, ProductTable.productQuantity
from OrderTable
inner join  CustomerTable on CustomerTable.CustomerID = OrderTable.CustomerID
inner join  ProductTable on ProductTable.ProductID = OrderTable.ProductID

-------------------------------stored procedure----------------------
create procedure spInsertUpdateProduct
(
	@productID int,
	@productQuantity int
)
as
begin
	if exists (select * from ProductTable where ProductID = @productID)
	begin
		update ProductTable set productQuantity = @productQuantity where ProductID = @productID
		select * from ProductTable
	end
	else
	begin
		insert into ProductTable( productQuantity) values ( @productQuantity)

		select * from ProductTable
	end
end

exec spInsertUpdateProduct
	@productID = 1,
	@productQuantity = 4


------------------------------------cursor----------------------
Declare cursorCustomer CURSOR
for select
	CustomerName,
	CustomerEmail 
	from CustomerTable


Declare
@CustName varchar(255),
@CustEmail varchar(255)
open cursorCustomer 

fetch next from cursorCustomer into
@CustName,
@CustEmail

while @@FETCH_STATUS = 0
begin
	print 'Name: ' + @custName + ' Email: ' + @custEmail
	fetch next from cursorCustomer into
@CustName,
@CustEmail

end
close cursorCustomer
