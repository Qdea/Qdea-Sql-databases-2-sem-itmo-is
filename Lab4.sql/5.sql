select pp.ProductID 
from Production.Product as pp
join
(
select pp.ProductModelID, MIN(Color) as Color
from Production.Product as pp
join 
(
select distinct sod.ProductID, soh.CustomerID
from Sales.SalesOrderDetail as sod
join Sales.SalesOrderHeader as soh on sod.SalesOrderID = soh.SalesOrderID
) as res
on pp.ProductID = res.ProductID AND pp.Color IS NOT NULL
group by ProductModelID
having count(distinct Color) = 1
) as r 
on pp.ProductModelID = r.ProductModelID AND pp.Color = r.Color 
