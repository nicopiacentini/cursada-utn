/*1. Realizar una consulta SQL que permita saber los clientes que
compraron todos los rubros disponibles del sistema en el 2012.
De estos clientes mostrar, siempre para el 2012:
1. El código del cliente
2. Código de producto que en cantidades más compro.
3. El nombre del producto del punto 3.
4. Cantidad de productos distintos comprados por el
cliente.
5. Cantidad de productos con composición comprados
por el cliente.
El resultado deberá ser ordenado por razón social del cliente
alfabéticamente primero y luego, los clientes que compraron entre un
20% у 30% del total facturado en el 2012 primero, luego, los restantes.*/select clie_codigo,(	select top 1 item_producto from factura join item_factura on 	item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal	where year(fact_Fecha) = 2012 and fact_cliente = clie_codigo	group by item_producto	order by sum(item_cantidad) desc)as productoMasComprado,(select prod_detalle from producto where prod_codigo = (select top 1 item_producto from factura join item_factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal where year(fact_Fecha) = 2012 and fact_cliente = clie_codigo group by item_producto order by sum(item_cantidad) desc) )as nombreProductoMasComprado,count(distinct prod_codigo) as productosDistintosComprados,(	select isnull(sum(item_cantidad),0)	from Item_Factura join Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal	where year(fact_Fecha) = 2012 and fact_cliente = clie_codigo	and item_producto in (select comp_producto from Composicion)) as productosComboComprados -- si me pidiese en cantidad de distintos, tiro un left join con composicion y meto un count distinct, mas piola :)from cliente join Factura on fact_cliente = clie_codigojoin Item_Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursaljoin Producto on prod_codigo = item_productowhere year(fact_fecha) = 2012group by clie_codigo, clie_razon_socialhaving count(distinct prod_rubro) = (select count(*) from rubro)order by clie_razon_social, case when sum(item_cantidad * item_precio) between (select sum(fact_total) from Factura where year(fact_fecha) = 2012) * 0.2 and (select sum(fact_total) from Factura where year(fact_fecha) = 2012) * 0.3 then 1 else 0 end/* Implementar una regla de negocio en linea que al realizar una venta
(SOLO INSERCION) permita componer los productos descompuestos,
es decir, si se guardan en la factura 2 hamb. 2 papas 2 gaseosas se
deberá guardar en la factura 2 (DOS) COMBO1. Si 1 combo1 equivale
a: 1 hamb. 1 papa y 1 gaseosa.*/

create trigger armarComboEnFactura on factura after insert as
begin
	declare @tipo char(1), @numero char(8), @sucursal char(4), @combo char(8), @cantidad decimal(12,2)
	declare facturas cursor for select fact_tipo , fact_numero , fact_sucursal from inserted
	open facturas
	fetch facturas into @tipo, @numero, @sucursal
	while @@FETCH_STATUS = 0
	begin
		declare items cursor for select comp_producto from Composicion c join Item_Factura on item_producto = comp_componente
		where item_tipo + item_numero + item_sucursal = @tipo + @numero + @sucursal
		group by comp_producto 
		having count(*) = (select count(*) from Composicion where comp_producto = c.comp_producto)
		open items
		fetch items into @combo
		while @@FETCH_STATUS = 0
		begin
			select @cantidad = min(floor(item_cantidad/comp_cantidad))
			from Item_Factura join Composicion on comp_componente = item_producto
			where item_tipo + item_numero + item_sucursal = @tipo + @numero + @sucursal
			and comp_producto = @combo

			insert into Item_Factura values(@tipo, @numero, @sucursal, @combo, @cantidad,(select prod_precio from producto where prod_codigo = @combo) * @cantidad)
			
			update Item_Factura set item_cantidad -= @cantidad * (select comp_cantidad from Composicion where comp_componente = item_producto and comp_producto = @combo)
			where item_tipo + item_numero + item_sucursal = @tipo + @numero + @sucursal
			and item_producto in (select comp_componente from Composicion where comp_producto = @combo)

			delete from Item_Factura where item_cantidad = 0
			and item_tipo + item_numero + item_sucursal = @tipo + @numero + @sucursal

			fetch items into @combo
		end
		close items
		deallocate items


		fetch next facturas into @tipo, @numero, @sucursal
	end
	close facturas deallocate facutras
