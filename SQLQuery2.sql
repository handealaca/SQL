--
select UPPER(SUBSTRING('beRk',1,1))+LOWER(SUBSTRING('beRk',2,LEN('berk')))



select *from Orders

--Geciken Sipariş
select Count(*) from Orders where DATEDIFF(day,RequiredDate,ShippedDate)<0  

--Mart ayında doğanlar
select * from Employees where DATENAME(month,BirthDate)='March'

--Doğum yılı 1948 olanları getir
select * from Empl 