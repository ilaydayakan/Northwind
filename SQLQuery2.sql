--T�m m��terilerin toplam harcamas�
SELECT c.CustomerID, c.CompanyName, SUM(od.UnitPrice * od.Quantity) AS TotalSpending
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalSpending DESC;

--En �ok satan �r�nler
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantitySold
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantitySold DESC;

--Her �al��an�n i�leme ald��� toplam sipari� say�s� ve toplam sat�� tutar�
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

--Tedarik�iler taraf�ndan al�nan ve ard�ndan m��teri taraf�ndan en �ok sat�lan �r�nler
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
