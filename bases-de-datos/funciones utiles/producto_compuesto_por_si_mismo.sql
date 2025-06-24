create function [dbo].[producto_compuesto_por_si_mismo](@producto char(8), @componente char(8))
returns int
as
begin
	if @producto = @componente
		return 1
	else
		begin
			declare @producto_auxiliar char(8)
			declare cursor_componente cursor for (select comp_componente from Composicion where comp_producto = @componente)
			open cursor_componente
			fetch next from cursor_componente into @producto_auxiliar
			while @@FETCH_STATUS = 0
			begin
				if dbo.producto_compuesto_por_si_mismo(@producto, @producto_auxiliar) = 1
					return 1
				fetch next from cursor_componente into @producto_auxiliar
			end
			close cursor_componente
			deallocate cursor_componente
			return 0
		end
	return 0	
end