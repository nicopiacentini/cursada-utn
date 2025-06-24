create function [dbo].[precio_producto](@producto char(8))
returns decimal(12,2)
as
begin
	if @producto in (select comp_producto from Composicion)
		return dbo.total_precio_componentes(@producto)
	return (select prod_precio from Producto where prod_codigo = @producto)
end