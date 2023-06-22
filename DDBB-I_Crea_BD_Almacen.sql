DROP TABLE zona CASCADE CONSTRAINTS;
DROP TABLE marca CASCADE CONSTRAINTS;
DROP TABLE producto CASCADE CONSTRAINTS;
DROP TABLE factura CASCADE CONSTRAINTS;
DROP TABLE detallefactura CASCADE CONSTRAINTS;
DROP TABLE vendedor CASCADE CONSTRAINTS;
DROP TABLE categoria CASCADE CONSTRAINTS;
DROP TABLE comuna CASCADE CONSTRAINTS;
DROP TABLE cliente CASCADE CONSTRAINTS;
DROP TABLE totalventas CASCADE CONSTRAINTS;

CREATE TABLE zona (
    id_zona     NUMBER(3) NOT NULL,
    nom_zona    VARCHAR2(10) NOT NULL,
    porc        NUMBER(5,2) NOT NULL,
    CONSTRAINT pk_id_zona PRIMARY KEY (id_zona)
);

CREATE TABLE marca (
    id_marca NUMBER(4) GENERATED ALWAYS AS IDENTITY MINVALUE 1000 MAXVALUE 9999 START WITH 1000 INCREMENT BY 10,
    nom_marca VARCHAR2(25) NOT NULL,
    CONSTRAINT pk_id_marca PRIMARY KEY (id_marca)
);

CREATE TABLE producto (
    id_articulo     NUMBER(3) NOT NULL,
    nom_articulo    VARCHAR2(25) NOT NULL,
    precio          NUMBER NOT NULL,
    stock_actual    NUMBER(4) NOT NULL,
    stock_minimo    NUMBER(4) NOT NULL,
    id_marca        NUMBER(4) GENERATED ALWAYS AS IDENTITY MINVALUE 1000 MAXVALUE 9999 START WITH 1000 INCREMENT BY 10,
    CONSTRAINT pk_articulo PRIMARY KEY (id_articulo),
    CONSTRAINT fk_marca FOREIGN KEY (id_marca) REFERENCES marca (id_marca),
    CONSTRAINT stock_actual CHECK (stock_actual > stock_minimo)
);

CREATE TABLE categoria (
    id_categoria    NUMBER(3) NOT NULL,
    nom_categoria   VARCHAR2(20) NOT NULL,
    porcentaje      NUMBER(5,2) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
);

