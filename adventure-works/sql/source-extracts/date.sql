SELECT DISTINCT TOP 15
    CONVERT(int, CONVERT(varchar, OrderDate, 112)) AS DateID,
    CONVERT(date, OrderDate) AS OrderDate,
    DAY(OrderDate) AS Day,
    DATENAME(weekday, OrderDate) AS DayOfWeek,
    MONTH(OrderDate) AS Month,
    DATENAME(month, OrderDate) AS MonthName,
    DATEPART(quarter, OrderDate) AS Quarter,
    YEAR(OrderDate) AS Year
FROM Sales.SalesOrderHeader
ORDER BY OrderDate