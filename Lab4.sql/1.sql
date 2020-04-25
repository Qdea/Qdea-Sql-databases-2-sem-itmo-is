select pp.Name
from Production.Product as pp
where pp.ProductID =
(select sod.ProductID 
from Sales.SalesOrderDEtail as sod
where sod.OrderQty =
(select max(sodcnt.OrderQty)
from Sales.SalesOrderDEtail as sodcnt))
