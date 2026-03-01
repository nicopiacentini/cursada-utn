##### Notas
Organizaciones
- nombre
- razon social
- industria a la que pertenecen -> Clase (no creo enum)
- Descripcion
- Logo -> URL
- Redes sociales -> Lista\<RedSocial\> -> RedSocial tiene URL y enum apuntando a redSocial
- Son usuarios
Creador de contenido
- nombre
- dni
- nacionalidad
- fechaNacimiento
- correoElectronico
- telefono (nullable)
- Lista RedSocial
Portafolio -> Lista campañas
Campaña
- Fecha Publicacion
- industria
- redesSociales
- TipoVideo -> Clase?
- ContentCreator
Doy user y concentrador da lista de campañas
Campaña y criterios
OfertaCampaña
- organizacion
- cantidadVideos
- producto con fotos y descripcion
- tipo-tipos de video
- redes sociales
- criterios -> Peso
Postulacion
- OfertaCampaña
- ContentCreator




___

### Dominio
```plantuml
@startuml
class Organizacion{
- nombre : String
- razonSocial : String
- industria : Industria
- descripcion : String
- logo : Logo
- email : String
- redesSociales : List<RedSocial>
- campanas : List<Campana>
}
Organizacion -->"*" Campana

Organizacion --> Industria
class Industria{
- nombre : String
- descripcion : String
}
class CreadorDeContenido{
- nombre : String
- nroDNI : String
- nacionalidad : Nacionalidad
- email : String
- telefono : String (nullable)
- redesSociales : List<RedSocial>
- campanias : List<Campana>
}

Organizacion -->"*" RedSocial
Campana --> Industria
CreadorDeContenido --> Nacionalidad
CreadorDeContenido -->"*" Campana
CreadorDeContenido -->"*" RedSocial

Video *--> TipoVideo
ImportadorDeCampaña ..> CreadorDeContenido
Campana -->"*" Video
RedSocial 0-- NombreRedSocial
class Campana{
- fechaPublicacion : LocalDate
- industria : Industria
- redesSociales : List<RedSocial>
- videos : List<Video>
}
class Video{
	descripcion : String
	tipoVideo : TipoVideo
}

class TipoVideo{
	nombre : String
	descripcion : string
}

Campana -->"*" RedSocial
class RedSocial{
	nombre: NombreRedSocial
	url : String
}

Enum NombreRedSocial{
	X
	INSTAGRAM
	YOUTUBE
}

Enum Nacionalidad{
ARGENTINA,
ANGOLA,
...
}

class ImportadorDeCampaña{
+ importarCampañas(Usuario) : List<Campaña>
}

class OfertaCampana{
- fechaEntrega : LocalDate
- cantidadVideosMinimo : Integer
- producto : Producto
- tiposVideo : List<TipoVideo>
- criterios : List<CriterioRecomendacion>
}
OfertaCampana o--> ICriterioRecomendacion
interface ICriterioRecomendacion{
+evaluarCreadorcontenido(CreadorContenido) : Float
}
class CriterioTieneCuentaEnRedSocial implements ICriterioRecomendacion{
- redSocial : RedSocial
+evaluarCreadorcontenido(CreadorContenido) : Float
}
ICriterioRecomendacion ..> CreadorDeContenido

Organizacion -->"*" OfertaCampana

class Postulacion{
- creadorDeContenido : CreadorDeContenido
- OfertaCampana : OfertaCampana
- fecha : LocalDateTime
}
 Postulacion o-- CreadorDeContenido
 Postulacion o-- OfertaCampana
OfertaCampana --> Producto
class Producto{
	nombre : string
	descripcion : String
	fotos : List<String> //urls
}
@enduml
```

##### Desiciones de diseno
1. Las industria tienen ABM y son clases por consistencia de datos.
2. Son clases para poder perssistir (organizaciones e industrias)
3. Los tipos de video son los persistidos o configurables por usuario
4. La red social es la pagina y el tipo de redo social del usuario
5. Si cargo campañas con concentrador solo se las cargo al ContentCreator, no necesito la Organizacion
   
   
#### Arquitectura
1. Propongo keycloack como componente de autenticacion/autorizacion. Con este los usuarios podran loguearse y tener sus permisos segun lo que les corresponda y podran hacer aquello que les corresponda. Dicho componente funcionara de la siguiente forma. Cuando el usuario inicie sesion o quiera realizar una accion que requiera persmisos sin estar logueado, se lo redigira a este componente para que el usuario se loguee. Luego, el usuario sera entregado un token o jwt y otro de refresco con el que contara con sus permisos y podra acceder a sus funcionalidades en el sistema. Cuando venca el token, se podra extender.
2. Si puedo elegir yo la forma de integracion y tengo libertad para hacerlo, elegiria una cola de mensajes para realizarlo de forma asincrona. Esto es porque soy conciente que puede llegar a ser un proceso pesado y si tengo que hacer esto por cada ofertaCampana sincronicamente tardaria mucho. De aqui depende de lo que me ofrezca el recomendador ya que como no se como estas implementado y/o si puede actuar como consumidor en una cola de mensajes o no, mi componente principal queda como productor, luego la cola de mensajes y luego un componente opcional que pullee una por una los elementos de la cola para que pueda procesarlo el recomendador
3. 