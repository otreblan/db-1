TRUNCATE empleado CASCADE;
TRUNCATE tienda CASCADE;

\copy empleado FROM empleado.csv CSV HEADER
\copy vendedor FROM vendedor.csv CSV HEADER
\copy tienda FROM tienda.csv CSV HEADER
\copy gerente FROM gerente.csv CSV HEADER
\copy trabaja FROM trabaja.csv CSV HEADER
