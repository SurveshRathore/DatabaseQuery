
insert into products(productName, productPrice)values('mobile', 1234.34), ('tablet', 2345.54),('television', 2341.34), ('books', 45.54),('speaker', 123.34), ('mouse', 111.54),('keyboard', 234.34), ('printer', 2345.54)

select * from products

insert into inventary(productId, productQuantity, updated)values(1, 1234, GETDATE()), (2, 83, GETDATE()),(3, 29, GETDATE()), (4, 23, GETDATE()),(5, 67, GETDATE()), (6, 0, GETDATE()),(7, 54, GETDATE()), (8, 1, GETDATE())

select * from inventary

select products.productId, products.productName, products.productPrice, inventary.productQuantity, inventary.updated 
from products
inner join inventary on products.productId = inventary.productId
