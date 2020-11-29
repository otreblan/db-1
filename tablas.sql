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
	direccion varchar(127),
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

-- Restricciones

ALTER TABLE empleado ADD PRIMARY KEY(dni);

ALTER TABLE gerente ADD PRIMARY KEY(dni);
ALTER TABLE gerente ADD FOREIGN KEY(dni) REFERENCES empleado(dni);
-- ALTER TABLE gerente ADD FOREIGN KEY(direccion) REFERENCES tienda(direccion); -- Redundante

ALTER TABLE vendedor ADD PRIMARY KEY(dni);
ALTER TABLE vendedor ADD FOREIGN KEY(dni) REFERENCES empleado(dni);

ALTER TABLE repartidor ADD PRIMARY KEY(dni);
ALTER TABLE repartidor ADD FOREIGN KEY(dni) REFERENCES empleado(dni);

ALTER TABLE trabaja ADD PRIMARY KEY(dni);
ALTER TABLE trabaja ADD FOREIGN KEY(dni) REFERENCES empleado(dni);
ALTER TABLE trabaja ADD FOREIGN KEY(direccion) REFERENCES tienda(direccion);

ALTER TABLE tienda ADD PRIMARY KEY(direccion);

ALTER TABLE producto ADD PRIMARY KEY(direccion, nombre);
ALTER TABLE producto ADD FOREIGN KEY(direccion) REFERENCES tienda(direccion);

ALTER TABLE es ADD PRIMARY KEY(direccion, nombre, id);
ALTER TABLE es ADD FOREIGN KEY(direccion, nombre) REFERENCES producto(direccion, nombre);
-- ALTER TABLE es ADD FOREIGN KEY(id) REFERENCES pedido(id);
