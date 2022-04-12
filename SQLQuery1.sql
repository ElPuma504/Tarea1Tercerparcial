USE Northwind;
---------------------------------------------------------------------------
CREATE VIEW mostrarEmpleados 
as select * from Employees where ReportsTo is not null;
----------------------------------------------------------------------------
CREATE VIEW mostrarProductosmas 
as select f.CategoryName, d.ProductName,d.ProductID, n.CompanyName, d.QuantityPerUnit,f.Description,d.UnitsOnOrder, d.UnitPrice, d.UnitsInStock,  d.Discontinued , d.ReorderLevel
from Products d inner join Suppliers n on d.SupplierID=n.SupplierID
inner join Categories f on f.CategoryID=d.CategoryID;
------------------------------------------------------------------------------

CREATE VIEW mostrarClientesyOrdenes 
as select s.CustomerID,s.ContactName,s.CompanyName,  r.OrderDate, s.Phone, s.Address, s.ContactTitle,s.City,r.RequiredDate, r.ShippedDate, s.Country
from Customers s inner join Orders r on s.CustomerID=r.CustomerID 
------------------------------------------------------------------------------
CREATE VIEW mostrarClientesyOrdenes 
as select s.CustomerID,s.ContactName,s.CompanyName, r.OrderDate,  s.Phone, s.Address, s.City, r.RequiredDate, r.ShippedDate,s.Country
from Customers s inner join Orders r on s.CustomerID=r.CustomerID 
------------------------------------------------------------------------------
drop view mostrarClientesyOrdenes
------------------------------------------------------------------------------
create procedure getOrden
as select * from Orders
------------------------------------------------------------------------------
create procedure getClienteporCuidad (@cuidad varchar(40))
as select * from Customers where City=@cuidad
-------------------------------------------------------------------------------
create procedure getEmpleaditosporMes (@mes int)
as select * from Employees where MONTH(BirthDate)=@mes
-------------------------------------------------------------------------------
create procedure getOrdenesporFecha (@fecha date) 
as select *  from Orders where CONVERT(date,OrderDate)=@fecha;
-------------------------------------------------------------------------------
create procedure actualizandoelTelefonodelCliente(@idCliente nchar(10),@nuevotel nvarchar(30))
as update Customers set Phone=@nuevotel where CustomerID=@idCliente;