end

/*1. Realizar una consulta SQL que permita saber si un cliente compro un
producto en todos los meses del 2012.
Además, mostrar para el 2012:
1. El cliente
2. La razón social del cliente
3. El producto comprado
4. El nombre del producto
5. Cantidad de productos distintos comprados por el
cliente.
6. Cantidad de productos con composición comprados
por el cliente.
El resultado deberá ser ordenado poniendo primero aquellos clientes
que compraron más de 10 productos distintos en el 2012.*/

select clie_codigo, clie_razon_social, prod_codigo, prod_detalle,
(
	select count(distinct item_producto)
	from Item_Factura join Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
	where year(fact_fecha) = 2012
	and fact_cliente = clie_codigo
)as productosDistintos2012, 
(
	select count(distinct comp_producto)
	from Item_Factura join Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
	join Composicion on comp_producto = item_producto
	where year(fact_fecha) = 2012
	and fact_cliente = clie_codigo
)as compuestos2012
from producto join item_factura on Item_producto = prod_codigo
join Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
join cliente on clie_codigo = fact_cliente
where year(fact_fecha) = 2012
group by clie_codigo, clie_razon_social, prod_codigo, prod_detalle
having count(distinct Month(fact_FECHA)) = 12
order by (case when (select count(distinct item_producto) from Item_Factura join Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal where year(fact_fecha) = 2012
	and fact_cliente = clie_codigo) > 10 then 1 else 0 end)

/*2. Implementar una regla de negocio de validación en linea que permita implementar 
una lógica de control de precios en las ventas. 
Se deberá poder seleccionar una lista de rubros y aquellos productos de los rubros
que sean los seleccionados no podrán aumentar por mes más de un 2
%. En caso que no se tenga referencia del mes anterior no validar
dicha regla.*/

create table rubrosCuidados (rubro char(4) primary key)

create trigger preciosCuidados on item_factura after insert
as begin
	if exists(
		select 1 from inserted i join Factura f on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
		where item_precio > 1.02 * (
			select min(item_precio)
			from inserted join Factura on 
			item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
			where item_producto = i.item_producto
			and month(fact_fecha) = MONTH(f.fact_fecha) - 1
		)
	)begin
		print 'no se puede aumentar tanto el precio'
		rollback
	end
end

/*Realizar una consulta SQL que retorne para los 10 clientes que más
compraron en el 2012 y que fueron atendidos por más de 3 vendedores
distintos:

Apellido y Nombre del Cliente.
Cantidad de Productos distintos comprados en el 2012.
Cantidad de unidades compradas dentro del primer semestre del 2012.

El resultado deberá mostrar ordenado la cantidad de ventas descendente
del 2012 de cada cliente, en caso de igualdad de ventas, ordenar por
código de cliente.
*/

select top 10 clie_razon_social, count(distinct item_producto) as compradosEn2012,
(
	select sum(item_cantidad) from Factura 
	join Item_Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
	where year(fact_fecha) = 2012 and fact_cliente = clie_codigo
)as nigger
from Cliente join Factura on fact_cliente = clie_codigo
join Item_Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
where year(fact_fecha) = 2012
group by clie_codigo, clie_razon_social
having count(distinct fact_vendedor) > 3
order by count(distinct fact_tipo + fact_numero + fact_sucursal) desc, clie_codigo
 
 /*Realizar un stored procedure que reciba un código de producto y una
fecha y devuelva la mayor cantidad de días consecutivos a partir de esa
fecha que el producto tuvo al menos la venta de una unidad en el dia, el
sistema de ventas on line está habilitado 24-7 por lo que se deben evaluar
todos los días incluyendo domingos y feriados.*/

