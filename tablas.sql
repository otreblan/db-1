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

-- Restricciones

ALTER TABLE empleado ADD PRIMARY KEY(dni);

ALTER TABLE gerente ADD PRIMARY KEY(dni);
ALTER TABLE gerente ADD FOREIGN KEY(dni) REFERENCES empleado(dni);
-- ALTER TABLE gerente ADD FOREIGN KEY(direccion) REFERENCES trabaja(direccion);
