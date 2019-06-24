USE LuresGalore
GO
CREATE PROCEDURE Product_GetList
@CategoryId int = NULL
AS
BEGIN TRY
SELECT * FROM Product
INNER JOIN ProductCategory
ON Product.ProductId = ProductCategory.ProductId
WHERE ((CategoryId = @CategoryId) OR (@CategoryId = NULL))
ORDER BY CategoryId DESC
--Option (RECOMPILE)
END TRY

BEGIN CATCH
ROLLBACK TRAN Product_GetList
END CATCH
GO

CREATE PROCEDURE Product_GetInfo
@ProductId int
AS
BEGIN TRY
Select * FROM Product
WHERE ProductId = @ProductId
Order BY ProductId
END TRY

BEGIN CATCH
ROLLBACK TRAN Product_GetInfo
END CATCH
GO

CREATE PROCEDURE Product_Save

@ProductId int = NULL,
@Name VARCHAR(MAX),
@Description VARCHAR(MAX),
@PriceId INT = NULL,
@IsDelete Bit

AS
BEGIN TRAN
BEGIN TRY

MERGE Product AS TARGET
USING (SELECT @ProductId AS ProductID, @Name AS Name, @Description AS Description, @PriceId AS PriceId) AS SOURCE
ON (TARGET.ProductID = SOURCE.ProductID)
WHEN MATCHED AND @IsDelete = 1 
	THEN DELETE 
WHEN MATCHED AND @IsDelete = 0
	THEN UPDATE SET TARGET.Name = SOURCE.Name, TARGET.Description = SOURCE.Description, TARGET.PriceId = SOURCE.PriceId
WHEN NOT MATCHED AND @IsDelete = 0  
	THEN INSERT (
		Name,
		Description,
		PriceId
		)
	VALUES (
		SOURCE.Name,
		SOURCE.Description,
		SOURCE.PriceId
		);

	COMMIT
END TRY



BEGIN CATCH
	ROLLBACK
END CATCH
GO

CREATE PROCEDURE Category_GetList
AS
BEGIN TRY
SELECT * FROM Category
END TRY

BEGIN CATCH
ROLLBACK TRAN Category_GetList
END CATCH
GO

CREATE PROCEDURE Category_GetInfo
	@CategoryId int
	AS
	BEGIN TRY
	SELECT * FROM Category
	WHERE CategoryId = @CategoryId
	END TRY

	BEGIN CATCH
	ROLLBACK TRAN PROCEDURE_NAME
	END CATCH
	
Go

CREATE PROCEDURE Category_Save
	@CategoryID int = NULL,
	@Name VARCHAR(MAX),
	@IsDelete BIT
	AS

	BEGIN TRY
	BEGIN TRAN
	MERGE Category AS Target
	USING (SELECT @CategoryID AS CategoryID,  @Name AS [Name]) AS SOURCE
	ON (TARGET.CategoryID = SOURCE.CategoryID)
	WHEN MATCHED AND @IsDelete = 1
		THEN Delete 
	WHEN MATCHED AND @IsDelete = 0
		THEN UPDATE SET  TARGET.[Name] = SOURCE.[Name]
	WHEN NOT MATCHED
		THEN INSERT (
			[Name]
			)
		VALUES(
			SOURCE.[Name]
			);
			COMMIT
	END TRY

	BEGIN CATCH
			ROLLBACK
	END CATCH
GO

CREATE PROCEDURE ProductCategory_Save
@ProductCategoryId int = NULL,
@ProductID int,
@CategoryID int, 
@IsDelete bit

AS
BEGIN TRAN
BEGIN TRY

MERGE ProductCategory AS TARGET
USING (SELECT @ProductCategoryId AS ProductCategoryId, @ProductID AS ProductID, @CategoryID as CategoryID) AS Source
ON (TARGET.ProductID = SOURCE.ProductID)
WHEN MATCHED AND @IsDelete = 1
	THEN DELETE
WHEN MATCHED AND @IsDelete = 0
	THEN UPDATE SET TARGET.ProductID = SOURCE.PRODUCTID, TARGET.CategoryID = SOURCE.CategoryID
WHEN NOT MATCHED AND @IsDelete = 0
	THEN INSERT (
		ProductID,
		CategoryID
		)
	VALUES (
		SOURCE.ProductId,
		SOURCE.CategoryId
			);
		COMMIT
END TRY

BEGIN CATCH
	ROLLBACK
END CATCH
GO

CREATE PROCEDURE User_GetList
@RoleId int = NULL
AS
BEGIN TRY
SELECT * FROM [User]
WHERE ((RoleId = @RoleId) OR (@RoleId = NULL))
END TRY

BEGIN CATCH
ROLLBACK TRAN User_GetList
END CATCH
Go

CREATE PROCEDURE User_GetInfo
@UserId int
AS
BEGIN TRY
SELECT * FROM [User]
WHERE UserId = @UserId
END TRY

