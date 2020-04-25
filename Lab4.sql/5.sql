select od.ProductID 
from [Sales].[SalesOrderDetail] as od 
join [Sales].[SalesOrderHeader] oh on od.SalesOrderID=oh.SalesOrderID 
where oh.CustomerID in 
(select oh.CustomerID 
 from [Production].[Product] as p 
 join [Sales].[SalesOrderDetail] as od on p.productid=od.ProductID 
 join [Sales].[SalesOrderHeader] as oh on od.SalesOrderID=oh.SalesOrderID 
 group by oh.CustomerID 
 having count(distinct p.Color)=1) and od.ProductID not in 
 (select od.ProductID 
  from [Sales].[SalesOrderDetail] as od 
  join [Sales].[SalesOrderHeader] as oh on od.SalesOrderID=oh.SalesOrderID 
  where oh.CustomerID in 
  (select oh.CustomerID 
   from [Production].[Product] as p 
   join [Sales].[SalesOrderDetail] as od on p.productid=od.ProductID 
   join [Sales].[SalesOrderHeader] as oh on od.SalesOrderID=oh.SalesOrderID 
   group by oh.CustomerID 
   having count(distinct p.Color)=2)) 
   group by od.ProductID 
   having count(distinct oh.CustomerID)>1
