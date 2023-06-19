drop table PROVEEDOR cascade constraints;
drop table PRODUCTO cascade constraints;
drop table CLIENTE cascade constraints;
drop table TIPOBOLETA cascade constraints;
drop table MEDIOPAGO cascade constraints;
drop table COMPRA cascade constraints;
drop table DETALLECOMPRA cascade constraints;
drop sequence sq_compra;
drop sequence sq_producto;

CREATE TABLE PROVEEDOR(
        id_proveedor integer not null,
        rut         integer not null, 
        dv          varchar2(1) not null,
        nom_proveedor varchar2(100) not null,
        giro        varchar2(150) not null
);
alter table PROVEEDOR 
    add constraint pk_id_proveedor primary key(id_proveedor);
--describe PROVEEDOR;

create table PRODUCTO (
    id_producto integer not null,
    nom_producto varchar2(100) not null,
    desc_producto clob,
    stock integer not null,
    f_vencimiento date not null,
    proveedor_id_proveedor integer 
);
alter table PRODUCTO
    add constraint pk_id_producto primary key(id_producto);
    
create table CLIENTE(
    run integer not null primary key,
    dv varchar2(1) not null,
    nombre varchar2(100) not null,
    apellido1 varchar2(100) not null,
    apellido2 varchar2(100) not null
);

create table TIPOBOLETA(
    id_tipoboleta integer not null primary key,
    tipoboleta varchar2(20) not null
);

create table MEDIOPAGO(
    id_mediopago integer not null primary key,
    mediopago varchar2(20) not null
);
create table compra(
    id_compra integer not null primary key,
    tipoboleta_id_tipoboleta integer not null,
    mediopago_id_mediopago integer not null,
    cliente_run integer
);
create table DETALLECOMPRA(
    id_detallecompra integer not null primary key,
    producto_id_producto integer not null,
    compra_id_compra integer not null,
    cantidad integer not null,
    precio integer not null
);
----- RELACIONES QUE APUNTAN HACIA COMPRA
--Relación de compra con tipoboleta
alter table COMPRA 
    add constraint fk_id_tipoboleta foreign key(tipoboleta_id_tipoboleta)
        references TIPOBOLETA(id_tipoboleta);
--Relación de compra con cliente
alter table COMPRA 
    add constraint fk_cliente_run foreign key(cliente_run) 
        references CLIENTE(run);
--Relación de compra con medio de pago
alter table COMPRA 
    add constraint fk_mediopago foreign key(mediopago_id_mediopago)
        references MEDIOPAGO(id_mediopago);
--RELACIONES QUE APUNTAN HACIA PRODUCTO
alter table PRODUCTO
    add constraint fk_id_proveedor foreign key(proveedor_id_proveedor)
        references PROVEEDOR(id_proveedor);
-- RELACION QUE APUNTA HACIA DETALLECOMPRA
alter table DETALLECOMPRA
    add constraint fk_id_producto foreign key(producto_id_producto)
        references PRODUCTO(id_producto);
alter table DETALLECOMPRA
    add constraint fk_id_compra foreign key(compra_id_compra)
        references COMPRA(id_compra);
        
---- SECUENCIAS - INSERT

create sequence sq_compra start with 10 increment by 10;
create sequence sq_producto start with 100 increment by 2;

--- INSERT CLIENTE
describe cliente;
insert into CLIENTE values (23777372,'K','josé','acuña','haro');
insert into CLIENTE values (23723271,'1','Aylen','acuña','haro');
insert into CLIENTE values (17777372,'2','Fernanda','Soto','haro');
insert into CLIENTE values (16777372,'5','Priscila','Alvarez','haro');
insert into CLIENTE values (15777372,'7','Erika','Oportot','haro');
insert into CLIENTE values (23777362,'9','Denisse','Vargas','haro');
insert into CLIENTE values (08777372,'K','juan','Alvarez','haro');
insert into CLIENTE values (23277372,'K','esteban','Cisternas','haro');
select * from cliente;

-- INSERT TIPOBOLETA
describe tipoboleta;
insert into TIPOBOLETA values(1,'boleta');
insert into TIPOBOLETA values(2,'factura');
select * from TIPOBOLETA;

-- INSERT MEDIOPAGO
describe MEDIOPAGO;
insert into MEDIOPAGO values(1,'débito');
insert into MEDIOPAGO values(2,'crédito');
insert into MEDIOPAGO values(3,'efectivo');
select * from MEDIOPAGO;

--INSERT PROVEEDOR
describe proveedor;
insert into PROVEEDOR values(1,23777372,'K','Mundo dulce','Venta de confites');
insert into PROVEEDOR values(2,23777372,'K','Mundo salado','Venta de snacks');
select * from proveedor;

--INSERT PRODUCTO
describe producto;
insert into PRODUCTO values(sq_producto.nextval,'Chocolate','Barra de chocolate con nueces',10,to_date('2023-06-16','YYYY-MM-DD'),1);
insert into PRODUCTO values(sq_producto.nextval,'Pan','Pan surtido',100,to_date('15-JUN-2023','DD-MON-YYYY'),null);
select * from producto;

-- INSERT COMPRA
describe COMPRA;
select * from tipoboleta;
select * from mediopago;
insert into COMPRA values(sq_compra.nextval,1,3,null);
insert into COMPRA values(sq_compra.nextval,2,3,null);
select * from compra;

