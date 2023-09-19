CREATE TABLE [dbo].[DW_FactSales] (
    [SalesOrderID]       INT      NOT NULL,
    [SalesOrderDetailID] INT      NOT NULL,
    [OrderQty]           SMALLINT NOT NULL,
    [ProductKey]         INT      NOT NULL,
    [UnitPrice]          MONEY    NOT NULL,
    [UnitPriceDiscount]  MONEY    NOT NULL,
    [OrderDateKey]       DATETIME NOT NULL,
    [ShipDateKey]        DATETIME NOT NULL,
    [CustomerKey]        INT      NOT NULL,
    [ModifiedDate]       DATETIME NOT NULL
);