create procedure maximasVentasSeguidas (@producto char(8), @fecha smalldatetime) as begin
	declare @cantidad int, @cantidadMaxima int, @fechaActual smalldatetime, @fechaAnterior smalldatetime
	set @cantidad = 0
	set @cantidadMaxima = 0 
	set @fechaAnterior = null
	declare ventas cursor for select fact_fecha from Item_Factura join factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
	where fact_fecha >= @fecha and item_producto = @producto order by fact_fecha asc
	open ventas
	fetch ventas into @fechaActual
	while @@FETCH_STATUS = 0
	begin
		if @fechaAnterior = null set @cantidad = 1
		else if dateadd(day,-1,@fechaActual) = @fechaAnterior
		begin
			set @cantidad += 1
		end
		else begin
			if (@cantidad > @cantidadMaxima) set @cantidadMaxima = @cantidad
			set @cantidad = 0
			set @fechaAnterior = 0
		end	
		fetch ventas into @fechaActual
	end
	close ventas deallocate ventas
end

/*Dada la crisis que atraviesa la empresa, el directorio solicita un informe especial
para poder analizar y definir la nueva estrategia a adoptar
Este informe consta de un listado de aquellos productos cuyas ventas de lo que
va del año 2012 fueron superiores al 15% del promedio de ventas de los
productos vendidos entre los años 2010 y 2011. En base a lo solicitado, armar una consulta SQL que retorne la siguiente
información:*/

select prod_detalle, case when count(fact_tipo + fact_numero + fact_sucursal) > 100 then 'popular' else 'sin interes' end as nivelInteres,
count(fact_tipo + fact_numero + fact_sucursal) as cantidadFacturas, 
(
	select top 1 fact_cliente from Item_Factura 
	join Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
	where year(fact_fecha) = 2012 and item_producto = prod_codigo
	group by fact_cliente
	order by sum(item_cantidad) desc
) as mejorCliente
from producto join Item_Factura on item_producto = prod_codigo
join Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
where year(fact_fecha) = 2012
group by prod_codigo, prod_detalle
having sum(item_precio * item_cantidad) > 0.15 * (select avg(fact_total) from Factura where year(fact_fecha) = 2011 or year(fact_fecha) = 2010)

/*Realizar el o los objetos de base de datos necesarios para que dado un código
de producto y una fecha y devuelva la mayor cantidad de días consecutivos a
partir de esa fecha que el producto tuvo al menos la venta de una unidad en el
día, el sistema de ventas on line está habilitado 24-7 por lo que se deben evaluar todos los días incluyendo domingos y feriados.*/

create procedure maximasVentasSeguidas (@producto char(8), @fecha smalldatetime) as begin
	declare @cantidad int, @cantidadMaxima int, @fechaActual smalldatetime, @fechaAnterior smalldatetime
	set @cantidad = 0
	set @cantidadMaxima = 0 
	set @fechaAnterior = null
	declare ventas cursor for select fact_fecha from Item_Factura join factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
	where fact_fecha >= @fecha and item_producto = @producto group by fact_tipo + fact_numero + fact_sucursal order by fact_fecha asc 
	open ventas
	fetch ventas into @fechaActual
	while @@FETCH_STATUS = 0
	begin
		if @fechaAnterior = null set @cantidad = 1
		else if dateadd(day,-1,@fechaActual) = @fechaAnterior
		begin
			set @cantidad += 1
		end
		else if @fechaActual = @fechaAnterior
		begin
			fetch ventas into @fechaActual
		end
		else begin
			if (@cantidad > @cantidadMaxima) set @cantidadMaxima = @cantidad
			set @cantidad = 0
			set @fechaAnterior = null
		end	
		fetch ventas into @fechaActual
	end
	close ventas deallocate ventas
	return @cantidadMaxima
end

/*create function mayor_dias_consecutivos_venta(@producto char(8), @fecha smalldatetime)
returns int
as
begin
	declare @fecha_inicial smalldatetime = @fecha, @fecha_siguiente smalldatetime, @cantidad_dias int = 0, @cantidad_maxima int = 0
	declare cursor_ventas cursor for select fact_fecha from Item_Factura join Factura on fact_tipo+fact_numero+fact_sucursal = item_tipo+item_numero+item_sucursal where item_producto = @producto and fact_fecha > @fecha group by fact_tipo, fact_numero, fact_sucursal order by fact_fecha asc
	open cursor_ventas
	fetch next from cursor_ventas into @fecha_siguiente
	while @@FETCH_STATUS = 0
	begin
		if @fecha_inicial is not null and datediff(day, @fecha_inicial, @fecha_siguiente) = 1
			set @cantidad_dias += 1
		else 
			if @cantidad_dias > @cantidad_maxima
				set @cantidad_maxima = @cantidad_dias
			set @cantidad_dias = 0

		set @fecha_inicial = @fecha_siguiente
		fetch next from cursor_ventas into @fecha_siguiente
	end

	if @cantidad_dias > @cantidad_maxima
		set @cantidad_maxima = @cantidad_dias
	close cursor_ventas
	deallocate cursor_ventas
	return isnull(@cantidad_maxima, 0)
end
go*/

