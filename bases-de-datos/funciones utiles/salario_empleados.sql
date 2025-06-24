create function [dbo].[salario_empleados](@jefe numeric(6))
returns decimal(12,2)
as
begin
	declare @salario_total decimal(12,2) = 0, @empleado numeric(6), @salario decimal(12,2)
	if (select count(*) from Empleado where empl_jefe = @jefe and empl_codigo > @jefe) = 0
		return @salario_total
	else
	begin
		declare cursor_empleados cursor for (select empl_codigo, empl_salario from Empleado where empl_jefe = @jefe)
		open cursor_empleados
		fetch next from cursor_empleados into @empleado, @salario
		while @@FETCH_STATUS = 0
		begin
			set @salario_total += @salario + dbo.salario_empleados(@empleado)
			fetch next from cursor_empleados into @empleado, @salario
		end
		close cursor_empleados
		deallocate cursor_empleados
	end
	return @salario_total
end