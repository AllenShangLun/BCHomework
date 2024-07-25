USE [Northwind]

----1 �C�X�U���~�������ӦW��
--SELECT ProductID,ProductName,P.SupplierID,CompanyName
--FROM Products P
--INNER JOIN Suppliers S ON S.SupplierID=P.SupplierID

----2 �C�X�U���~�������W��
--SELECT ProductID,ProductName,P.CategoryID,C.CategoryName
--FROM Products P
--INNER JOIN Categories C ON C.CategoryID=P.CategoryID

----3 �C�X�U�q�檺�U�ȦW�r
--SELECT OrderID,O.CustomerID,C.CompanyName
--FROM Orders O
--INNER JOIN Customers C ON C.CustomerID=O.CustomerID

----4 �C�X�U�q�檺�ҭt�d�����y�ӦW�r�H�έ��u�W�r
--SELECT O.OrderID, O.ShipVia,S.CompanyName,O.EmployeeID,E.LastName +' '+E.FirstName AS EmployeeName
--FROM Orders O
--INNER JOIN Employees E ON E.EmployeeID=O.EmployeeID
--INNER JOIN Shippers S ON S.ShipperID=O.ShipVia

----5 �C�X1998�~���q��
--SELECT * FROM Orders WHERE YEAR(OrderDate)=1998

----6 �U���~�AUnitsInStock < UnitsOnOrder ���'�Ѥ����D'�A�_�h���'���`'
--SELECT ProductID,ProductName,UnitsInStock,UnitsOnOrder,
--CASE WHEN UnitsInStock < UnitsOnOrder THEN '�Ѥ����D' ELSE '���`' END AS A
--FROM Products

----7 ���o�q�����̷s��9���q��
--SELECT TOP 9 * FROM Orders
--ORDER BY OrderDate DESC,OrderID DESC

----8 ���~����̫K�y����4~8�W
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

----9 �C�X�C�����O���̰�������ӫ~
--SELECT ProductID,CategoryID,UnitPrice FROM Products P1
--WHERE UnitPrice =(
--	SELECT MAX(UnitPrice) FROM Products P2
--	WHERE P2.CategoryID=P1.CategoryID
--)
--CategoryID:ProductID
--1:38, 2:5, 3:62

----10 �C�X�C�ӭq�檺�`���B
--SELECT OrderID,SUM(Quantity*UnitPrice*(1-Discount)) AS TtotalAmount
--FROM [Order Details] D
--GROUP BY OrderID

----11 �C�X�C�Ӫ��y�Ӱe�L���q�浧��
--SELECT ShipVia,COUNT(*),S.CompanyName FROM Orders O
--INNER JOIN Shippers S ON S.ShipperID=O.ShipVia
--GROUP BY ShipVia,S.CompanyName

----12 �C�X�Q�U�q���Ƥp��9�������~
--SELECT ProductID,COUNT(*) AS CountTotal
--FROM [Order Details]
--GROUP BY ProductID
--HAVING COUNT(*)<9

---- (13�B14�B15�Ф@�_�g)
----13 �s�W���y��(Shippers)�G
-- ���q�W��: �C���H�~�A�q��: (02)66057606
-- ���q�W��: �C�s��ޡA�q��: (02)14055374
--INSERT INTO Shippers
--	(CompanyName,Phone) VALUES
--	('�C���H�~','(02)66057606'),
--	('�C�s���','(02)14055374')

----14 ��~�s�W���ⵧ��ơA�q�ܳ��令(02)66057606�A���q�W�ٵ����['�������q'
--UPDATE Shippers SET Phone='(02)66057606', CompanyName=CompanyName+'�������q'
--WHERE ShipperID IN (1013,1014)

----15 �R����~�ⵧ���
--DELETE FROM Shippers 
--WHERE ShipperID IN (1013,1014)