/*En pos de la mejora continua y poder optimizar el uso de los depósitos, se le pide
un informe con la siguiente información:
a) El depósito
b) El domicilio del depósito
c) Cantidad de productos compuestos con stock
d) Cantidad de productos no compuestos con stock
e) Indicar un string "Mayoría compuestos", en caso de que el
depósito tenga mayor cantidad de productos compuestos
"Mayoría no compuestos", caso contrario.
f) Empleado más joven de todos los depósitos.
Solamente mostrar aquellos depósitos donde la cantidad total de productos en
stock este entre 0 y 1000.-*/

	select depo_codigo, depo_domicilio,
	(
		select count(distinct stoc_producto)
		from STOCK join composicion on comp_producto = stoc_producto where stoc_deposito = depo_codigo 
		and stoc_cantidad > 0
	)as cantidadCompuestos,
	(
		select count(distinct stoc_producto)
		from STOCK where stoc_deposito = depo_codigo 
		and stoc_cantidad > 0 and stoc_producto not in (select comp_producto from Composicion)
	)as cantidadNoCompuestos,
	case when (select count(distinct stoc_producto) from STOCK join composicion on comp_producto = stoc_producto where stoc_deposito = depo_codigo  and stoc_cantidad > 0) > (select count(distinct stoc_producto) from STOCK where stoc_deposito = depo_codigo 
									and stoc_cantidad > 0 and stoc_producto not in (select comp_producto from Composicion))
									then 'mayoria compuestos' else 'mayoria no compuestos' end as leyenda,
	(
		select top 1 depo_encargado
		from DEPOSITO join Empleado on empl_codigo = depo_encargado
		order by empl_nacimiento desc
	)as empleadoMasJoven
	from DEPOSITO 
	where (
  select count(distinct s.stoc_producto)
  from STOCK s
  where s.stoc_deposito = depo_codigo and s.stoc_cantidad > 0
) between 1 and 1000


/*La compañla desea implementar una política para incrementar el consumo de
ciertos productos. Se pide crear el/los objetos necesarios para que se imprima
un cupón con la leyenda "Ud. accederá a un 5% de descuento del total de su
próxima factura" a los clientes que realicen compras superiores a los $5000 y
que entre los productos comprados haya adquirido algún producto de los
siguientes rubros:
- PILAS
. PASTILLAS
- ArTICULOS DE TOCADOR*/

create trigger bonificarFactura on Factura after insert as
begin
	if exists(
		select 1 from inserted join Item_Factura on item_tipo + item_numero + item_sucursal = fact_tipo + fact_numero + fact_sucursal
		join Producto on prod_codigo = item_producto
		where prod_rubro = 'PILAS' OR prod_rubro = 'ARTICULOS DE TOCADOR' OR prod_rubro = 'PASTILLAS'
		and sum(fact_total) > 5000
	) PRINT 'Ud. accederá a un 5% de descuento del total de su próxima factura'
end

/*Sabiendo que si un producto no es vendido en un depósito determinado entonces
no posee registros en él.
Se requiere una consulta sql que para todos los productos que se quedaron sin
stock en un depósito (cantidad 0 o nula) y poseen un stock mayor al punto de
reposición en otro deposito devuelva:
1- Código de producto
2- Detalle del producto
3- Domicilio del depósito sin stock
4- Cantidad de depósitos con un stock superior al punto de reposición
La consulta debe ser ordenada por el código de producto.*/

