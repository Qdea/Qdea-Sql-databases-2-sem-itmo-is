select pp.* -- Title, pp.FirstName, pp.MiddleName, pp.LastName
from Person.Person pp
where pp.BusinessEntityID IN
(select sc.PersonID
from Sales.Customer as sc
where sc.CustomerID IN 
(
select a.CustomerID
from
(
select soh.CustomerID, count(distinct sod.SalesOrderID) as Amount
from Sales.SalesOrderDetail as sod
join Sales.SalesOrderHeader as soh on sod.SalesOrderID = soh.SalesOrderID
GROUP BY soh.CustomerID, sod.ProductID
) as a
join (
select soh.CustomerID, count(distinct soh.SalesOrderID) as Amount
from Sales.SalesOrderHeader as soh 
GROUP BY soh.CustomerID
) as b
on a.CustomerID = b.CustomerID
GROUP BY a.CustomerID, b.Amount
HAVING MAX(a.Amount) = b.Amount
))
P.S. в 7ой задаче мы ищем покупателей товаров. в 6ой задаче нужно вывести товары, поэтому запрос будет очень похожим
