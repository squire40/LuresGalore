Use LuresGalore;
GO


EXECUTE Product_GetList 1
Go

EXECUTE Product_GetInfo 1
Go

EXECUTE Product_Save null, 'prodname','desc', 3,0
Select * FROM Product
Go

EXECUTE Category_GetList 
Go

EXECUTE Category_GetInfo 1
GO

EXECUTE Category_Save 1, name1,0
SELECT * FROM Category
GO

EXECUTE ProductCategory_Save 2,2,3,0
SELECT * FROM ProductCategory
Go 

EXECUTE User_GetList 1
Go

EXECUTE User_GetInfo 2
Go

EXECUTE User_Save null, usner1, meal1, pass, 2,0
SELECT * FROM [User]
Go

EXECUTE Role_GetList
Go

Execute Role_Save 2,name1,0
SELECT * FROM [Role]
Go

EXECUTE Price_GetList 
go

EXECUTE Price_GetInfo 1
Go

EXECUTE Price_Save 10,5,0
SELECT * FROM Price
Go

EXECUTE ShoppingCart_Save 1,2,0
SELECT * FROM ShoppingCart
Go

EXECUTE ShoppingCart_GetList 2
Go

EXECUTE ShoppingCart_GetInfo 3
GO

EXECUTE LineItem_Save null,3,3,'Livetarget Shrimp','Many saltwater predators find it impossible to resist a live shrimp, making it the single most important forage for all saltwater game fish. This pre-rigged LIVETARGET Shrimp mimics a live shrimp perfectly but is designed to be even more effective. The lifelike body is infused with real shrimp while the rear swimming legs create the illusion that the bait is propelling itself forward, just like a live shrimp. This slow-sinking soft bait is ideal for most saltwater predators, including sea trout, redfish, and striped bass.',10,0,1,0
SELECT * FROM LineItem
GO

EXECUTE LineItem_GetInfo 8
Go

EXECUTE LineItem_GetList 
GO

EXECUTE Order_GetList 2
Go

EXECUTE Order_GetInfo 5
GO

EXECUTE Order_Save null,2,0
SELECT * FROM [Order]
Go

EXECUTE OrderLineItem_GetList 5
Go

EXECUTE OrderLineItem_GetInfo 30
go

EXECUTE OrderLineItem_Save null,5,8,0
SELECT * FROM OrderLineItem
GO



