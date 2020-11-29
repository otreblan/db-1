-- Tablas

CREATE TABLE Empleado(
	dni int,
	nombre varchar(127),
	direccion varchar(127),
	celular int
);

-- Restricciones

ALTER TABLE Empleado ADD PRIMARY KEY(dni);
