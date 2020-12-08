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
--CREATE INDEX index_trabaja_dni ON trabaja USING hash (dni);
--CREATE INDEX index_gerente_dni ON gerente USING hash (dni);

-- 4)
--CREATE INDEX index_trabaja_dni ON trabaja USING hash (dni);
--CREATE INDEX index_vendedor_dni ON vendedor USING hash (dni);

CREATE INDEX index_trabaja_direccion ON trabaja USING hash (direccion);
CREATE INDEX index_producto_direccion ON producto USING hash (direccion);