create function [dbo].[mas_vendedor_cliente](@cliente char(6))
returns numeric(6,0)
as
begin
	if exists (select 1 from Factura where fact_cliente = @cliente)
		return (select top 1 fact_vendedor from Factura where fact_cliente = @cliente group by fact_vendedor order by sum(fact_total) desc) 
	return (select top 1 fact_vendedor from Factura group by fact_vendedor order by sum(fact_total) desc)
end