BEGIN CATCH
ROLLBACK TRAN User_GetInfo
END CATCH
GO

CREATE PROCEDURE User_Save

@UserID int = NULL, 
@Username VARCHAR(100), 
@Email varchar(100), 
@Password varchar(50),
@RoleID int, 
@IsDelete BIT

AS
BEGIN TRY
BEGIN TRAN

MERGE [User] AS TARGET
USING (SELECT @UserID AS UserID, @Username AS Username, @Email AS Email, @Password AS [Password], @RoleID AS RoleID) AS SOURCE
ON (TARGET.UserID = SOURCE.UserID)
WHEN MATCHED AND @IsDelete = 1 
	THEN DELETE 
WHEN MATCHED AND @IsDelete = 0
	THEN UPDATE SET  TARGET.Username = SOURCE.Username, TARGET.[Password] = SOURCE.[Password], TARGET.Email = SOURCE.Email, TARGET.RoleID = SOURCE.RoleID
WHEN NOT MATCHED  
	THEN INSERT(
		
		Username,
		Email,
		[Password],
		RoleID
		)
	VALUES (
		
		SOURCE.Username,
		SOURCE.Email,
		SOURCE.[Password],
		SOURCE.RoleID
		);
		COMMIT
END TRY



BEGIN CATCH
	ROLLBACK
END CATCH
Go

CREATE PROCEDURE Role_GetList
AS
BEGIN TRY
SELECT * FROM Role
END TRY

BEGIN CATCH
ROLLBACK TRAN Role_GetList
END CATCH
GO

CREATE PROCEDURE Role_Save
@RoleId int = NULL,
@Name VARCHAR(100),
@IsDelete Bit

AS
BEGIN TRY
BEGIN TRAN

MERGE [Role] AS TARGET
USING (SELECT @RoleId AS RoleId, @Name as [Name]) AS SOURCE
ON (TARGET.RoleId = SOURCE.RoleId)
WHEN MATCHED AND @IsDelete = 1 
	THEN DELETE 
WHEN MATCHED AND @IsDelete = 0
	THEN UPDATE SET TARGET.[Name] = SOURCE.[Name]
WHEN NOT MATCHED  
	THEN INSERT (
		
		[Name]
		)
	VALUES (
		
		SOURCE.[Name]
		);
	COMMIT
END TRY

BEGIN CATCH
	ROLLBACK
END CATCH
GO

CREATE PROCEDURE Price_GetList
AS
BEGIN TRY
SELECT * FROM Price

END TRY

BEGIN CATCH
ROLLBACK TRAN Price_GetList
END CATCH
Go

CREATE PROCEDURE Price_GetInfo
@PriceId int
AS
BEGIN TRY
SELECT * FROM Price
WHERE PriceId = @PriceId
END TRY

BEGIN CATCH
ROLLBACK TRAN Price_GetInfo
END CATCH
Go

CREATE PROCEDURE Price_Save
@PriceId int = NULL,
@Amount int,
@IsDelete bit
AS

BEGIN TRY
BEGIN TRAN


MERGE Price AS TARGET
USING (SELECT @PriceId AS PriceID, @Amount AS Amount) AS SOURCE
ON (TARGET.PriceId = SOURCE.PriceId)
WHEN MATCHED AND @IsDelete = 1
	THEN DELETE
WHEN MATCHED AND @IsDelete = 0
	THEN UPDATE SET  TARGET.AMOUNT = SOURCE.AMOUNT
WHEN NOT MATCHED
	THEN INSERT (
	
		Amount
		)
	VALUES(
		
		SOURCE.Amount
		);
		COMMIT
END TRY

BEGIN CATCH
		ROLLBACK
END CATCH
GO

CREATE PROCEDURE ShoppingCart_GetList
@UserId int
AS
BEGIN TRY
SELECT * FROM ShoppingCart
WHERE UserId = @UserId
END TRY

BEGIN CATCH
ROLLBACK TRAN ShoppingCart_GetList
END CATCH
GO

CREATE PROCEDURE ShoppingCart_GetInfo
@ShoppingCartID int
AS
BEGIN TRY
SELECT * FROM ShoppingCart
WHERE ShoppingCartID = @ShoppingCartID
END TRY

BEGIN CATCH
ROLLBACK TRAN ShoppingCart_GetInfo
END CATCH
Go

CREATE PROCEDURE ShoppingCart_Save
@ShoppingCartID int = NULL, 
@UserID int, 
@IsDelete BIT
AS

BEGIN TRY
BEGIN TRAN

MERGE ShoppingCart AS TARGET
USING(SELECT @ShoppingCartID AS ShoppingCartID, @UserID AS UserID) AS SOURCE
ON TARGET.ShoppingCartID =SOURCE.ShoppingCartID
WHEN MATCHED AND @IsDelete = 1 
	THEN DELETE 
WHEN MATCHED AND @IsDelete = 0
	THEN UPDATE SET TARGET.UserID = Source.UserID
