CREATE TABLE [dbo].[StaCustomers] (
    [CustomerKey] INT            IDENTITY (1, 1) NOT NULL,
    [CustomerID]  INT            NOT NULL,
    [Fullname]    NVARCHAR (200) NOT NULL,
    [CompanyName] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_StaCustomers] PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
);

