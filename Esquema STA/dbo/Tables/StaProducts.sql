CREATE TABLE [dbo].[StaProducts] (
    [ProductKey]          INT            IDENTITY (1, 1) NOT NULL,
    [ProductID]           INT            NOT NULL,
    [ProductName]         NVARCHAR (50)  NOT NULL,
    [ProductNumber]       NVARCHAR (50)  NOT NULL,
    [ProductColor]        NVARCHAR (50)  NOT NULL,
    [ProductStandardCost] MONEY          NOT NULL,
    [ProductListPrice]    MONEY          NOT NULL,
    [ProductSize]         NVARCHAR (5)   NOT NULL,
    [ProductWeight]       DECIMAL (8, 2) NULL,
    [ProductCategoryID]   INT            NOT NULL,
    [ProductCategoryName] NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_StaProducts] PRIMARY KEY CLUSTERED ([ProductKey] ASC, [ProductID] ASC, [ProductCategoryID] ASC)
);

