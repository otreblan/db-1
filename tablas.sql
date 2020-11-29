-- Tablas

CREATE TABLE Empleado(
	dni int,
	nombre varchar(127),
	residencia varchar(127),
	celular int
);

-- Restricciones

ALTER TABLE Empleado ADD PRIMARY KEY(dni);