select prod_codigo, prod_detalle, depo_domicilio,
(
	select count(stoc_deposito) from STOCK where stoc_producto = prod_codigo
	and stoc_cantidad > stoc_punto_reposicion
)as deposConStockSuficiente
from Producto left join STOCK on stoc_producto = prod_codigo left join DEPOSITO on depo_codigo = stoc_deposito
where stoc_cantidad = 0 or stoc_cantidad is null
and exists(
	select 1 from STOCK where stoc_producto = prod_codigo and stoc_cantidad > stoc_punto_reposicion
)
group by prod_codigo, prod_detalle, depo_domicilio, depo_codigo
order by prod_codigo

/*dado el contexto inflacionario se tiene que aplicar un control en el cual nunca se
permita vender un producto a un precio que no esté entre 0%-5% del precio de
venta del producto el mes anterior, ni tampoco que esté en más de un 50% el
precio del mismo producto que hace 12 meses atrás. Aquellos productos nuevos,
o que no tuvieron ventas en meses anteriores no debe considerar esta regla ya
que no hay precio de referencia.*/

create trigger control_inflacionario on Item_Factura after insert
as 
begin
    declare @producto char(6), @fecha smalldatetime, @precio decimal(12,2), @sucursal char(4), @numero char(8), @tipo char(1)
    declare c1 cursor for
    select item_numero, item_sucursal, item_tipo, item_producto, item_precio, fact_fecha from inserted
	join Factura on fact_numero+fact_sucursal+fact_tipo = item_numero+item_sucursal+item_tipo

    open c1
    fetch next from c1 into @numero, @sucursal, @tipo, @producto, @precio, @fecha

    while @@FETCH_STATUS = 0
    begin
		if exists(select 1 from Item_Factura where item_producto = @producto 
		and item_numero+item_sucursal+item_tipo <> @numero+@sucursal+@tipo)
		begin 
			if exists(select 1 from Item_Factura 
			join Factura on fact_numero+fact_sucursal+fact_tipo = item_numero+item_sucursal+item_tipo
			where item_producto = @producto and datediff(month, @fecha, fact_fecha) = 1 and @precio > item_precio * 1.05)
			begin 
				delete Item_Factura
				where item_numero = @numero and item_sucursal = @sucursal and item_tipo = @tipo

				delete Factura
				where fact_numero = @numero and fact_sucursal = @sucursal and fact_tipo = @tipo
			end

			if exists(select 1 from Item_Factura 
			join Factura on fact_numero+fact_sucursal+fact_tipo = item_numero+item_sucursal+item_tipo
			where item_producto = @producto and datediff(year, @fecha, fact_fecha) = 1 and @precio > item_precio * 1.5)
			begin 
				delete Item_Factura
				where item_numero = @numero and item_sucursal = @sucursal and item_tipo = @tipo

				delete Factura
				where fact_numero = @numero and fact_sucursal = @sucursal and fact_tipo = @tipo
			end
		end

		fetch next from c1 into @numero, @sucursal, @tipo, @producto, @precio, @fecha
	end
       
    close c1
    deallocate c1
end
go


/*
Por tal motivo se solicita un listado con los 5 productos más vendidos y los 5
productos menos vendidos durante el 2012. Comparar la cantidad vendida de
cada uno de estos productos con la cantidad vendida del año anterior e indicar
el string 'Más ventas' o 'Menos ventas', según corresponda. Además indicar el
envase.
A) Producto
B) Comparación año anterior
C) Detalle de Envase
Armar una consulta SQL que retorne esta información.
NOTA: No se permite el uso de sub-selects en el FROM ni funciones definidas
por el usuario para este punto.
NOTA2: Si un producto no tuvo ventas en el año, también debe considerarse
como producto menos vendido. En caso de existir más de 5, solamente mostrar
los 5 primeros en orden alfabético.*/

select  prod_codigo, 
case when sum(item_cantidad) > (select sum(item_cantidad) from Item_Factura 
								join factura on fact_numero+fact_sucursal+fact_tipo = item_numero+item_sucursal+item_tipo
								where year(fact_fecha) = 2011
								and i.prod_codigo = item_producto) then 'mas ventas' else 'menos ventas' end as leyendaVentas
