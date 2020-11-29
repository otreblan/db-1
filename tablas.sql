-- Tablas

CREATE TABLE empleado(
	dni int,
	nombre varchar(127),
	residencia varchar(127),
	celular int
);

CREATE TABLE gerente(
	dni int,
	direccion varchar(127),
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

-- Restricciones

ALTER TABLE empleado ADD PRIMARY KEY(dni);

ALTER TABLE gerente ADD PRIMARY KEY(dni);
ALTER TABLE gerente ADD FOREIGN KEY(dni) REFERENCES empleado(dni);
-- ALTER TABLE gerente ADD FOREIGN KEY(direccion) REFERENCES tienda(direccion);

ALTER TABLE vendedor ADD PRIMARY KEY(dni);
ALTER TABLE vendedor ADD FOREIGN KEY(dni) REFERENCES empleado(dni);

ALTER TABLE repartidor ADD PRIMARY KEY(dni);
ALTER TABLE repartidor ADD FOREIGN KEY(dni) REFERENCES empleado(dni);
