--Un-comment the following line and run once, then comment out
--CREATE DATABASE LuresGalore

USE LuresGalore
GO

IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL
    DROP TABLE Product

CREATE TABLE Product
(
ProductId INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(100),
[Description] VARCHAR(255),
PriceId INT,
CreatedDate DATETIME,
UpdatedDate DATETIME
)

