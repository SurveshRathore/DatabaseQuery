/*Banking application: 
In a banking application, you could use a join to retrieve the account details and transaction history for a specific 
customer. For example, you could join the customers table with the accounts table and the transactions table on the 
account ID to get the account balance, transaction dates, and amounts for the customer's account.*/

create table CustomerTable
(
	customerID int primary key identity(1,1),
	customerName varchar(255),
	customerContact varchar(255)
)
create table AccountTable 
(
	accountNumber int primary key identity(11111,1),
	accountAmount int default 0,
	accountType varchar(25),
	customerID int foreign key references CustomerTable(customerID)
)
create table transactionTable
(
	transactionID int primary key identity(1,1),
	transactionDate dateTime,
	transactionType varchar(25),
	transactionAmount int,
	updatedAmount int,
	accountNumber int foreign key references AccountTable(accountNumber)
)

--alter table transactionTable
--add transactionAmount int

--alter table transactionTable add updatedAmount int

insert into CustomerTable(customerName, customerContact) values ('ABC', '988667'), ('QWERTT', '67854556')
insert into AccountTable(accountType, customerID) values ('saving', 1), ('current', 2)


--insert into transactionTable(transactionDate, transactionType, accountNumber) values ('saving', 1), ('current', 2)

alter procedure spAccountTransaction
(
	@transactionType varchar(25),
	@accountNumber int,
	@accountAmount int
)
as
begin

	declare @tempAmount int = 0;
	insert into transactionTable(transactionDate, transactionType, transactionAmount, accountNumber) values (GETDATE(), @transactionType, @accountAmount, @accountNumber)
	update AccountTable	
	set accountAmount = accountAmount+@accountAmount
	--set @tempAmount= AccountTable.accountAmount;
	where accountNumber = @accountNumber

	select transactionTable.transactionDate, transactionTable.transactionType, transactionTable.transactionAmount, AccountTable.accountNumber, AccountTable.accountAmount, CustomerTable.customerName
	from transactionTable
	inner join AccountTable on transactionTable.accountNumber = AccountTable.accountNumber
	inner join CustomerTable on AccountTable.customerID = CustomerTable.customerID
end

exec spAccountTransaction
	@transactionType = 'credit',
	@accountNumber = 11111,
	@accountAmount = 500

exec spAccountTransaction
	@transactionType = 'debit',
	@accountNumber = 11111,
	@accountAmount = -500
