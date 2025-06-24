create function [dbo].[precio_componentes](@prod char(8))
returns decimal(12,2)
as 
BEGIN
    declare @precio_producto decimal(12,2), @comp char(8), @cantidad decimal(12,2), @precio_comp decimal(12,2)
    if (select count(*) from composicion where comp_producto = @prod) = 0
        select @precio_producto = (select prod_precio from producto where prod_codigo = @prod)
    else
    begin 
        declare compo cursor for select comp_componente, comp_Cantidad from composicion 
                                    join producto on prod_codigo = comp_componente 
                                    where comp_producto = @prod 
        open compo 
        fetch next from compo into @comp, @cantidad
        select @precio_producto = 0
        while @@FETCH_STATUS = 0
        begin
            select @precio_producto = @precio_producto + @cantidad * dbo.precio_componentes(@comp)
            fetch compo into @comp, @cantidad
        END
        close compo 
        deallocate compo 
    END
    return @precio_producto
END