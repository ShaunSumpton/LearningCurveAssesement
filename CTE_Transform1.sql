SET IDENTITY_INSERT Customers ON;

Insert Into Customers(ID,CustomerName,CustomerEmailAddress)  -- Customer Details
select distinct CustomerID,CustomerFirstName + ' ' + CustomerLastName [Customer Name],CustomerEmailAddress from UnProcessedOrders

SET IDENTITY_INSERT Customers OFF;
SET IDENTITY_INSERT Products ON;

Insert Into Products(ID,[Name]) -- Product Details
select distinct ProductID,ProductName from UnProcessedOrders

SET IDENTITY_INSERT Products OFF;
SET IDENTITY_INSERT Orders ON;

Insert into Orders(ID,OrderDescription,Product_FK,Customer_FK) -- Order Details
select Distinct OrderID,OrderDescription,ProductID,CustomerID from UnProcessedOrders

SET IDENTITY_INSERT Orders OFF;
