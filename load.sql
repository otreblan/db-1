DELETE FROM empleado;
DELETE FROM vendedor;
DELETE FROM tienda;
DELETE FROM gerente;

\copy empleado FROM empleado.csv CSV HEADER
\copy vendedor FROM vendedor.csv CSV HEADER
\copy tienda FROM tienda.csv CSV HEADER
\copy gerente FROM gerente.csv CSV HEADER