--INSERT DETALLECOMPRA
select * from producto;
select * from compra;
insert into DETALLECOMPRA values(1,102,10,10,3000);
insert into DETALLECOMPRA values(2,100,10,20,4000);
insert into DETALLECOMPRA values(3,102,10,15,3000);

Select * from detallecompra;


--------------EJERCICIO 2-------------------
drop table categoria cascade constraints;
drop table equipo cascade constraints;
drop table prioridad cascade constraints;
drop table tipo cascade constraints;
drop table cliente cascade constraints;
drop table region cascade constraints;
drop table comuna cascade constraints;
drop table sucursal cascade constraints;



CREATE TABLE categoria (
    id_categoria  INTEGER NOT NULL,
    nom_categoria VARCHAR2(100) NOT NULL
);
ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE equipo (
    id_equipo  INTEGER NOT NULL,
    nom_equipo VARCHAR2(100) NOT NULL
);
ALTER TABLE equipo ADD CONSTRAINT equipo_pk PRIMARY KEY ( id_equipo );

CREATE TABLE prioridad (
    id_prioridad INTEGER NOT NULL,
    prioridad    VARCHAR2(15) NOT NULL
);
ALTER TABLE prioridad ADD CONSTRAINT prioridad_pk PRIMARY KEY ( id_prioridad );

create table tipo(
    id_tipo integer not null primary key ,
    tipo varchar2(30) not null
);
create table cliente(
    id_cliente integer not null primary key,
    nombre varchar2(100) not null,
    apellidos varchar2(100) not null
);

create table region(
    id_region integer not null primary key,
    nom_region varchar2(50) not null
);
create table comuna(
    id_comuna integer not null primary key,
    nom_comuna varchar2(50) not null,
    region_id_region integer not null
);
create table sucursal(
    id_sucursal integer not null primary key,
    nom_sucursal varchar2(100) not null,
    direccion varchar2(100) not null,
    comuna_id_comuna integer not null
);
create table ticket(
    id_ticket integer not null primary key,
    asunto varchar2(100) not null,
    descripcion clob not null,
    f_h_registro date not null,
    cliente_id_cliente integer not null,
    prioridad_id_prioridad integer not null,
    tipo_id_tipo integer not null,
    categoria_id_categoria integer not null
);
create table soporte(
    id_soporte integer not null primary key,
    ticket_id_ticket integer not null,
    equipo_id_equipo integer not null,
    sucursal_id_sucursal integer not null
);

---RELACIONES
-- RELACION DE TICKET CON PRIORIDAD
alter table ticket 
    add constraint TICKET_PRIORIDAD_FK foreign key (prioridad_id_prioridad)
        references PRIORIDAD(id_prioridad);
alter table ticket 
    add constraint TICKET_TIPO_FK foreign key(tipo_id_tipo)
        references TIPO(id_tipo);
alter table ticket 
    add constraint TICKET_CATEGORIA_FK foreign key(categoria_id_categoria)
        references CATEGORIA(id_categoria);
alter table ticket
    add constraint TICKET_CLIENTE_FK foreign key(cliente_id_cliente)
        references CLIENTE(id_cliente);
        
---RELACIONES REGION CON COMUNA
alter table comuna
    add constraint COMUNA_ID_REGION_FK foreign key(region_id_region)
        references REGION(id_region);
-- RELACION COMUNA SUCURSAL
alter table sucursal
    add constraint SUCURSAL_ID_COMUNA foreign key(comuna_id_comuna)
        references COMUNA(id_comuna);
--RELACIONES DE SOPORTE
alter table soporte
    add constraint SOPORTE_SUCURSAL_FK foreign key(sucursal_id_sucursal)
        references SUCURSAL(id_sucursal);
alter table soporte 
    add constraint SOPORTE_EQUIPO_FK foreign key(equipo_id_equipo)
        references EQUIPO(id_equipo);
alter table soporte
    add constraint SOPORTE_TICKET_FK foreign key(ticket_id_ticket)
        references TICKET(id_ticket);
 
drop sequence  sq_region;
drop sequence  sq_comuna ;
drop sequence  sq_sucursal ;
drop sequence  sq_soporte ;
drop sequence  sq_equipo;
drop sequence  sq_categoria ;
drop sequence  sq_tipo ;
drop sequence  sq_prioridad ;
drop sequence  sq_ticket ;
drop sequence  sq_cliente ;
        
create sequence sq_region start with 1 increment by 1;
create sequence sq_comuna start with 1 increment by 1;
create sequence sq_sucursal start with 1 increment by 1;
create sequence sq_soporte start with 1 increment by 1;
create sequence sq_equipo start with 1 increment by 1;
create sequence sq_categoria start with 1 increment by 1;
create sequence sq_tipo start with 1 increment by 1;
create sequence sq_prioridad start with 1 increment by 1;
create sequence sq_ticket start with 1 increment by 1;
create sequence sq_cliente start with 5 increment by 5;

---INSERT
insert into equipo values(sq_equipo.nextval,'Computador');
insert into equipo values(sq_equipo.nextval,'Laptop');

--
insert into region values(sqz_region.nextval,'Metropolitana');
insert into region values(sq_region.nextval,'Valparaíso');

describe comuna;
insert into comuna values(sq_comuna.nextval,'Puente Alto',1);
insert into comuna values(sq_comuna.nextval,'Viña Del Mar',2);


