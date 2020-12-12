-- Restricciones

ALTER TABLE empleado ADD PRIMARY KEY(dni);
ALTER TABLE gerente ADD PRIMARY KEY(dni);
ALTER TABLE vendedor ADD PRIMARY KEY(dni);
ALTER TABLE repartidor ADD PRIMARY KEY(dni);
ALTER TABLE trabaja ADD PRIMARY KEY(dni);
ALTER TABLE tienda ADD PRIMARY KEY(direccion);
ALTER TABLE producto ADD PRIMARY KEY(direccion, nombre);
ALTER TABLE es ADD PRIMARY KEY(direccion, nombre, id);
ALTER TABLE pedido ADD PRIMARY KEY(id);
ALTER TABLE vehiculo ADD PRIMARY KEY(placa);
ALTER TABLE cliente ADD PRIMARY KEY(dni);

ALTER TABLE gerente ADD FOREIGN KEY(dni) REFERENCES empleado(dni);
ALTER TABLE vendedor ADD FOREIGN KEY(dni) REFERENCES empleado(dni);
ALTER TABLE repartidor ADD FOREIGN KEY(dni) REFERENCES empleado(dni);
ALTER TABLE trabaja ADD FOREIGN KEY(dni) REFERENCES empleado(dni);
ALTER TABLE trabaja ADD FOREIGN KEY(direccion) REFERENCES tienda(direccion);
ALTER TABLE producto ADD FOREIGN KEY(direccion) REFERENCES tienda(direccion);
ALTER TABLE es ADD FOREIGN KEY(direccion, nombre) REFERENCES producto(direccion, nombre);
ALTER TABLE es ADD FOREIGN KEY(id) REFERENCES pedido(id);
ALTER TABLE pedido ADD FOREIGN KEY(dni) REFERENCES cliente(dni);
ALTER TABLE pedido ADD FOREIGN KEY(placa) REFERENCES vehiculo(placa);
ALTER TABLE pedido ADD FOREIGN KEY(dni) REFERENCES repartidor(dni);

-- Indices
-- 1)
CREATE INDEX index_trabaja_dni ON trabaja USING hash (dni);
CREATE INDEX index_gerente_dni ON gerente USING hash (dni);
CREATE INDEX index_empleado_dni ON empleado USING hash (dni);

-- 2)
--CREATE INDEX index_trabaja_dni ON trabaja USING hash (dni);
CREATE INDEX index_vendedor_dni ON vendedor USING hash (dni);
CREATE INDEX index_vendedor_ventas ON vendedor USING hash (ventas);

-- 3)
CREATE INDEX index_trabaja_direccion ON trabaja USING hash (direccion);
CREATE INDEX index_producto_direccion ON producto USING hash (direccion);
CREATE INDEX index_producto_precio ON producto USING hash (precio);
--CREATE INDEX index_trabaja_dni ON trabaja USING hash (dni);
--CREATE INDEX index_gerente_dni ON gerente USING hash (dni);

-- 4)
--CREATE INDEX index_trabaja_dni ON trabaja USING hash (dni);
--CREATE INDEX index_vendedor_dni ON vendedor USING hash (dni);

CREATE INDEX index_trabaja_direccion ON trabaja USING hash (direccion);
CREATE INDEX index_producto_direccion ON producto USING hash (direccion);
