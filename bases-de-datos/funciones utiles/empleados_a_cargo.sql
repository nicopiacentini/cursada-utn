create function [dbo].[empleados_a_cargo](@jefe numeric(6))
returns int
as
begin
	declare @empleado numeric(6), @cantidad int
	set @cantidad = (select count(*) from Empleado where empl_jefe = @jefe and empl_codigo > @jefe)
	declare c1 cursor for (select empl_codigo from Empleado where empl_jefe = @jefe)
	open c1
	fetch next from c1 into @empleado
	while @@FETCH_STATUS = 0
	begin
		set @cantidad += dbo.empleados_a_cargo(@empleado)
		fetch next from c1 into @empleado
	end
	close c1
	deallocate c1
	return @cantidad
end