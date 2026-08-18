USE AdventureWorksDW_Custom;
GO

/****** Object:  Table [dbo].[DimCustomer]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerAlternateKey] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[City] [nvarchar](30) NULL,
	[StateProvince] [nvarchar](50) NULL,
	[CountryRegion] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [date] NULL,
	[DayOfWeek#] [tinyint] NULL,
	[DayName] [nvarchar](10) NULL,
	[DayOfMonth] [tinyint] NULL,
	[DayOfYear] [smallint] NULL,
	[WeekOfYear] [tinyint] NULL,
	[MonthNum] [tinyint] NULL,
	[MonthName] [nvarchar](10) NULL,
	[Quarter] [tinyint] NULL,
	[CalendarYear] [smallint] NULL,
	[IsWeekend] [bit] NULL,
	[IsHoliday] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEmployee]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployee](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeAlternateKey] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[LocationKey] [int] IDENTITY(1,1) NOT NULL,
	[LocationAlternateKey] [smallint] NOT NULL,
	[LocationName] [nvarchar](50) NOT NULL,
	[CostRate] [money] NOT NULL,
	[Availability] [decimal](8, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductAlternateKey] [int] NULL,
	[EnglishProductName] [nvarchar](50) NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Color] [nvarchar](15) NULL,
	[Size] [nvarchar](5) NULL,
	[Weight] [decimal](8, 2) NULL,
	[SubcategoryName] [nvarchar](50) NULL,
	[CategoryName] [nvarchar](50) NULL,
	[ModelName] [nvarchar](50) NULL,
	[SellStartDate] [date] NULL,
	[SellEndDate] [date] NULL,
	[Status] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSalesTerritory]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSalesTerritory](
	[SalesTerritoryKey] [int] IDENTITY(1,1) NOT NULL,
	[SalesTerritoryAlternateKey] [int] NULL,
	[SalesTerritoryRegion] [nvarchar](50) NULL,
	[SalesTerritoryCountry] [nvarchar](50) NULL,
	[SalesTerritoryGroup] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesTerritoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimShipMethod]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimShipMethod](
	[ShipMethodKey] [int] IDENTITY(1,1) NOT NULL,
	[ShipMethodAlternateKey] [int] NOT NULL,
	[ShipMethodName] [nvarchar](50) NOT NULL,
	[ShipBase] [money] NOT NULL,
	[ShipRate] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipMethodKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimVendor]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVendor](
	[VendorKey] [int] IDENTITY(1,1) NOT NULL,
	[VendorAlternateKey] [int] NULL,
	[VendorName] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](15) NULL,
	[CreditRating] [tinyint] NULL,
	[PreferredVendorStatus] [bit] NULL,
	[ActiveFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactManufacturingCost]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactManufacturingCost](
	[ProductKey] [int] NOT NULL,
	[LocationKey] [int] NOT NULL,
	[ScheduledStartDateKey] [int] NOT NULL,
	[ActualStartDateKey] [int] NULL,
	[WorkOrderID] [int] NOT NULL,
	[OperationSequence] [smallint] NOT NULL,
	[PlannedCost] [money] NOT NULL,
	[ActualCost] [money] NULL,
	[CostVariance] [money] NULL,
	[ActualResourceHrs] [decimal](9, 4) NULL,
	[ScheduleDaysLag] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactPurchaseOrderDetail]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPurchaseOrderDetail](
	[ProductKey] [int] NOT NULL,
	[VendorKey] [int] NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[ShipMethodKey] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[ShipDateKey] [int] NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[OrderQty] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[LineTotal] [money] NOT NULL,
	[ReceivedQty] [decimal](8, 2) NOT NULL,
	[RejectedQty] [decimal](8, 2) NOT NULL,
	[StockedQty] [decimal](8, 2) NOT NULL,
	[RejectionRate] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSalesDetail]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSalesDetail](
	[ProductKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[SalesTerritoryKey] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[SalesOrderNumber] [nvarchar](25) NOT NULL,
	[SalesOrderDetailID] [int] NOT NULL,
	[OnlineOrderFlag] [bit] NOT NULL,
	[OrderQty] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitPriceDiscount] [money] NOT NULL,
	[LineTotal] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSalesOrder]    Script Date: 5/19/2026 7:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSalesOrder](
	[CustomerKey] [int] NOT NULL,
	[SalesTerritoryKey] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[DueDateKey] [int] NOT NULL,
	[ShipDateKey] [int] NOT NULL,
	[SalesPersonKey] [int] NULL,
	[SalesOrderNumber] [nvarchar](25) NOT NULL,
	[OnlineOrderFlag] [bit] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[TotalDue] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CCI_FactPurchaseOrderDetail]    Script Date: 5/19/2026 7:02:35 PM ******/
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_FactPurchaseOrderDetail] ON [dbo].[FactPurchaseOrderDetail] WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
SELECT
    t.name AS TableName,
    CASE WHEN t.name LIKE 'Dim%' THEN 'Dimension' ELSE 'Fact' END AS TableType,
    (SELECT COUNT(*) FROM sys.columns WHERE object_id = t.object_id) AS ColumnCount
FROM sys.tables t
WHERE t.name LIKE 'Dim%' OR t.name LIKE 'Fact%'
ORDER BY TableType, TableName;

