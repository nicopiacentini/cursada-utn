create function [dbo].[estado_deposito_segun_articulo](@articulo char(8), @deposito char(2))
returns varchar(100)
begin
declare @limite decimal(12,2) = (select stoc_stock_maximo from STOCK where stoc_producto = @articulo and stoc_deposito = @deposito)
declare @cantidad_almacenada decimal(12,2) = (select stoc_cantidad from STOCK where stoc_producto = @articulo and stoc_deposito = @deposito)
if @cantidad_almacenada  < @limite
	return 'OCUPACION DEL DEPOSITO ' + str(@cantidad_almacenada * 100 / @limite)  + '%'
return 'DEPOSITO COMPLETO'
end