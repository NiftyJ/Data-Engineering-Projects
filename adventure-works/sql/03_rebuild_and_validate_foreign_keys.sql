USE AdventureWorksDW_Custom;
GO

-- Drop existing FKs first (idempotent — none exist now, but safe)
DECLARE @sql NVARCHAR(MAX) = N'';
SELECT @sql += N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) 
    + N'.' + QUOTENAME(OBJECT_NAME(parent_object_id)) 
    + N' DROP CONSTRAINT ' + QUOTENAME(name) + N';' + CHAR(10)
FROM sys.foreign_keys;
IF LEN(@sql) > 0 EXEC sp_executesql @sql;

-- FactPurchaseOrderDetail
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FPOD_Product FOREIGN KEY (ProductKey) REFERENCES dbo.DimProduct(ProductKey);
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FPOD_Vendor FOREIGN KEY (VendorKey) REFERENCES dbo.DimVendor(VendorKey);
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FPOD_Employee FOREIGN KEY (EmployeeKey) REFERENCES dbo.DimEmployee(EmployeeKey);
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FPOD_ShipMethod FOREIGN KEY (ShipMethodKey) REFERENCES dbo.DimShipMethod(ShipMethodKey);
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FPOD_OrderDate FOREIGN KEY (OrderDateKey) REFERENCES dbo.DimDate(DateKey);
ALTER TABLE dbo.FactPurchaseOrderDetail ADD CONSTRAINT FK_FPOD_ShipDate FOREIGN KEY (ShipDateKey) REFERENCES dbo.DimDate(DateKey);

-- FactManufacturingCost
ALTER TABLE dbo.FactManufacturingCost ADD CONSTRAINT FK_FMC_Product FOREIGN KEY (ProductKey) REFERENCES dbo.DimProduct(ProductKey);
ALTER TABLE dbo.FactManufacturingCost ADD CONSTRAINT FK_FMC_Location FOREIGN KEY (LocationKey) REFERENCES dbo.DimLocation(LocationKey);
ALTER TABLE dbo.FactManufacturingCost ADD CONSTRAINT FK_FMC_SchedStartDate FOREIGN KEY (ScheduledStartDateKey) REFERENCES dbo.DimDate(DateKey);
ALTER TABLE dbo.FactManufacturingCost ADD CONSTRAINT FK_FMC_ActualStartDate FOREIGN KEY (ActualStartDateKey) REFERENCES dbo.DimDate(DateKey);

-- FactSalesDetail
ALTER TABLE dbo.FactSalesDetail ADD CONSTRAINT FK_FSD_Product FOREIGN KEY (ProductKey) REFERENCES dbo.DimProduct(ProductKey);
ALTER TABLE dbo.FactSalesDetail ADD CONSTRAINT FK_FSD_Customer FOREIGN KEY (CustomerKey) REFERENCES dbo.DimCustomer(CustomerKey);
ALTER TABLE dbo.FactSalesDetail ADD CONSTRAINT FK_FSD_Territory FOREIGN KEY (SalesTerritoryKey) REFERENCES dbo.DimSalesTerritory(SalesTerritoryKey);
ALTER TABLE dbo.FactSalesDetail ADD CONSTRAINT FK_FSD_OrderDate FOREIGN KEY (OrderDateKey) REFERENCES dbo.DimDate(DateKey);

-- FactSalesOrder
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FSO_Customer FOREIGN KEY (CustomerKey) REFERENCES dbo.DimCustomer(CustomerKey);
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FSO_Territory FOREIGN KEY (SalesTerritoryKey) REFERENCES dbo.DimSalesTerritory(SalesTerritoryKey);
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FSO_OrderDate FOREIGN KEY (OrderDateKey) REFERENCES dbo.DimDate(DateKey);
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FSO_DueDate FOREIGN KEY (DueDateKey) REFERENCES dbo.DimDate(DateKey);
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FSO_ShipDate FOREIGN KEY (ShipDateKey) REFERENCES dbo.DimDate(DateKey);
ALTER TABLE dbo.FactSalesOrder ADD CONSTRAINT FK_FSO_SalesPerson FOREIGN KEY (SalesPersonKey) REFERENCES dbo.DimEmployee(EmployeeKey);

-- Confirm: should be 20
SELECT COUNT(*) AS total_fks FROM sys.foreign_keys;

USE AdventureWorksDW_Custom;

-- Total FK count (should be 20)
SELECT COUNT(*) AS total_fks FROM sys.foreign_keys;

-- Per-table breakdown
SELECT OBJECT_NAME(parent_object_id) AS fact_table, COUNT(*) AS fk_count
FROM sys.foreign_keys 
GROUP BY OBJECT_NAME(parent_object_id) 
ORDER BY fact_table;

-- Orphan re-check (should both be 0)
SELECT 'FSD orphans' AS chk, COUNT(*) AS n 
FROM dbo.FactSalesDetail f LEFT JOIN dbo.DimCustomer d ON d.CustomerKey=f.CustomerKey 
WHERE d.CustomerKey IS NULL
UNION ALL 
SELECT 'FSO orphans', COUNT(*) 
FROM dbo.FactSalesOrder f LEFT JOIN dbo.DimCustomer d ON d.CustomerKey=f.CustomerKey 
WHERE d.CustomerKey IS NULL;