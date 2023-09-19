USE [DW_AdventureWorksLT2012]
GO

CREATE TABLE [dbo].[DW_DimCustomers](
	[CustomerKey] [int] PRIMARY KEY IDENTITY (1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[CompanyName] [nvarchar](200) NOT NULL,
	[StarDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 )
GO

MERGE INTO [dbo].[DW_DimCustomers] AS dw
USING [STA_AdventureWorksLT2012].[dbo].[StaCustomers] AS sc
ON dw.[CustomerID] = sc.[CustomerID]
AND dw.[FullName] <> sc.[FullName]
WHEN MATCHED THEN
    UPDATE SET
        dw.[FullName] = sc.[FullName];


MERGE INTO [dbo].[DW_DimCustomers] AS dw
USING [STA_AdventureWorksLT2012].[dbo].[StaCustomers] AS sc
ON dw.[CustomerID] = sc.[CustomerID]
AND dw.[CompanyName] = sc.[CompanyName]
WHEN MATCHED THEN 
    UPDATE SET
		dw.[EndDate] = GETDATE()
WHEN NOT MATCHED THEN
	INSERT ([CustomerID]
           ,[Fullname]
           ,[CompanyName]
		   ,[StarDate]
		   ,[EndDate])
     VALUES
           (sc.[CustomerID]
           ,sc.[Fullname]
           ,sc.[CompanyName]
		   ,GETDATE()
		   ,NULL);
GO


        