CREATE TABLE vendedor (
    id_vendedor     NUMBER(3) NOT NULL,
    rut_vendedor    VARCHAR2(10) NOT NULL,
    nombres         VARCHAR2(10) NOT NULL,
    paterno         VARCHAR2(10) NOT NULL,
    materno         VARCHAR2(10) NULL,
    fecnac          DATE NOT NULL,
    feccontrato     DATE NOT NULL,
    sueldo          NUMBER(10) NOT NULL,
    comision        NUMBER(5,2) NOT NULL,
    id_zona         NUMBER(3) NULL,
    id_categoria    NUMBER(3) NOT NULL,
    CONSTRAINT pk_vendedor PRIMARY KEY(id_vendedor),
    CONSTRAINT ak_vendedor UNIQUE (rut_vendedor),
    CONSTRAINT fk_vendedor_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE comuna (
    id_comuna   NUMBER(3) GENERATED ALWAYS AS IDENTITY MINVALUE 100 MAXVALUE 999 START WITH 100 INCREMENT BY 5,
    nom_comuna  VARCHAR2(60) NOT NULL,
    CONSTRAINT pk_comuna PRIMARY KEY (id_comuna)
);

CREATE TABLE cliente (
    id_cliente      NUMBER(3) NOT NULL,
    nombre_cliente  VARCHAR2(35) NOT NULL,
    direccion       VARCHAR2(50) NOT NULL,
    telefono        NUMBER(10) NOT NULL,
    id_comuna       NUMBER(3) NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT fk_cliente_comuna FOREIGN KEY (id_comuna) REFERENCES comuna (id_comuna)
);

CREATE TABLE factura (
    id_factura      NUMBER(5) GENERATED ALWAYS AS IDENTITY MINVALUE 10000 MAXVALUE 99999 START WITH 10000 INCREMENT BY 10,
    id_cliente      NUMBER(3) NOT NULL,
    id_vendedor     NUMBER(3) NOT NULL,
    fecha_factura   DATE DEFAULT SYSDATE,
    CONSTRAINT pk_factura PRIMARY KEY (id_factura),
    CONSTRAINT fp_factura_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT fp_factura_vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor (id_vendedor)
);

CREATE TABLE detallefactura (
    id_factura  NUMBER(5) NOT NULL,
    id_articulo NUMBER(1) NOT NULL,
    cantidad    NUMBER(5) NOT NULL,
    CONSTRAINT pk_detallefactura PRIMARY KEY (id_factura, id_articulo),
    CONSTRAINT fk_factura_detallefactura FOREIGN KEY (id_factura) REFERENCES factura (id_factura)
);

INSERT INTO zona (id_zona, nom_zona, porc) VALUES (1, 'Norte', 8.56);
INSERT INTO zona (id_zona, nom_zona, porc) VALUES (2, 'Sur', 10.48);
INSERT INTO zona (id_zona, nom_zona, porc) VALUES (3, 'Oriente C', 11.27);
INSERT INTO zona (id_zona, nom_zona, porc) VALUES (4, 'Poniente', 7.24);
INSERT INTO zona (id_zona, nom_zona, porc) VALUES (5, 'Centro', 7.24);

INSERT INTO marca (nom_marca) VALUES ('Familand');
INSERT INTO marca (nom_marca) VALUES ('Nivea');
INSERT INTO marca (nom_marca) VALUES ('Dove');
INSERT INTO marca (nom_marca) VALUES ('Gillete');
INSERT INTO marca (nom_marca) VALUES ('Monterrey');

INSERT INTO producto (id_articulo, nom_articulo, precio, stock_actual, stock_minimo) VALUES (1,'JABON',1250,150,80);
INSERT INTO producto (id_articulo, nom_articulo, precio, stock_actual, stock_minimo) VALUES (2,'SHAMPOO',2325,50,20);
INSERT INTO producto (id_articulo, nom_articulo, precio, stock_actual, stock_minimo) VALUES (3,'ACONDICIONADOR',2100,200,50);
INSERT INTO producto (id_articulo, nom_articulo, precio, stock_actual, stock_minimo) VALUES (4,'CREMA DE AFEITAR',3475,50,20);
INSERT INTO producto (id_articulo, nom_articulo, precio, stock_actual, stock_minimo) VALUES (5,'CAFE',3500,80,40);

INSERT INTO comuna (nom_comuna) VALUES ('Providencia');
INSERT INTO comuna (nom_comuna) VALUES ('Santiago');
INSERT INTO comuna (nom_comuna) VALUES ('Ñuñoa');
INSERT INTO comuna (nom_comuna) VALUES ('La Florida');
INSERT INTO comuna (nom_comuna) VALUES ('Maipú');

INSERT INTO categoria (id_categoria, nom_categoria, porcentaje) VALUES (1, 'Categoria A', 17.5);
INSERT INTO categoria (id_categoria, nom_categoria, porcentaje) VALUES (2, 'Categoria B', 12.6);
INSERT INTO categoria (id_categoria, nom_categoria, porcentaje) VALUES (3, 'Categoria C',9.4);
INSERT INTO categoria (id_categoria, nom_categoria, porcentaje) VALUES (4, 'Categoria D', 7.2);
INSERT INTO categoria (id_categoria, nom_categoria, porcentaje) VALUES (5, 'Categoria E', 5.4);

INSERT INTO vendedor (id_vendedor, rut_vendedor, nombres, paterno, materno, fecnac, feccontrato, sueldo, comision, id_zona, id_categoria) VALUES (1, '11111112-6', 'BENITO', 'ORDENES', 'ROMERO', '22/05/63', '16/04/85', 350000, 0.13, 1, 3);
INSERT INTO vendedor (id_vendedor, rut_vendedor, nombres, paterno, materno, fecnac, feccontrato, sueldo, comision, id_zona, id_categoria) VALUES (2, '12222222-3', 'MARTA', 'ORDENES', NULL, '07/08/78', '02/07/00', 345000, 0.07, 1, 2);
INSERT INTO vendedor (id_vendedor, rut_vendedor, nombres, paterno, materno, fecnac, feccontrato, sueldo, comision, id_zona, id_categoria) VALUES (3, '13333333-K', 'OSCAR', 'ORDENES', 'LAGOS', '09/10/79', '03/09/01', 367000, 0.13, 1, 1);
INSERT INTO vendedor (id_vendedor, rut_vendedor, nombres, paterno, materno, fecnac, feccontrato, sueldo, comision, id_zona, id_categoria) VALUES (4, '14444444-5', 'MILENA', 'ORDENES', 'CARTES', '08/12/77', '03/11/99', 373000, 0.05, 1, 3);
INSERT INTO vendedor (id_vendedor, rut_vendedor, nombres, paterno, materno, fecnac, feccontrato, sueldo, comision, id_zona, id_categoria) VALUES (5, '15555555-6', 'ESTEBAN', 'ORDENES', NULL, '08/12/88', '03/11/15', 373000, 0.08, NULL, 3);

INSERT INTO cliente (id_cliente, nombre_cliente, direccion, telefono, id_comuna) VALUES (1, 'ALCARAZ NOVOA MONTSERRAT', 'BUENAVENTURA 160', 564522114, 100);
INSERT INTO cliente (id_cliente, nombre_cliente, direccion, telefono, id_comuna) VALUES (2, 'JIMENEZ LORCA ELENA', 'LAGUNAS 52 DEPTO. K', 56665443, 105);
INSERT INTO cliente (id_cliente, nombre_cliente, direccion, telefono, id_comuna) VALUES (3, 'TORRES ROCA MARIA', 'DONATELLO 7421', 565626134, 115);
INSERT INTO cliente (id_cliente, nombre_cliente, direccion, telefono, id_comuna) VALUES (4, 'LOPEZ ROJAS THOMAS', 'ORDOÑEZ 2007', 562989233, 120);
INSERT INTO cliente (id_cliente, nombre_cliente, direccion, telefono, id_comuna) VALUES (5, 'ZAMORA MOLINA TOMAS', 'HUERNAFOS 1294', 564343456, 105);

INSERT INTO factura (id_cliente, id_vendedor) VALUES (1, 2);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (2, 4);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (3, 3);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (4, 5);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (5, 2);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (1, 2);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (2, 4);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (3, 3);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (4, 5);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (5, 2);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (3, 3);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (4, 5);
INSERT INTO factura (id_cliente, id_vendedor) VALUES (5, 2);

INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10000, 1, 20);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10000, 5, 23);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10010, 3, 38);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10010, 4, 43);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10010, 1, 48);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10020, 4, 30);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10020, 2, 20);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10030, 5, 60);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10030, 2, 45);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10030, 3, 35);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10040, 4, 29);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10040, 5, 28);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10040, 2, 21);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10050, 2, 45);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10060, 3, 35);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10070, 4, 29);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10080, 5, 28);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10090, 2, 21);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10100, 4, 29);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10110, 5, 28);
INSERT INTO detallefactura (id_factura, id_articulo, cantidad) VALUES (10120, 2, 21);

CREATE TABLE totalventas (
    id_factura      NUMBER(5) NOT NULL,
    fecha_factura   DATE NOT NULL,
    id_vendedor     NUMBER(3) NOT NULL,
    cantidad_total  NUMBER(5) NOT NULL,
    CONSTRAINT fk_totalventas_factura FOREIGN KEY (id_factura) REFERENCES factura (id_factura),
    CONSTRAINT fk_totalventas_vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor (id_vendedor)
);

INSERT INTO totalventas
SELECT 
    tb1.id_factura,
    tb1.fecha_factura,
    tb1.id_vendedor,
    SUM(tb2.cantidad) AS cantidad_total
FROM factura tb1
INNER JOIN detallefactura tb2
ON (tb1.id_factura = tb2.id_factura)
WHERE CAST(tb1.fecha_factura AS VARCHAR(8)) = (SELECT CAST(CAST(CURRENT_TIMESTAMP AS DATE) AS VARCHAR(8)) FROM DUAL)
GROUP BY tb1.id_factura, tb1.fecha_factura, tb1.id_vendedor
ORDER BY tb1.id_factura, tb1.fecha_factura, tb1.id_vendedor;

SELECT * FROM totalventas;