WHEN NOT MATCHED AND @IsDelete = 0
	Then INSERT (UserID)
	VALUES(SOURCE.UserID);

	COMMIT
END TRY

BEGIN CATCH
	ROLLBACK
END CATCH
GO

CREATE PROCEDURE LineItem_GetList
AS
BEGIN TRY
SELECT * FROM LineItem
END TRY

BEGIN CATCH
ROLLBACK TRAN LineItem_GetList
END CATCH
Go

CREATE PROCEDURE LineItem_GetInfo
@LineItemID int
AS
BEGIN TRY
SELECT * FROM LineItem
WHERE LineItemID = @LineItemID
END TRY

BEGIN CATCH
ROLLBACK TRAN LineItem_GetInfo
END CATCH
GO

CREATE PROCEDURE LineItem_Save
	@LineItemId int = NULL,
	@ShoppingCartID int, --ShoppingCartLineItem
	@ProductID int, 
	@ProductName varchar(100), 
	@ProductDescription varchar(100),
	@Price Decimal,
	@IsWishList Bit, -- ShoppingCartLineItem
	@Quantity int,
	@IsDelete BIT

AS
	BEGIN TRY
	BEGIN TRAN
		If @IsDelete = 1
			DELETE LineItem WHERE LineItemId = @LineItemId
		ELSE
			INSERT INTO LineItem(ProductID,ProductName,ProductDescription,Price, Quantity)
	VALUES (
		@ProductID,
		@ProductName,
		@ProductDescription,
		@Price,
		@Quantity)
			INSERT INTO ShoppingCartLineItem(ShoppingCartID,IsWishList)
			VALUES (@ShoppingCartID, @IsWishList);
	COMMIT
END TRY

BEGIN CATCH
	ROLLBACK
END CATCH
GO

CREATE PROCEDURE Order_GetList
@USERID int
AS
BEGIN TRY
SELECT * FROM [Order]
INNER JOIN [User]
ON [Order].UserId=[User].UserId
WHERE [user].UserID = @UserID
END TRY

BEGIN CATCH
ROLLBACK TRAN Order_GetList
END CATCH 
GO

CREATE PROCEDURE Order_GetInfo
@OrderId int
AS
BEGIN TRY
SELECT * FROM [Order]
WHERE
OrderId = @OrderId
END TRY

BEGIN CATCH
ROLLBACK TRAN Order_GetInfo
END CATCH
GO

CREATE PROCEDURE Order_Save
@OrderID int = NULL,
@UserID int,
@IsDelete Bit
AS
BEGIN TRY
BEGIN TRAN

MERGE [Order] AS TARGET
USING (SELECT @OrderID AS OrderID, @UserID AS UserID) AS SOURCE 
ON TARGET.OrderID = SOURCE.OrderID
WHEN MATCHED AND @IsDelete = 1 
	THEN DELETE 
WHEN MATCHED AND @IsDelete = 0
	THEN UPDATE SET TARGET.UserID = SOURCE.UserId
WHEN NOT MATCHED AND @IsDelete = 0  
	THEN INSERT (
		UserID
		)
	VALUES (
		SOURCE.UserID
		);

	COMMIT
END TRY

BEGIN CATCH
	ROLLBACK
END CATCH
GO

CREATE PROCEDURE OrderLineItem_GetList
@OrderId int
AS
BEGIN TRY
SELECT * FROM OrderLineItem
WHERE OrderId = @OrderId
END TRY

BEGIN CATCH
ROLLBACK TRAN OrderLineItem_GetList
END CATCH
GO

CREATE PROCEDURE OrderLineItem_GetInfo
@OrderLineItemID int
AS
BEGIN TRY
SELECT * FROM OrderLineItem
WHERE OrderLineItemID = @OrderLineItemID
END TRY

BEGIN CATCH
ROLLBACK TRAN OrderLineItem_GetInfo
END CATCH

Go

CREATE PROCEDURE OrderLineItem_Save
@OrderLineItemID int = NULL,
@OrderId int ,
@LineItemID int,
@IsDelete Bit

AS
BEGIN TRY
BEGIN TRAN

MERGE ORderLineItem AS TARGET
USING (SELECT @OrderLineItemID AS OrderLineItemID, @OrderId AS OrderId, @LineItemID AS LineItemID) AS SOURCE 
ON TARGET.OrderLineItemID = SOURCE.OrderLineItemID
WHEN MATCHED AND @IsDelete = 1 
	THEN DELETE 
WHEN MATCHED AND @IsDelete = 0
	THEN UPDATE SET TARGET.OrderId = SOURCE.OrderId, TARGET.LineItemID = SOURCE.LineItemID
WHEN NOT MATCHED AND @IsDelete = 0  
	THEN INSERT (
		OrderId,
		LineItemID
		)
	VALUES (
		SOURCE.OrderId,
		SOURCE.LineItemID
		);

	COMMIT
END TRY

BEGIN CATCH
	ROLLBACK
END CATCH
GO