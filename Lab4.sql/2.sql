select pp.Title, pp.FirstName, pp.MiddleName, pp.LastName
from Person.Person pp
where pp.BusinessEntityID =
(select sc.PersonID
from Sales.Customer as sc
where sc.CustomerID = 
(select soh.CustomerID
from Sales.SalesOrderHeader as soh
where soh.SalesOrderID = 
(select top 1 sod.SalesOrderID
from Sales.SalesOrderDetail as sod
group by sod.SalesOrderID
order by SUM(sod.UnitPrice * sod.OrderQty) DESC)))
