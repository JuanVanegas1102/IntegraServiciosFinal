/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     04/06/2024 08:26:09 p. m.                    */
/*==============================================================*/


alter table EMPLEADO
   drop constraint FK_EMPLEADO_PUEDE_SER_PERSONA;

alter table RECURSO
   drop constraint FK_RECURSO_DETALLA_ESPACIOS;

alter table RECURSO
   drop constraint FK_RECURSO_PERTENECE_TIPORECU;

alter table RESERVA
   drop constraint FK_RESERVA_ESTA_RECURSO;

alter table RESERVA
   drop constraint FK_RESERVA_HACE_PERSONA;

alter table UNIDADSERVICIO
   drop constraint FK_UNIDADSE_COMPONE_RECURSO;

alter table UNIDADSERVICIO
   drop constraint FK_UNIDADSE_TRABAJA_EMPLEADO;

drop index PUEDE_SER_FK;

drop table EMPLEADO cascade constraints;

drop table ESPACIOSFISICOS cascade constraints;

drop table PERSONA cascade constraints;

drop index PERTENECE_FK;

drop index DETALLA_FK;

drop table RECURSO cascade constraints;

drop index ESTA_FK;

drop index HACE_FK;

drop table RESERVA cascade constraints;

drop table TIPORECURSO cascade constraints;

drop index COMPONE_FK;

drop table UNIDADSERVICIO cascade constraints;

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO 
(
   IDUNIDAD             NUMBER(10)           not null,
   IDPERSONA            NUMBER(10)           not null,
   constraint PK_EMPLEADO primary key (IDUNIDAD)
);

/*==============================================================*/
/* Index: PUEDE_SER_FK                                          */
/*==============================================================*/
create index PUEDE_SER_FK on EMPLEADO (
   IDPERSONA ASC
);

/*==============================================================*/
/* Table: ESPACIOSFISICOS                                       */
/*==============================================================*/
create table ESPACIOSFISICOS 
(
   IDFISICOS            VARCHAR2(10)         not null,
   CAPACIDAD            NUMBER(2)            not null,
   DETALLE              VARCHAR2(200),
   constraint PK_ESPACIOSFISICOS primary key (IDFISICOS)
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA 
(
   IDPERSONA            NUMBER(10)           not null,
   NOMBRE               VARCHAR2(250)        not null,
   TELEFONO             NUMBER(10)           not null,
   CORREOELECTRONICO    VARCHAR2(200)        not null,
   CONTRASENA           VARCHAR2(200)        not null,
   constraint PK_PERSONA primary key (IDPERSONA)
);

/*==============================================================*/
/* Table: RECURSO                                               */
/*==============================================================*/
create table RECURSO 
(
   IDRECURSO            VARCHAR2(10)         not null,
   IDFISICOS            VARCHAR2(10),
   IDTIPO               VARCHAR2(10)         not null,
   INICIODISPONIBILIDAD DATE,
   FINDISPONIBILIDAD    DATE,
   NOMBRE               VARCHAR2(200)        not null,
   DESCRIPCION          VARCHAR2(250)        not null,
   ESTADO               VARCHAR2(50)         not null,
   constraint PK_RECURSO primary key (IDRECURSO)
);

/*==============================================================*/
/* Index: DETALLA_FK                                            */
/*==============================================================*/
create index DETALLA_FK on RECURSO (
   IDFISICOS ASC
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create index PERTENECE_FK on RECURSO (
   IDTIPO ASC
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA 
(
   IDRESERVA            NUMBER(10)           not null,
   IDPERSONA            NUMBER(10)           not null,
   IDRECURSO            VARCHAR2(10)         not null,
   FECHARESERVA         DATE                 not null,
   INICIORESERVA        DATE                 not null,
   FINRESERVA           DATE                 not null,
   ESTADO               VARCHAR2(20)         not null,
   DETALLES             VARCHAR2(50)         not null,
   constraint PK_RESERVA primary key (IDRESERVA)
);

/*==============================================================*/
/* Index: HACE_FK                                               */
/*==============================================================*/
create index HACE_FK on RESERVA (
   IDPERSONA ASC
);

/*==============================================================*/
/* Index: ESTA_FK                                               */
/*==============================================================*/
create index ESTA_FK on RESERVA (
   IDRECURSO ASC
);

/*==============================================================*/
/* Table: TIPORECURSO                                           */
/*==============================================================*/
create table TIPORECURSO 
(
   IDTIPO               VARCHAR2(10)         not null,
   NOMBRE               VARCHAR2(200)        not null,
   constraint PK_TIPORECURSO primary key (IDTIPO)
);

/*==============================================================*/
/* Table: UNIDADSERVICIO                                        */
/*==============================================================*/
create table UNIDADSERVICIO 
(
   IDUNIDADSERVICIO     VARCHAR2(20)         not null,
   IDRECURSO            VARCHAR2(10)         not null,
   IDUNIDAD             NUMBER(10)           not null,
   INICIOHORARIODISPONIBLE DATE                 not null,
   FINHORARIODISPONIBLE DATE                 not null,
   DIAINICIO            VARCHAR2(20)         not null,
   DIAFIN               VARCHAR2(20)         not null,
   constraint PK_UNIDADSERVICIO primary key (IDUNIDADSERVICIO)
);

/*==============================================================*/
/* Index: COMPONE_FK                                            */
/*==============================================================*/
create index COMPONE_FK on UNIDADSERVICIO (
   IDRECURSO ASC
);

alter table EMPLEADO
   add constraint FK_EMPLEADO_PUEDE_SER_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA);

alter table RECURSO
   add constraint FK_RECURSO_DETALLA_ESPACIOS foreign key (IDFISICOS)
      references ESPACIOSFISICOS (IDFISICOS);

alter table RECURSO
   add constraint FK_RECURSO_PERTENECE_TIPORECU foreign key (IDTIPO)
      references TIPORECURSO (IDTIPO);

alter table RESERVA
   add constraint FK_RESERVA_ESTA_RECURSO foreign key (IDRECURSO)
      references RECURSO (IDRECURSO);

alter table RESERVA
   add constraint FK_RESERVA_HACE_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA);

alter table UNIDADSERVICIO
   add constraint FK_UNIDADSE_COMPONE_RECURSO foreign key (IDRECURSO)
      references RECURSO (IDRECURSO);

alter table UNIDADSERVICIO
   add constraint FK_UNIDADSE_TRABAJA_EMPLEADO foreign key (IDUNIDAD)
      references EMPLEADO (IDUNIDAD);

