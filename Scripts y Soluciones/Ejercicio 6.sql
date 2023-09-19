USE [STA_AdventureWorksLT2012]
GO

INSERT INTO [dbo].[StaCustomers]
           ([CustomerID]
		   ,[Fullname]
           ,[CompanyName])
     SELECT [CustomerID],
			[FirstName]+' '+[LastName],
			[CompanyName]
	FROM [AdventureWorksLT2012].[SalesLT].[Customer]
GO

SELECT * FROM [dbo].[StaCustomers] 
