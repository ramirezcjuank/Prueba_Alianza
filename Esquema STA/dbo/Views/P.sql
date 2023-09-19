CREATE VIEW P AS
	
	SELECT p.[ProductID]
      ,p.[Name]
      ,p.[ProductNumber]
	  ,p.[Color]
      ,p.[StandardCost]
      ,p.[ListPrice]
      ,p.[Size]
      ,p.[Weight]
      ,p.[ProductCategoryID]
	FROM [AdventureWorksLT2012].[SalesLT].[ProductCategory] AS c
	  INNER JOIN [AdventureWorksLT2012].[SalesLT].[Product] AS p
			ON p.ProductCategoryID = c.ProductCategoryID;
