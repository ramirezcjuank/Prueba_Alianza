CREATE PROCEDURE Insert_DW_FactSales
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [DW_AdventureWorksLT2012].[dbo].[DW_FactSales]
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
        SELECT [SalesOrderID]
           ,[SalesOrderDetailID]
           ,[OrderQty]
           ,[ProductKey]
           ,[UnitPrice]
           ,[UnitPriceDiscount]
           ,[OrderDateKey]
           ,[ShipDateKey]
           ,[CustomerKey]
           ,[ModifiedDate]
        FROM [STA_AdventureWorksLT2012].[dbo].[StaFactSales];

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;

        RAISERROR('ERROR', 16, 1);
    END CATCH;
END
