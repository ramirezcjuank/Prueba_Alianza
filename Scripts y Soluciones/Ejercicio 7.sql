USE [STA_AdventureWorksLT2012]
GO
DROP view IF EXISTS Product

CREATE VIEW Product AS
	
	SELECT p.[ProductID]
      ,p.[Name]
      ,p.[ProductNumber]
	  ,p.[Color] 
      ,p.[StandardCost]
      ,p.[ListPrice]
      ,p.[Size]
      ,p.[Weight]
      ,p.[ProductCategoryID]
	  ,c.[Name] AS ProductCategoryName
	FROM [AdventureWorksLT2012].[SalesLT].[ProductCategory] AS c
	  INNER JOIN [AdventureWorksLT2012].[SalesLT].[Product] AS p
			ON p.ProductCategoryID = c.ProductCategoryID
			WHERE p.[Color] IS NOT NULL AND p.[Size] IS NOT NULL;
GO

Select * From Product
	
	INSERT INTO [dbo].[StaProducts]
           ([ProductID]
           ,[ProductName]
           ,[ProductNumber]
           ,[ProductColor]
           ,[ProductStandardCost]
           ,[ProductListPrice]
           ,[ProductSize]
           ,[ProductWeight]
           ,[ProductCategoryID]
           ,[ProductCategoryName])
	SELECT [ProductID]
           ,[Name]
           ,[ProductNumber]
           ,[Color]
           ,[StandardCost]
           ,[ListPrice]
           ,[Size]
           ,[Weight]
           ,[ProductCategoryID]
           ,[ProductCategoryName]
	From Product