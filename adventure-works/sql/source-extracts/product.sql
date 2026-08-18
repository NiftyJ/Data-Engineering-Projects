SELECT TOP 10
    p.ProductID,
    p.Name AS ProductName,
    p.Color,
    p.ListPrice,
    ps.Name AS SubcategoryName,
    pc.Name AS CategoryName
FROM Production.Product p
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID