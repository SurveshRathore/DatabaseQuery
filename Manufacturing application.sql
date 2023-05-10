--Manufacturing application: 
--In a manufacturing application, you could use a join to retrieve the inventory levels and production schedules for a 
--specific product. For example, you could join the products table with the inventory table and the production schedule 
--table on the product ID to get the current inventory levels, production dates, and quantities for the product.

create table productsTable
(
	productID int primary key identity(1,1),
	productName varchar(255),
)
create table inventoryTable
(
	inventoryLevels int,
	productID int foreign key references productsTable(productID),
)
create table productionScheduleTable
(
	productionDates dateTime, 
	productQuantities int,
	productID int foreign key references productsTable(productID),
)

select productsTable.productName, inventoryTable.inventoryLevels, productionScheduleTable.productionDates, productionScheduleTable.productQuantities
from productionScheduleTable
inner join productsTable on productionScheduleTable.productID = productsTable.productID
inner join inventoryTable on productionScheduleTable.productID = inventoryTable.productID
