USE [Northwind]

----1 列出各產品的供應商名稱
--SELECT ProductID,ProductName,P.SupplierID,CompanyName
--FROM Products P
--INNER JOIN Suppliers S ON S.SupplierID=P.SupplierID

----2 列出各產品的種類名稱
--SELECT ProductID,ProductName,P.CategoryID,C.CategoryName
--FROM Products P
--INNER JOIN Categories C ON C.CategoryID=P.CategoryID

----3 列出各訂單的顧客名字
--SELECT OrderID,O.CustomerID,C.CompanyName
--FROM Orders O
--INNER JOIN Customers C ON C.CustomerID=O.CustomerID

----4 列出各訂單的所負責的物流商名字以及員工名字
--SELECT O.OrderID, O.ShipVia,S.CompanyName,O.EmployeeID,E.LastName +' '+E.FirstName AS EmployeeName
--FROM Orders O
--INNER JOIN Employees E ON E.EmployeeID=O.EmployeeID
--INNER JOIN Shippers S ON S.ShipperID=O.ShipVia

----5 列出1998年的訂單
--SELECT * FROM Orders WHERE YEAR(OrderDate)=1998

----6 各產品，UnitsInStock < UnitsOnOrder 顯示'供不應求'，否則顯示'正常'
--SELECT ProductID,ProductName,UnitsInStock,UnitsOnOrder,
--CASE WHEN UnitsInStock < UnitsOnOrder THEN '供不應求' ELSE '正常' END AS A
--FROM Products

----7 取得訂單日期最新的9筆訂單
--SELECT TOP 9 * FROM Orders
--ORDER BY OrderDate DESC,OrderID DESC

----8 產品單價最便宜的第4~8名
--SELECT* FROM (
--	SELECT TOP 8 * 
--	FROM Products
--	ORDER BY UnitPrice
--	) A
--WHERE ProductID NOT IN (
--	SELECT TOP 4 ProductID
--	FROM Products
--	ORDER BY UnitPrice
--	)
----19, 3, 24, 68, 13, 75, 52, 1

----9 列出每種類別中最高單價的商品
--SELECT ProductID,CategoryID,UnitPrice FROM Products P1
--WHERE UnitPrice =(
--	SELECT MAX(UnitPrice) FROM Products P2
--	WHERE P2.CategoryID=P1.CategoryID
--)
--CategoryID:ProductID
--1:38, 2:5, 3:62

----10 列出每個訂單的總金額
--SELECT OrderID,SUM(Quantity*UnitPrice*(1-Discount)) AS TtotalAmount
--FROM [Order Details] D
--GROUP BY OrderID

----11 列出每個物流商送過的訂單筆數
--SELECT ShipVia,COUNT(*),S.CompanyName FROM Orders O
--INNER JOIN Shippers S ON S.ShipperID=O.ShipVia
--GROUP BY ShipVia,S.CompanyName

----12 列出被下訂次數小於9次的產品
--SELECT ProductID,COUNT(*) AS CountTotal
--FROM [Order Details]
--GROUP BY ProductID
--HAVING COUNT(*)<9

---- (13、14、15請一起寫)
----13 新增物流商(Shippers)：
-- 公司名稱: 青杉人才，電話: (02)66057606
-- 公司名稱: 青群科技，電話: (02)14055374
--INSERT INTO Shippers
--	(CompanyName,Phone) VALUES
--	('青杉人才','(02)66057606'),
--	('青群科技','(02)14055374')

----14 方才新增的兩筆資料，電話都改成(02)66057606，公司名稱結尾加'有限公司'
--UPDATE Shippers SET Phone='(02)66057606', CompanyName=CompanyName+'有限公司'
--WHERE ShipperID IN (1013,1014)

----15 刪除剛才兩筆資料
--DELETE FROM Shippers 
--WHERE ShipperID IN (1013,1014)

