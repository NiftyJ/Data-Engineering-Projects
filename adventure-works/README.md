# Adventure Works — Dimensional Warehouse & BI Model

An end-to-end BI build on Microsoft's **AdventureWorks** sample database: OLTP source data is
reshaped into a Kimball-style star schema (`AdventureWorksDW_Custom`), modelled as an Analysis
Services tabular model, and reported on in Power BI.

```
AdventureWorks (OLTP)  ──►  AdventureWorksDW_Custom (star schema, SQL Server)
                                       │
                                       ├──►  Tabular model (SSAS / Model.bim)
                                       └──►  Power BI report (.pbix)
```

## What's in here

| Path | Description |
| --- | --- |
| `sql/01_create_warehouse_tables.sql` | DDL for the full warehouse — 8 dimensions and 4 fact tables, with primary keys. |
| `sql/02_add_foreign_keys.sql` | Idempotent foreign key constraints (guarded by `OBJECT_ID(...) IS NULL`) so the star schema renders correctly in SSMS database diagrams. |
| `sql/03_rebuild_and_validate_foreign_keys.sql` | Drops and rebuilds all 20 FKs from scratch, then validates: total FK count, per-table breakdown, and orphan-row checks against the dimensions. |
| `sql/source-extracts/` | Exploratory `SELECT` queries against the OLTP source used to shape each dimension (date, product, reseller, territory). |
| `tabular-model/` | Visual Studio SSAS tabular project (`Model.bim`, compatibility level 1200) — 12 tables, 14 relationships, DAX measures. |
| `adventure-works.pbix` | Power BI report built over the model. |

## The star schema

**Dimensions** — `DimCustomer`, `DimDate`, `DimEmployee`, `DimLocation`, `DimProduct`,
`DimSalesTerritory`, `DimShipMethod`, `DimVendor`

**Facts**

| Fact table | Grain | Conformed dimensions |
| --- | --- | --- |
| `FactSalesOrder` | One row per sales order header | Customer, SalesTerritory, Employee (salesperson), Date (order / due / ship) |
| `FactSalesDetail` | One row per sales order line | Product, Customer, SalesTerritory, Date (order) |
| `FactPurchaseOrderDetail` | One row per purchase order line | Product, Vendor, Employee, ShipMethod, Date (order / ship) |
| `FactManufacturingCost` | One row per work order | Product, Location, Date (scheduled start / actual start) |

`DimDate` is a role-playing dimension — order, due, ship, scheduled-start and actual-start dates
all reference `DimDate.DateKey`, which is a `YYYYMMDD` integer surrogate key.

## Measures

Defined on `FactSalesDetail`:

```dax
Total Sales    = SUM(FactSalesDetail[LineTotal])
Total Orders   = DISTINCTCOUNT(FactSalesDetail[SalesOrderNumber])
Avg Unit Price = AVERAGE(FactSalesDetail[UnitPrice])
```

## Running it

1. **Create the warehouse.** In SSMS, create a database named `AdventureWorksDW_Custom`, then run
   `sql/01_create_warehouse_tables.sql`.
2. **Load the tables.** Populate the dimensions and facts from an AdventureWorks OLTP database —
   `sql/source-extracts/` contains the shaping queries for the dimension sources.
3. **Add the constraints.** Run `sql/02_add_foreign_keys.sql`, or
   `sql/03_rebuild_and_validate_foreign_keys.sql` for a clean rebuild plus the orphan checks.
4. **Open the model.** `tabular-model/AdventureWorks2026-1.sln` in Visual Studio with the Analysis
   Services projects extension; point the data source at your `AdventureWorksDW_Custom` instance
   and deploy.
5. **Open the report.** `adventure-works.pbix` in Power BI Desktop.

> Note: `01_create_warehouse_tables.sql` and `03_rebuild_and_validate_foreign_keys.sql` target
> `AdventureWorksDW_Custom`; `02_add_foreign_keys.sql` opens with `USE AdventureWorks2025` — adjust
> the `USE` statement to whichever database holds your warehouse tables.

## Tooling

SQL Server · SSMS · Visual Studio (Analysis Services tabular projects) · Power BI Desktop · DAX
