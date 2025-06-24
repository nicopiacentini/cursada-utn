create function [dbo].[stock_por_articulo_y_fecha](@articulo char(8), @fecha smalldatetime)
returns decimal(12,2)
begin
return (select sum(stoc_cantidad)
from STOCK
where stoc_producto = @articulo and @fecha < stoc_proxima_reposicion
group by stoc_producto)
end