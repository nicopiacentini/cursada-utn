create function [dbo].[calcular_comision](@empleado numeric(6,0), @fecha smalldatetime)
returns decimal(12,2)
as
begin
	declare @venta_total decimal(12,2) = (select isnull(sum(fact_total),0) from Factura where fact_vendedor = @empleado and year(fact_fecha) = year(@fecha) and month(fact_fecha) = month(@fecha))
	declare @comision decimal(12,2) = @venta_total * 0.05
	if (select count(distinct item_producto) from Item_Factura join Factura on item_tipo+item_numero+item_sucursal = fact_tipo+fact_numero+fact_sucursal where fact_vendedor = @empleado and year(fact_fecha) = year(@fecha) and month(fact_fecha) = month(@fecha)) >= 50
		set @comision += @venta_total * 0.03
	return @comision
end