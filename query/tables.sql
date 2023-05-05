use practiceDB
create table orders
(
	OrderId int primary key identity(1,1),
	productId int foreign key references products(productId),
	orderTime DateTime,
	orderQuantity int,
	orderTotal decimal(8,2)
)

--drop table orders
create table products
(
	productId int primary key identity(1,1),
	productName varchar(255),
	productPrice decimal(8,2)

)
create table inventary
(
	productId int foreign key references products(productId),
	productQuantity int,
	updated DateTime
)
