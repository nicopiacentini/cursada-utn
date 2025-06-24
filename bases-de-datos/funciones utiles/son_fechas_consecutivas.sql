create function [dbo].[son_fechas_consecutivas](@fecha1 smalldatetime, @fecha2 smalldatetime)
returns bit
as
begin
	if @fecha1 is not null and datediff(day, @fecha1, @fecha2) = 1
		return 1
	return 0
end