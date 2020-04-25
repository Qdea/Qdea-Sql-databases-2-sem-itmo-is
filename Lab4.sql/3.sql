select *
from Production.Product as pp
where pp.ProductID IN
(
select sod.ProductID
from Sales.SalesOrderDetail as sod
join Sales.SalesOrderHeader as soh on sod.SalesOrderID = soh.SalesOrderID
group by sod.ProductID
having count(distinct soh.CustomerID) = 1
)
"P.S. таких продуктов нет :)"
