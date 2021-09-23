/*
-----------------NORTHWIND DATABASE-----------------

SELECT: SQL de SELECT ifadesi bir tablodan değer çekmek için kullanılır. 
Örneğin Categories tablosunun bütün kolonlarını çekmek istiyoruz. O halde yazağaımız ifade aşağıdaki gibi olacaktır.
*/
SELECT * FROM Categories --Tablonun bütün kolonlarını çekiyoruz bu ifadeyle

/*
SELECT: SQL de SELECT ifadesi bir tablodan değer çekmek için kullanılır. 
Örneğin Categories tablosunun istediğimiz iki kolonunun çekmek istiyoru. O halde yazağaımız ifade aşağıdaki gibi olacaktır.
*/

SELECT CategoryID,CategoryName -- Tablonun sadece CategoryID ve CategoryName kolonlarını çekiyoruz bu ifadeyle
FROM Categories
/*
SELECT ifadesinden kolon isimleri yeri *(yıldız) ifadesini kullanıdığımız zaman bütün kolon isimlerini çekiyoruz. 
Ancak yıldız ifadesi yerine kolon isimlerini yazarsak sadece yazdığımız kolonlar çekiliyor.
NOT: tablomuz da kolon isimleri çok fazla ise ve bir çalışırken yani sorgumuzda bir kolonu inceleyeceksek eğer 
kolon adını SELECT'ten hemen sonra yazarız. ve virgül koyduktan sonra tekrar *(yıldız)'ı eklersek 
görmek istediğimiz kolon dönen tabloda en başta görünür.
*/

SELECT ShipCountry,* -- ShipCountry kolonu tablomuzda en sonda. Yandaki şekilde yazıldığında dönen tabloda en başta yer alır
FROM Orders 