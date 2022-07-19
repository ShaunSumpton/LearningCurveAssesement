

SET IDENTITY_INSERT Customers ON;

with Cte_Customers -- Get Customer Details
as
(
select Distinct CustomerID,
CustomerFirstName + ' ' + CustomerLastName [Customer Name],
CustomerEmailAddress 
from 
UnprocessedOrders
)

Insert Into Customers(ID,CustomerName,CustomerEmailAddress) -- Insert Customer Details
select CustomerID,[Customer Name], CustomerEmailAddress from Cte_Customers

SET IDENTITY_INSERT Customers OFF;

SET IDENTITY_INSERT Products ON;

with Cte_Products -- Get Product Details
as
(
Select Distinct 
ProductID,
ProductName 
from 
UnprocessedOrders
)

Insert Into Products(ID,[Name]) -- Insert Products
select 
ProductID,
ProductName
from Cte_Products
SET IDENTITY_INSERT Products OFF;

SET IDENTITY_INSERT Orders ON;

with Cte_Orders -- Get Order Details
as
(
select 
OrderID,
OrderDescription,
ProductID,
CustomerID
from UnProcessedOrders
)

Insert Into Orders(ID,OrderDescription,Product_FK,Customer_FK) -- Insert Orders
select 
OrderID,
OrderDescription,
ProductID,
CustomerID
from Cte_Orders

SET IDENTITY_INSERT Orders OFF;
