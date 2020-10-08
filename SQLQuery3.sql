
select * from Employees
select * from Orders
select * from Customers



--Doğum yılı 1948 olanları getir
select * from Employees where Datepart(year,BirthDate)=1948


--Mart ayı 1993 yılında doğan employee larımı “ad soyad” birleşik şekilde sırala. (Ad soyad büyük olarak sırala )
select UPPER(FirstName+' '+lastName) [Ad Soyad] from Employees where DATEPART(year,BirthDate)=1963 and DATEPART(month,BirthDate)=07


--Bu ay doğan employee ların listesi?
select * from Employees where DATEPART(month,Birthdate)=Month(GetDate())


--1997 yılı şubat ayında kaç siparişim var?
select count(*) from Orders where DATEPART(year,OrderDate)=1997 and DATEPART(month,OrderDate)=02


--London şehrinden 1998 yılında kaç siparişim var?
select count(*) from Orders where DATEPART(year,OrderDate)=1998 and ShipCity='London'


--Taşıma ücreti 40 üzeri olan siparişlerim ( Freight)
select * from Orders where Freight>40


--Taşıma ücreti 40 üzeri olan siparişlerimin tarihi, çalışan id si ve adresi
select OrderDate,EmployeeID,ShipAddress from Orders where Freight>40


--1998 yılında kaç farklı müşterim sipariş vermiş 
select count(DISTINCT CustomerID ) from Orders where DATEPART(year,OrderDate)=1998 


-- En çok sipariş veren müşterim
select CustomerID from Orders GROUP BY CustomerID


-- Kaç farklı ülkeye sipariş veriyorum?
select  count(DISTINCT ShipCountry ) from Orders 


--1997 yılında Fransaya kaç siparişim gitmiş?
select count(*) from Orders where DATEPART(year,OrderDate)=1997 and ShipCountry='France'


-- 2 günden fazla geciken siparişlerimi listele.
select count(*) from Orders where DATEDIFF(day,RequiredDate,ShippedDate)>2



select * from Products as p inner join Categories as c on p.CategoryID=c.CategoryID


select ProductName,CompanyName from Products as p inner join Suppliers as s on p.SupplierID=s.SupplierID



--10248 numaralı siparişimin toplam tutarı nedir? ( Quantity * UnitPrice) Dileyenler discount kolonundan indirim de uygulayabilir

select * from Orders
select * from [Order Details]
select SUM(od.UnitPrice*od.Quantity) TOTAL from [Order Details] as od where OrderID=10248


--10248 nolu siparişin tarihi, müşteri adı, müşteri şehri		
select o.OrderDate,c.CompanyName,c.City from Orders as o inner join Customers as c on o.CustomerID=c.CustomerID


--hanari Carnes müşterinin siparişlerinin Id si, tarihi, Çalışan Id sırala
 select o.OrderID,o.OrderDate,o.EmployeeID from Orders as o inner join Customers as c on o.CustomerID=c.CustomerID 
 where c.CompanyName='Hanari carnes'


 --1997 yılındaki siparişler
 select o.OrderID,o.OrderDate,c.City,c.ContactName 
 from Orders as o inner join Customers as c 
 on o.CustomerID= c.CustomerID
 where Year(o.OrderDate)=1997


 --
 select o.OrderID,o.OrderDate,e.FirstName+' '+e.LastName[Full name] from Orders as o inner join Employees as e
 on o.EmployeeID=e.EmployeeID
 where Year(o.OrderDate)=1997 and MONTH(o.Orderdate)=03


 --1997 yılındaki cirom
 select SUM(od.UnitPrice*od.Quantity) TOTAL 
 from [Order Details] as od inner join Orders as o 
 on od.OrderID=o.OrderID where Year(o.OrderDate)=1997


 --Siparişlerimin tarihi, sipariş idsi, siparşi alan çalışanımın adı + soyadı ni getir. Tarihe göre tersten sıralama yap
select o.OrderDate,o.OrderID,e.FirstName+' '+e.LastName FullName 
from Orders as o inner join Employees as e 
on o.EmployeeID=e.EmployeeID 
order by OrderDate desc

--London şehrinden sipariş veren müşterilerimin adı, adresinini ve sipariş tarihini getir. ada göre sırala.
select c.CustomerID,c.Address,o.OrderDate from Orders as o inner join Customers as c
on o.CustomerID=c.CustomerID
where o.ShipCity='london'
order by ContactName

--London şehrinden sipariş alan çalışanlarımın adı soyadı ve sipariş tarihini getir. Tarihe göre sırala
select e.FirstName+' '+e.LastName FUllName,o.OrderDate
from Orders as o inner join Employees as e 
on o.EmployeeID=e.EmployeeID
where o.ShipCity='London'
order by o.OrderDate

--Geciken siparişlerimin tarihi, çalışan adıi soyadınu getir tarihe göre getir
select o.OrderDate,e.FirstName+' '+e.LastName FullName
from Orders as o inner join Employees as e 
on o.EmployeeID=e.EmployeeID
where o.ShippedDate>o.RequiredDate
order by o.OrderDate


--1997 yılında geciken siparişlerimin çalışanlarının adı ve soyadı
select e.FirstName+' '+e.LastName FullName
from Orders as o inner join Employees as e 
on o.EmployeeID=e.EmployeeID
where o.ShippedDate>o.RequiredDate and YEAR(o.OrderDate)=1997


--3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı? 
select * from Employees
select * from [Order Details]
select * from Orders


select SUM(od.UnitPrice*od.Quantity) TOTAL 
from Orders as o inner join Employees as e
on o.EmployeeID=e.EmployeeID
inner join [Order Details] as od
on o.OrderID=od.OrderID
where e.EmployeeID=3 and year(o.OrderDate) = YEAR(MAX(o.OrderDate)) and month(o.OrderDate)>1




