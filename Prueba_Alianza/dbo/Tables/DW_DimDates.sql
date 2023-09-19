CREATE TABLE [dbo].[DW_DimDates] (
    [CalendarDateKey]         INT           NOT NULL,
    [CalendarDateName]        NVARCHAR (50) NOT NULL,
    [CalendarYearMonthKey]    INT           NOT NULL,
    [CalendarYearMonthName]   NVARCHAR (50) NOT NULL,
    [CalendarYearQuarterKey]  INT           NOT NULL,
    [CalendarYearQuarterName] NVARCHAR (50) NOT NULL,
    [CalendarYearKey]         INT           NOT NULL,
    [CalendarYearName]        NVARCHAR (50) NOT NULL,
    [CalendarDate]            DATE          NOT NULL,
    [FiscalDate]              DATE          NOT NULL
);

