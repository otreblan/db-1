-- Tablas

CREATE TABLE empleado(
	dni int,
	nombre varchar(127),
	residencia varchar(127),
	celular int
);

CREATE TABLE gerente(
	dni int
	-- direccion varchar(127), -- Redundante
);

CREATE TABLE vendedor(
	dni int,
	ventas int,
	caja varchar(63)
);

CREATE TABLE repartidor(
	dni int,
	entregas int,
	pedidos int
);

CREATE TABLE trabaja(
	dni int,
	sueldo double precision,
	direccion varchar(127)
);

CREATE TABLE tienda(
	direccion varchar(127)
	-- dni int -- Redundante
);

CREATE TABLE producto(
	direccion varchar(127),
	nombre varchar(63),
	stock int,
	precio double precision
);

CREATE TABLE es(
	direccion varchar(127),
	nombre varchar(63),
	id int
);

CREATE TYPE pago_t as ENUM ('tarjeta', 'contraentrega');
CREATE TABLE pedido(
	id int,
	tipo_de_pago pago_t,
	direccion varchar(127),
	fecha_de_entrega date,
	dni int,
	placa varchar(7),
	dni_r int
);

CREATE TABLE vehiculo(
	placa varchar(7)
);

CREATE TABLE cliente(
	dni int,
	correo varchar(63),
	nombre varchar(127),
	telefono int
);
