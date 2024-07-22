--Tüm müþterilerin toplam harcamasý
SELECT c.CustomerID, c.CompanyName, SUM(od.UnitPrice * od.Quantity) AS TotalSpending
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalSpending DESC;

--En çok satan ürünler
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantitySold
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantitySold DESC;

--Her çalýþanýn iþleme aldýðý toplam sipariþ sayýsý ve toplam satýþ tutarý
SELECT 
    e.EmployeeID, 
    e.LastName + ', ' + e.FirstName AS EmployeeName, 
    COUNT(o.OrderID) AS TotalOrders, 
    SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM 
    Employees e
JOIN 
    Orders o ON e.EmployeeID = o.EmployeeID
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    e.EmployeeID, 
    e.LastName, 
    e.FirstName
ORDER BY 
    TotalSales DESC;

--Tedarikçiler tarafýndan alýnan ve ardýndan müþteri tarafýndan en çok satýlan ürünler
SELECT 
    s.SupplierID,
    s.CompanyName AS SupplierName,
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM 
    Suppliers s
JOIN 
    Products p ON s.SupplierID = p.SupplierID
JOIN 
    [Order Details] od ON p.ProductID = od.ProductID
JOIN 
    Orders o ON od.OrderID = o.OrderID
GROUP BY 
    s.SupplierID, 
    s.CompanyName,
    p.ProductID, 
    p.ProductName
ORDER BY 
    TotalQuantitySold DESC;
