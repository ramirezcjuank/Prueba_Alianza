-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL

CREATE PROCEDURE ETL_StaFactSales
AS
BEGIN
    BEGIN TRY
        
        BEGIN TRANSACTION;

     
        INSERT INTO [STA_AdventureWorksLT2012].[dbo].[StaFactSales] 
		([SalesOrderID]
		  ,[SalesOrderDetailID]
		  ,[OrderQty]
		  ,[ProductKey]
		  ,[UnitPrice]
		  ,[UnitPriceDiscount]
		  ,[OrderDateKey]
		  ,[ShipDateKey]
		  ,[CustomerKey]
		  ,[ModifiedDate])
        SELECT sd.[SalesOrderID]
		  ,sd.[SalesOrderDetailID]
		  ,sd.[OrderQty]
		  ,sd.[ProductID]
		  ,sd.[UnitPrice]
		  ,sd.[UnitPriceDiscount]
		  ,sh.[OrderDate]
		  ,sh.[ShipDate]
		  ,sh.[CustomerID]
		  ,sd.[ModifiedDate]
        FROM [AdventureWorksLT2012].[SalesLT].[SalesOrderHeader] as sh
		INNER JOIN [AdventureWorksLT2012].SalesLT.SalesOrderDetail AS sd
		ON sd.SalesOrderID = sh.SalesOrderID;

        -- Actualización o inserción de registros modificados o nuevos
        UPDATE dd
        SET dd.[SalesOrderID] = sd.[SalesOrderID],
			dd.[SalesOrderDetailID] = sd.[SalesOrderDetailID],
			dd.[OrderQty] = sd.[OrderQty],
			dd.[ProductKey] = sd.[ProductID],
			dd.[UnitPrice] = sd.[UnitPrice],
			dd.[UnitPriceDiscount] = sd.[UnitPriceDiscount],
			dd.[OrderDateKey] = sh.[OrderDate],
			dd.[ShipDateKey] = sh.[ShipDate],
			dd.[CustomerKey] = sh.[CustomerID],
			dd.[ModifiedDate] = sd.[ModifiedDate]
        FROM [STA_AdventureWorksLT2012].[dbo].[StaFactSales] dd
        INNER JOIN [AdventureWorksLT2012].[SalesLT].[SalesOrderHeader] sh ON dd.SalesOrderDetailID = sh.SalesOrderID
		INNER JOIN [AdventureWorksLT2012].SalesLT.SalesOrderDetail sd ON dd.SalesOrderDetailID = sd.SalesOrderID
        WHERE dd.ModifiedDate < sd.ModifiedDate;

        INSERT INTO [STA_AdventureWorksLT2012].[dbo].[StaFactSales] 
		([SalesOrderID]
		  ,[SalesOrderDetailID]
		  ,[OrderQty]
		  ,[ProductKey]
		  ,[UnitPrice]
		  ,[UnitPriceDiscount]
		  ,[OrderDateKey]
		  ,[ShipDateKey]
		  ,[CustomerKey]
		  ,[ModifiedDate])
       SELECT sd.[SalesOrderID]
		  ,sd.[SalesOrderDetailID]
		  ,sd.[OrderQty]
		  ,sd.[ProductID]
		  ,sd.[UnitPrice]
		  ,sd.[UnitPriceDiscount]
		  ,sh.[OrderDate]
		  ,sh.[ShipDate]
		  ,sh.[CustomerID]
		  ,sd.[ModifiedDate]
        FROM [AdventureWorksLT2012].[SalesLT].[SalesOrderHeader] AS sh
		INNER JOIN [AdventureWorksLT2012].SalesLT.SalesOrderDetail AS sd
		ON sd.SalesOrderID = sh.SalesOrderID
		LEFT JOIN [STA_AdventureWorksLT2012].[dbo].[StaFactSales] dd ON sh.SalesOrderID = dd.SalesOrderDetailID 
		AND sd.SalesOrderID = dd.SalesOrderDetailID
		WHERE dd.SalesOrderID IS NULL;

        COMMIT;
    END TRY
    BEGIN CATCH

        ROLLBACK;

    
        RAISERROR('ERROR', 16, 1);
    END CATCH;
END;

GO

EXEC ETL_StaFactSales