import json
from fastapi import FastAPI
from fastapi.middleware import Middleware
from fastapi.responses import JSONResponse
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
from fastapi.encoders import jsonable_encoder

from BD import ConexionBD
    
class login(BaseModel):
    correo:str
    contrasena:str

class persona(BaseModel):
    contrasena:str
    correoElectronico:str
    nombre:str
    telefono:str
    
class seleccion(BaseModel):
    seleccion: str

class reserva(BaseModel):
    idRecurso: str
    fechaReserva: str
    inicioReserva: str
    finReserva: str

class reservaCancelar(BaseModel):
    idReserva: int    

app = FastAPI()

origins = [
    "http://localhost:4200"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post('/validate')
async def root(l:login):
    valid = ConexionBD.validarLogin(l.correo,l.contrasena)
    if valid:
        return {"message":"logeado correctamente",
                "codigo" : 202}
    else:
        return {"message":"El Correo o la contraseña son incorrectos, intente nuevamente",
                "codigo" : 404}


@app.post('/agregarUsuario')
async def root(s:persona):
    ConexionBD.agregarUsuario(s.nombre,s.telefono, s.correoElectronico, s.contrasena)
    return {"message":"hola mi loco"}

@app.post('/categoriaSeleccionada')
async def root(s:seleccion):
    result = ConexionBD.categoriaSeleccionada(s.seleccion)
    return {"message":"hola mi loco"}

@app.get('/listaCategoriaSeleccionada')
async def root():
    result = ConexionBD.consultarCategoriaSeleccionada()
    return {"data":result}

@app.get('/listaReservaActiva')
async def root():
    result = ConexionBD.consultarReservasActivas()
    return {"data":result}

@app.get('/listaHistorialReserva')
async def root():
    result = ConexionBD.consultarHistorialReservas()
    return {"data":result}

@app.post('/agregarReserva')
async def root(s:reserva):
    ConexionBD.agregarReserva(s.idRecurso,s.fechaReserva, s.inicioReserva, s.finReserva)
    return {"message":"hola mi loco"}

@app.post('/cancelarReserva')
async def root(s:reservaCancelar):
    ConexionBD.cancelarReserva(s.idReserva)
    return {"message":"hola mi loco"}

@app.post('/terminarReserva')
async def root(s:reservaCancelar):
    ConexionBD.terminarReserva(s.idReserva)
    return {"message":"hola mi loco"}