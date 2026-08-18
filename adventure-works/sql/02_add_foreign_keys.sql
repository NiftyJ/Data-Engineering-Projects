USE AdventureWorks2025;
GO

-- ==============================================================================
-- Add Foreign Key Constraints to Fact Tables (Idempotent)
-- Purpose: Enables automatic relationship lines in SSMS Database Diagrams
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- FactSalesOrder Constraints
-- ------------------------------------------------------------------------------
IF OBJECT_ID('FK_FactSalesOrder_DimCustomer', 'F') IS NULL
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FactSalesOrder_DimCustomer FOREIGN KEY (CustomerKey) REFERENCES dbo.DimCustomer (CustomerKey);

IF OBJECT_ID('FK_FactSalesOrder_DimSalesTerritory', 'F') IS NULL
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FactSalesOrder_DimSalesTerritory FOREIGN KEY (SalesTerritoryKey) REFERENCES dbo.DimSalesTerritory (SalesTerritoryKey);

IF OBJECT_ID('FK_FactSalesOrder_DimEmployee', 'F') IS NULL
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FactSalesOrder_DimEmployee FOREIGN KEY (SalesPersonKey) REFERENCES dbo.DimEmployee (EmployeeKey);

IF OBJECT_ID('FK_FactSalesOrder_DimDate_OrderDate', 'F') IS NULL
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FactSalesOrder_DimDate_OrderDate FOREIGN KEY (OrderDateKey) REFERENCES dbo.DimDate (DateKey);

IF OBJECT_ID('FK_FactSalesOrder_DimDate_DueDate', 'F') IS NULL
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FactSalesOrder_DimDate_DueDate FOREIGN KEY (DueDateKey) REFERENCES dbo.DimDate (DateKey);

IF OBJECT_ID('FK_FactSalesOrder_DimDate_ShipDate', 'F') IS NULL
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FactSalesOrder_DimDate_ShipDate FOREIGN KEY (ShipDateKey) REFERENCES dbo.DimDate (DateKey);
GO

-- ------------------------------------------------------------------------------
-- FactSalesDetail Constraints
-- ------------------------------------------------------------------------------
IF OBJECT_ID('FK_FactSalesDetail_DimProduct', 'F') IS NULL
ALTER TABLE dbo.FactSalesDetail ADD CONSTRAINT FK_FactSalesDetail_DimProduct FOREIGN KEY (ProductKey) REFERENCES dbo.DimProduct (ProductKey);

IF OBJECT_ID('FK_FactSalesDetail_DimCustomer', 'F') IS NULL
ALTER TABLE dbo.FactSalesDetail ADD CONSTRAINT FK_FactSalesDetail_DimCustomer FOREIGN KEY (CustomerKey) REFERENCES dbo.DimCustomer (CustomerKey);

IF OBJECT_ID('FK_FactSalesDetail_DimSalesTerritory', 'F') IS NULL
ALTER TABLE dbo.FactSalesDetail ADD CONSTRAINT FK_FactSalesDetail_DimSalesTerritory FOREIGN KEY (SalesTerritoryKey) REFERENCES dbo.DimSalesTerritory (SalesTerritoryKey);

IF OBJECT_ID('FK_FactSalesDetail_DimDate_OrderDate', 'F') IS NULL
ALTER TABLE dbo.FactSalesDetail ADD CONSTRAINT FK_FactSalesDetail_DimDate_OrderDate FOREIGN KEY (OrderDateKey) REFERENCES dbo.DimDate (DateKey);
GO

-- ------------------------------------------------------------------------------
-- FactManufacturingCost Constraints
-- ------------------------------------------------------------------------------
IF OBJECT_ID('FK_FactManufacturingCost_DimProduct', 'F') IS NULL
ALTER TABLE dbo.FactManufacturingCost ADD CONSTRAINT FK_FactManufacturingCost_DimProduct FOREIGN KEY (ProductKey) REFERENCES dbo.DimProduct (ProductKey);

IF OBJECT_ID('FK_FactManufacturingCost_DimLocation', 'F') IS NULL
ALTER TABLE dbo.FactManufacturingCost ADD CONSTRAINT FK_FactManufacturingCost_DimLocation FOREIGN KEY (LocationKey) REFERENCES dbo.DimLocation (LocationKey);

IF OBJECT_ID('FK_FactManufacturingCost_DimDate_ScheduledStart', 'F') IS NULL
ALTER TABLE dbo.FactManufacturingCost ADD CONSTRAINT FK_FactManufacturingCost_DimDate_ScheduledStart FOREIGN KEY (ScheduledStartDateKey) REFERENCES dbo.DimDate (DateKey);

IF OBJECT_ID('FK_FactManufacturingCost_DimDate_ActualStart', 'F') IS NULL
ALTER TABLE dbo.FactManufacturingCost ADD CONSTRAINT FK_FactManufacturingCost_DimDate_ActualStart FOREIGN KEY (ActualStartDateKey) REFERENCES dbo.DimDate (DateKey);
GO

-- ------------------------------------------------------------------------------
-- FactPurchaseOrderDetail Constraints
-- ------------------------------------------------------------------------------
IF OBJECT_ID('FK_FactPurchaseOrderDetail_DimProduct', 'F') IS NULL
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FactPurchaseOrderDetail_DimProduct FOREIGN KEY (ProductKey) REFERENCES dbo.DimProduct (ProductKey);

IF OBJECT_ID('FK_FactPurchaseOrderDetail_DimVendor', 'F') IS NULL
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FactPurchaseOrderDetail_DimVendor FOREIGN KEY (VendorKey) REFERENCES dbo.DimVendor (VendorKey);

IF OBJECT_ID('FK_FactPurchaseOrderDetail_DimEmployee', 'F') IS NULL
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FactPurchaseOrderDetail_DimEmployee FOREIGN KEY (EmployeeKey) REFERENCES dbo.DimEmployee (EmployeeKey);

IF OBJECT_ID('FK_FactPurchaseOrderDetail_DimShipMethod', 'F') IS NULL
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FactPurchaseOrderDetail_DimShipMethod FOREIGN KEY (ShipMethodKey) REFERENCES dbo.DimShipMethod (ShipMethodKey);

IF OBJECT_ID('FK_FactPurchaseOrderDetail_DimDate_OrderDate', 'F') IS NULL
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FactPurchaseOrderDetail_DimDate_OrderDate FOREIGN KEY (OrderDateKey) REFERENCES dbo.DimDate (DateKey);

IF OBJECT_ID('FK_FactPurchaseOrderDetail_DimDate_ShipDate', 'F') IS NULL
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FactPurchaseOrderDetail_DimDate_ShipDate FOREIGN KEY (ShipDateKey) REFERENCES dbo.DimDate (DateKey);
GO
