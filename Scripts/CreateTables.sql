
CREATE DATABASE LuresGalore;
GO

USE LuresGalore;
GO

IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL
    DROP TABLE Product

CREATE TABLE Product
(
ProductId INT IDENTITY(1,1) PRIMARY KEY,
 Name VARCHAR(100),
[Description] VARCHAR(255),
PriceId INT NOT NULL,
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL
)


IF OBJECT_ID('dbo."User"', 'U') IS NOT NULL
    DROP TABLE "User"
CREATE TABLE "User"
(
UserID INT NOT NULL PRIMARY KEY, 
Username VARCHAR(100),
Email VARCHAR(100),
Password VARCHAR(50),
RoleID INT,
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL

)

IF OBJECT_ID('dbo.ShoppingCart', 'U') IS NOT NULL
    DROP TABLE ShoppingCart


CREATE TABLE ShoppingCart
(
ShoppingCartID INT NOT NULL PRIMARY KEY,
UserId INT,
Subtotal decimal,
Tax decimal,
Total decimal,
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL

)

IF OBJECT_ID('dbo."Order"', 'U') IS NOT NULL
    DROP TABLE "Order"


CREATE TABLE "Order"
(
OrderID INT NOT NULL PRIMARY KEY,
UserId INT,
Subtotal decimal, 
Tax decimal,
Total decimal,
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL

)

IF OBJECT_ID('dbo.ProductCategory', 'U') IS NOT NULL
    DROP TABLE ProductCategory


CREATE TABLE ProductCategory
(
ProductCategoryId INT NOT NULL PRIMARY KEY,
ProductId INT,
CategoryId INT,
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL

)

IF OBJECT_ID('dbo.Role', 'U') IS NOT NULL
    DROP TABLE Role


CREATE TABLE Role
(
RoleId INT NOT NULL PRIMARY KEY,
Name varchar(100),
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL

)

IF OBJECT_ID('dbo.ShoppingCartLineItem', 'U') IS NOT NULL
    DROP TABLE ShoppingCartLineItem


CREATE TABLE ShoppingCartLineItem
(
ShoppingCartLineItemId INT NOT NULL PRIMARY KEY,
ShoppingCartID INT,
LineItemID INT,
IsWishList bit,
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL

)

IF OBJECT_ID('dbo.OrderLineItem', 'U') IS NOT NULL
    DROP TABLE OrderLineItem

CREATE TABLE OrderLineItem
(
OrderLineItemID INT NOT NULL PRIMARY KEY,
OrderId INT,
LineItemID INT,
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL

)

IF OBJECT_ID('dbo.Category', 'U') IS NOT NULL
    DROP TABLE Category


CREATE TABLE Category
(
CategoryId INT NOT NULL PRIMARY KEY,
Name VARCHAR(100),
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL

)

IF OBJECT_ID('dbo.LineItem', 'U') IS NOT NULL
    DROP TABLE LineItem


CREATE TABLE LineItem
(
LineItemId INT NOT NULL PRIMARY KEY,
ProductID INT,
ProductName VARCHAR(100),
ProductDescription VARCHAR(255),
Price decimal,
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL

)


IF OBJECT_ID('dbo.Price', 'U') IS NOT NULL
    DROP TABLE Price

CREATE TABLE Price
(
PriceId INT NOT NULL PRIMARY KEY,
Amount decimal,
CreatedDate DATETIME NOT NULL,
UpdatedDate DATETIME NOT NULL

)
Go
