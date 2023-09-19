CREATE TABLE [dbo].[DW_DimAddresses] (
    [AddressKey]    INT              NOT NULL,
    [AddressID]     INT              NOT NULL,
    [AddressLine1]  NVARCHAR (60)    NOT NULL,
    [AddressLine2]  NVARCHAR (60)    NULL,
    [City]          NVARCHAR (50)    NOT NULL,
    [StateProvince] NVARCHAR (50)    NOT NULL,
    [CountryRegion] NVARCHAR (50)    NOT NULL,
    [PostalCode]    NVARCHAR (15)    NOT NULL,
    [RowGuid]       UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]  DATETIME         NOT NULL,
    CONSTRAINT [PK_DW_DimAddresses] PRIMARY KEY CLUSTERED ([AddressID] ASC)
);

