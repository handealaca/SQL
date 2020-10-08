select*from Categories

select ProductName,UnitPrice,UnitsInStock from Products where UnitPrice>20 and UnitsInStock >30

select * from Products where CategoryID=3

select *from Products where ProductName='chai'

select * from Products where ProductName like'%a%' and UnitPrice>20

select * from Products order by ProductName desc

--en ucuz ilk 5 Ürün
select top 5*from Products order by UnitPrice

--en pahalı ilk 5 Ürün
select top 5*from Products order by UnitPrice desc


select * from Employees



--çalışanların ad ve soyadını yanyana tek kolon yaz.kolona Fullname adı ver

select FirstName +' '+ LastName FullName from Employees

--Kaç adet ürün
select count(*) from Products

--stok sayısı 20den küçük kaç ürün var
select count(*) from Products where UnitsInStock <20


--unit price ve kdv li fiyat kolunu
select UnitPrice,UnitPrice*1.18 KDVliFiyat from Products



--Tüm tedarikçiler
select * from Suppliers

--ilk 5 tedarikçi
select top 5 * from Suppliers

--ilk 5 tedarikçi company name sırala
select top 5 * from Suppliers order by CompanyName


--ülkesi USA olan tedarikçiler
select * from Suppliers where Country='USA'

--Fax alanı NULL olmayanlar
select * from Suppliers where Fax IS NOT NULL

--posta kodu 3 ile başlayanlar
select * from Suppliers where PostalCode  like '3%' order by CompanyName