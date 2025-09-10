import express from 'express';
import { Alojamiento } from './domain.js';
import { precioMenorQue, alojamientoConId } from './funciones.js';
import {z} from 'zod';
const app = express();

app.get('/health', (req, res) => {
   res.send("ok")
})

app.use(express.json()); // toda request que me llega las acepto y formateo como json

app.get('/api/v1/alojamientos', (req, res) => {
  const max_price = req.query.max_price;
  if(!max_price){
    res.json(alojamientosADTO(alojamientos))
  }
  else{
    const filtrados = precioMenorQue(alojamientos, max_price);
    res.json(alojamientosADTO(filtrados))
  }
})

app.get('/api/v1/alojamientos/:id', (req, res) => {
  const resultId = Number(req.params.id);
  if (isNaN(resultId)) {
    return res.status(400).json({ error: "El id debe ser un número" });
  }
  const alojamiento = alojamientoConId(alojamientos, resultId);
  if (!alojamiento) {
    return res.status(404).json({ error: "Alojamiento no encontrado" });
  }
  res.json(alojamientoADTO(alojamiento))
})

app.post('/api/v1/alojamientos', (req, res) => {
  const body = req.body;
  const resultBody = alojamientoSchema.safeParse(body);
  if (resultBody.error) {
    res.status(400).json(resultBody.error.issues);
    return;
  }

  const nuevoAlojamientoDTO = resultBody.data
  const nuevoAlojamiento = new Alojamiento(nuevoAlojamientoDTO.nombre, nuevoAlojamientoDTO.precioPorNoche, nuevoAlojamientoDTO.categoria) 
  agregarElemento(nuevoAlojamiento)

  res.status(201).json(alojamientoADTO(nuevoAlojamiento)) // le digo lo creado al cliente, entre ellos el id

})

app.delete('/api/v1/alojamientos/:id', (req, res) => {
  const resultId = Number(req.params.id);
  if (isNaN(resultId)) {
    return res.status(400).json({ error: "El id debe ser un número" });
  }
  const alojamiento = alojamientoConId(alojamientos, resultId); // <-- agregar esta línea
  if (!alojamiento) {
    return res.status(404).json({ error: "Alojamiento no encontrado" });
  }
  borrarElemento(alojamiento);
  res.status(204).send();
})

app.put('/api/v1/alojamientos/:id', (req, res) => {
  const resultId = Number(req.params.id);
  if (isNaN(resultId)) {
    return res.status(400).json({ error: "El id debe ser un número" });
  }
  const alojamientoExistente = alojamientoConId(alojamientos, resultId); // <-- agregar esta línea
  if (!alojamientoExistente) {
    return res.status(404).json({ error: "Alojamiento no encontrado" });
  }
  const resultBody = alojamientoSchema.safeParse(req.body);
  if (resultBody.error) {
    res.status(400).json(resultBody.error.issues);
    return;
  }
  const nuevoAlojamientoDTO = resultBody.data
  alojamientoExistente.nombre = nuevoAlojamientoDTO.nombre;
  alojamientoExistente.precioPorNoche = nuevoAlojamientoDTO.precioPorNoche;
  alojamientoExistente.categoria = nuevoAlojamientoDTO.categoria; 
  
  res.status(200).json(alojamientoADTO(alojamientoExistente)) // le digo lo creado al cliente, entre ellos el id

})

app.listen(3000, () => {
  console.log("mi servidor re piola esta escuchando en 3000");//exposicion del servidor en el puerto 3000
});

const alojamientos = [];
function agregarElemento(elemento){
  elemento.id = alojamientos.length + 1;
  alojamientos.push(elemento);
}

agregarElemento(new Alojamiento("Hotel 1", 1000, "hotel", ["pileta","wifi"]));
agregarElemento(new Alojamiento("Hotel 2", 2000, "hotel", ["desayuno","wifi"]));
agregarElemento(new Alojamiento("Hotel 3", 1500, "hotel", ["pileta","desayuno"]));

function alojamientoADTO(alojamiento){
  return{
    id : alojamiento.id,
    nombre : alojamiento.nombre,
    precioPorNoche : alojamiento.precioPorNoche,
    categoria : alojamiento.categoria,
    caracteristicas : alojamiento.caracteristicas
  }
}

function alojamientosADTO(alojamientos){
  return alojamientos.map(alojamientoADTO);
}

const alojamientoSchema = z.object({
  nombre: z.string().min(3).max(100),
  precioPorNoche: z.number().min(0),
  categoria: z.string().min(3).max(100)
});
function borrarElemento(elemento){
  const indice = alojamientos.indexOf(elemento);
  alojamientos.splice(indice, 1);
}