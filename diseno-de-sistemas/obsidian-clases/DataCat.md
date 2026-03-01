##### Dominio

```plantuml
class Aplicacion{
- nombre : String
- mediciones : List<Medicion>	
}
class Organizacion{
- nombre : String
- aplicaciones : List<Aplicacion>
}
Organizacion -->"*" Aplicacion

class Metrica{
- nombre: String
- unidad : String
}

class Medicion{
- metrica : Metrica
- valor : Float
- timeStamp : LocalDateTime
- tags : List<Tag>
+ tieneTagConValor(String) : Bool
}

class Tag{
	- nombre : String
	- valor? : String//depende de si hay tags por defecto
}

class Consulta{
- nombre : String
- metrica : Metrica
- agrupacion : IAgrupacion
}

interface Filtro{
+ cumpleMedicion(Medicion) : Bool
}

Medicion --"*" Tag
Aplicacion --"*" Medicion
Metrica o--> Medicion
```

1. La organizacion esta para ser persistida y que cada usuario organizacion tenga seguimiento de sus varias apps. 
2. La app esta para ser persistida y referenciada por la metrica
3. Los tag como de cliente/organizacion entran por defecto. No amerita pregunta-respuesta
4. 