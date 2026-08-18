SELECT TOP 10
    c.CustomerID AS ResellerID,
    s.Name AS ResellerName,
    c.AccountNumber,
    c.TerritoryID
FROM Sales.Customer c
JOIN Sales.Store s ON c.StoreID = s.BusinessEntityID