USE [practiceDB]
GO

/****** Object:  StoredProcedure [dbo].[spAddorder]    Script Date: 05-05-2023 11:04:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[spAddorder]
(
	@productId int,
	@productQuantity int
)
as
begin

	if exists (select * from inventary where productId = @productId)
	begin
		if(@productQuantity >= 0)
		begin 
			declare @inventaryQuantity int = 0;
			declare @productPrice decimal(8,2) = 0.0;
			declare @OrderPrice decimal(10,2) = 0.0;
			
			select @inventaryQuantity = productQuantity from inventary where productId = @productId
			--print @inventaryQuantity
			if(@inventaryQuantity >= @productQuantity)
			begin
				select @productPrice = productPrice from products where productId = @productId
				set @OrderPrice = @inventaryQuantity * @productPrice;

				insert into orders (productId, orderTime, orderQuantity, orderTotal) 
				values (@productId, GETDATE(), @productQuantity, @productPrice)

				update inventary set productQuantity = productQuantity- @productQuantity where productId = @productId

				select orders.OrderId, orders.productId, orders.orderQuantity, orders.orderTotal, inventary.productQuantity
				from orders
				inner join inventary on orders.productId = inventary.productId

			end

			else
				begin
				print 'quantity exceded'
				end
		end
		
		else
		begin
			print 'invalid quantity'
		end
	end

	else
	begin
		print 'invalid product'
	end
	
	
end
GO

select * from inventary

exec spAddorder
	@productId = 2,
	@productQuantity =20

