from datetime import datetime
import oracledb
import random
import sqlite3
import json

class ConexionBD:

    user = "AdminIntegraServicios"
    password = "Administrador0"
    port = 1521
    categoriaCatalogo = 1
    seleccionTipoCamiseta = str
    idUsuarioValido= str
    seleccionCategoria = str
    total = str
    
    def validarLogin(correo,contrasena):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        query = "select idpersona, correoelectronico, contrasena from persona"
        cursor.execute(query)
        result = cursor.fetchall()
        print(result)
        for r in result:
            if r[1] == correo and r[2] == contrasena:
                ConexionBD.idUsuarioValido = r[0]
                return True
        return False
    
    def maximoUsuario():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        query = "SELECT COUNT(idPersona)+1 FROM persona"
        cursor.execute(query)
        result = cursor.fetchall()
        return result[0][0]
    
    def maximaReserva():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        query = "SELECT COUNT(idReserva)+1 FROM reserva"
        cursor.execute(query)
        result = cursor.fetchall()
        return result[0][0]
    
    def agregarUsuario(nombre, telefono, correo, contrasena):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        query = "INSERT INTO persona values('"+str(ConexionBD.maximoUsuario())+"','"+nombre+"','"+telefono+"','"+correo+"','"+contrasena+"')"
        result = cursor.execute(query)
        connection.commit()
        connection.close()
        return result
      
    def categoriaSeleccionada(seleccion):
        ConexionBD.seleccionCategoria = seleccion
        print(seleccion)
        return seleccion
    
    def consultarCategoriaSeleccionada():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        seleccion = ConexionBD.seleccionCategoria
        cursor.execute("SELECT r.idRecurso, r.idFisicos, f.capacidad, f.detalle, r.idTipo, t.nombre, to_char(r.iniciodisponibilidad, 'hh24:mi') as InicioDisponibilidad, to_char(r.finDisponibilidad, 'hh24:mi') as FinDisponibilidad, r.nombre, r.descripcion, r.estado from recurso r, tiporecurso t, espaciosfisicos f where r.idFisicos = f.idFisicos and r.idTipo = t.idTipo and r.idTipo ='"+seleccion+"'")
        result = cursor.fetchall()
        connection.close()
        return result
    
    def agregarReserva(idRecurso, fechaReserva, inicioReserva, finReserva):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        usuario = ConexionBD.idUsuarioValido
        query = "INSERT INTO reserva values('"+str(ConexionBD.maximaReserva())+"','"+str(usuario)+"','"+idRecurso+"',TO_DATE('"+fechaReserva+"', 'yyyy-mm-dd'),TO_DATE('"+inicioReserva+"', 'hh24:mi'),TO_DATE('"+finReserva+"', 'hh24:mi'),'Activa','A tiempo')"
        result = cursor.execute(query)
        connection.commit()
        connection.close()
        return result
    
    def consultarReservasActivas():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        usuario = ConexionBD.idUsuarioValido
        cursor.execute("SELECT r.idReserva, c.nombre, c.descripcion, e.detalle, to_char(r.fechaReserva, 'yyyy-mm-dd'), to_char(r.inicioReserva, 'hh24:mi'), to_char(r.finReserva, 'hh24:mi'), r.estado, r.detalles from reserva r, recurso c, espaciosfisicos e where r.estado = 'Activa' and r.idpersona = "+str(usuario)+" and c.idRecurso = r.idRecurso and e.idFisicos = c.idFisicos")
        result = cursor.fetchall()
        connection.close()
        return result
    
    def consultarHistorialReservas():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        usuario = ConexionBD.idUsuarioValido
        cursor.execute("SELECT r.idReserva, c.nombre, c.descripcion, e.detalle, to_char(r.fechaReserva, 'yyyy-mm-dd'), to_char(r.inicioReserva, 'hh24:mi'), to_char(r.finReserva, 'hh24:mi'), r.estado, r.detalles from reserva r, recurso c, espaciosfisicos e where r.estado not like 'Activa' and r.idpersona = "+str(usuario)+" and c.idRecurso = r.idRecurso and e.idFisicos = c.idFisicos")
        result = cursor.fetchall()
        connection.close()
        return result
    
    def cancelarReserva(idReserva):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        usuario = ConexionBD.idUsuarioValido
        query = "UPDATE reserva set estado = 'Cancelado' where idReserva = '"+str(idReserva)+"'"
        result = cursor.execute(query)
        connection.commit()
        connection.close()
        ConexionBD.cambiarDetalle(idReserva)
        return result
    
    def terminarReserva(idReserva):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        usuario = ConexionBD.idUsuarioValido
        query = "UPDATE reserva set estado = 'Terminada' where idReserva = '"+str(idReserva)+"'"
        result = cursor.execute(query)
        connection.commit()
        connection.close()
        ConexionBD.cambiarDetalleTerminado(idReserva)
        return result
    
    def cambiarDetalle(idReserva):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        usuario = ConexionBD.idUsuarioValido
        query = "UPDATE reserva set detalles = 'Cancelado antes de efectuar' where idReserva = '"+str(idReserva)+"'"
        result = cursor.execute(query)
        connection.commit()
        connection.close()
        return result
    
    def cambiarDetalleTerminado(idReserva):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port = ConexionBD.port, service_name="xe")
        cursor = connection.cursor()
        usuario = ConexionBD.idUsuarioValido
        query = "UPDATE reserva set detalles = 'Recurso devuelto a tiempo' where idReserva = '"+str(idReserva)+"'"
        result = cursor.execute(query)
        connection.commit()
        connection.close()
        return result