, enva_detalle
from Producto i join Envases on enva_codigo = prod_envase
left join Item_Factura  on item_producto = prod_codigo
join factura on fact_numero+fact_sucursal+fact_tipo = item_numero+item_sucursal+item_tipo
where year(fact_fecha) = 2012
and (prod_codigo in (
	SELECT top 5 item_producto from Item_Factura
	join factura on fact_numero+fact_sucursal+fact_tipo = item_numero+item_sucursal+item_tipo
	join Producto on prod_codigo = item_producto
	where year(fact_fecha) = 2012
	group by item_producto, prod_detalle
	order by isnull(sum(item_cantidad),0) desc,  prod_detalle
)
or prod_codigo in (
	SELECT top 5 item_producto from Item_Factura
	join factura on fact_numero+fact_sucursal+fact_tipo = item_numero+item_sucursal+item_tipo
	join Producto on prod_codigo = item_producto
	where year(fact_fecha) = 2012
	group by item_producto, prod_detalle
	order by isnull(sum(item_cantidad),0) asc, prod_detalle
))
group by prod_codigo, enva_codigo, enva_detalle
order by 1

/*La compañía cumple años y decidió a repartir algunas sorpresas entre sus
clientes. Se pide crear el/los objetos necesarios para que se imprima un cupón
con la leyenda "Recuerde solicitar su regalo sorpresa en su próxima compra" a
los clientes que, entre los productos comprados, hayan adquirido algún producto
de los siguientes rubros: PILAS y PASTILLAS y tengan un limite crediticio menor
a $ 15000.*/

create trigger regalar on item_factura after insert as
begin
	if exists(
		select 1 from  inserted join Producto on prod_codigo = item_producto join Factura
		on fact_numero+fact_sucursal+fact_tipo = item_numero+item_sucursal+item_tipo
		join Cliente on clie_codigo = fact_cliente
		where prod_rubro = 'PILAS' OR prod_rubro = 'PASTILLAS'
		and clie_limite_credito < 15000
	)
end







/*Cree el/los objetos de base de datos necesarios para que se cumpla la siguiente
regla de negocio automáticamente “Ningún jefe puede tener menos de 5 años de
antigüedad y tampoco puede tener más del 50% del personal a su cargo
(contando directos e indirectos) a excepción del gerente general”. Se sabe que en
la actualidad la regla se cumple y existe un único gerente general.*/

create trigger regularJefes on empleado after insert, update as begin
	if exists(
		select 1 from inserted 
		where (dbo.cantidadEmpleados(empl_codigo) > 0.5 * (select count(*) from Empleado) and empl_codigo <> (select empl_codigo from Empleado where empl_jefe = null))
		and datediff(year,empl_ingreso, getdate()) >= 5 
	) rollback
end

/*Sabiendo que el limite de credito de un cliente es el monto maximo que se le
puede facturar mensualmente, cree el/los objetos de base de datos necesarios
para que dicha regla de negocio se cumpla automaticamente. No se conoce la
forma de acceso a los datos ni el procedimiento por el cual se emiten las facturas*/

create trigger limiteCrediticio on factura after insert as begin
	if exists(
		select 1 from cliente join Factura on fact_cliente = clie_codigo
		group by clie_codigo, month(fact_fecha)
		having clie_limite_credito < sum(fact_total)
	) rollback
end


/*Crear el/los objeto/s necesarios para mantener actualizadas las comisiones del
vendedor.
El cálculo de la comisión está dado por el 5% de la venta total efectuada por ese
vendedor en ese mes, más un 3% adicional en caso de que ese vendedor haya
vendido por lo menos 50 productos distintos en el mes.*/

create trigger ajustarComision on factura after insert as begin
	declare @fecha smalldatetime
	declare facturas cursor for select fact_fecha from inserted i
	open facturas
	fetch facturas into @fecha
	while @@FETCH_STATUS = 0
	begin
		update Empleado set empl_comision = (select case when count(distinct fact_tipo + fact_numero + fact_sucursal) > 50 then sum(fact_total) * 0.08 else sum(fact_total) * 0.05 end
			from Factura where fact_vendedor = empl_codigo and 
			MONTH(fact_fecha) = MONTH(@fecha)
			and year(fact_fecha) = year(@fecha)
		)
		fetch facturas into @fecha
	end
	close facturas deallocate facturas
end