select ProductID, --ListPrice, pp.ProductSubcategoryID, AvgPrice 
from Production.Product pp
join
(select pp.ProductSubcategoryID, avg(pp.ListPrice) as AvgPrice
from Production.Product as pp
where pp.ProductSubcategoryID is not null
group by pp.ProductSubcategoryID) as res
ON pp.ProductSubcategoryID = res.ProductSubcategoryID
WHERE pp.ListPrice > res.AvgPrice
ORDER BY pp.ProductSubcategoryID, ListPrice
