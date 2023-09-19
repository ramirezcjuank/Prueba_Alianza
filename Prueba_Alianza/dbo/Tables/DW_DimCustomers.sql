CREATE TABLE [dbo].[DW_DimCustomers] (
    [CustomerKey] INT            IDENTITY (1, 1) NOT NULL,
    [CustomerID]  INT            NOT NULL,
    [FullName]    NVARCHAR (200) NOT NULL,
    [CompanyName] NVARCHAR (200) NOT NULL,
    [StarDate]    DATETIME       NULL,
    [EndDate]     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
);

