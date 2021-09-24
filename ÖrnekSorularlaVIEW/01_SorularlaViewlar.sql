--------------------------VIEW ORNEKLERI--------------------------

/*
Quantity degeri 20 den buyuk olan siparislerin kategorile gore 
toplam birim fiyat ve urun adeti getirme
*/

CREATE VIEW v_SalesForCategories --View Oluşturuluyor
AS
SELECT 
	C.CategoryName, 
	SUM(OD.UnitPrice) AS UnitPrice,
	COUNT(OD.ProductID) AS CountProduct
FROM [Order Details] OD
	JOIN Products P ON OD.ProductID=P.ProductID
	JOIN Categories C ON P.CategoryID=C.CategoryID
WHERE OD.Quantity>=20
GROUP BY C.CategoryName

SELECT * FROM v_SalesForCategories --View çağırılıyor
/*******************************************************************************************/

/*
Bir ürünü kaç kişi satın almıştır ve en çok hangi urunu insanlar tarafından 
tercih edilmiştir.
*/
CREATE VIEW v_ProductnameByCountcustomer --View Oluşturuluyor
AS
SELECT 
	DISTINCT P.ProductName,
	COUNT(C.CustomerID) AS CountCustomer
FROM Customers C
	JOIN Orders O ON C.CustomerID=O.CustomerID
	JOIN [Order Details] OD ON O.OrderID=OD.OrderID
	JOIN Products P ON OD.ProductID=P.ProductID
GROUP BY P.ProductName
--ORDER BY CountCustomer DESC

SELECT * FROM v_ProductnameByCountcustomer --View çağırılıyor
/*******************************************************************************************/


/*
Bir müşteri en fazla kaç tane urun almış ve ne kadar harcama yapmış.
*/
ALTER VIEW v_CustomerSpend --View Oluşturuluyor
AS
SELECT DISTINCT 
C.CompanyName, 
COUNT(P.ProductID) AS CountProduct, 
SUM(OD.UnitPrice) AS TotalSales
FROM Products P 
JOIN [Order Details] OD ON P.ProductID=OD.ProductID
JOIN Orders O ON OD.OrderID=O.OrderID
JOIN Customers C ON O.CustomerID=C.CustomerID
GROUP BY  C.CompanyName

SELECT * FROM v_CustomerSpend --View çağırılıyor
/*******************************************************************************************/

/*
Satılan ürünler arasında en pahalı 5 ürün listesi
*/
CREATE VIEW v_EnPahalı5Urun --View Oluşturuluyor
AS
SELECT TOP 5 P.ProductID, P.ProductName,SUM(OD.UnitPrice) AS UnitPrice
FROM Products P
JOIN [Order Details] OD ON P.ProductID=OD.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY SUM(OD.UnitPrice) DESC

SELECT * FROM v_EnPahalı5Urun --View Oluşturuluyor
