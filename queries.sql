--

-- 1)
SELECT t.direccion, g.dni, e.nombre
FROM trabaja AS t, gerente AS g, empleado as e
WHERE t.dni = g.dni AND e.dni = g.dni
;

-- 2)
SELECT t.direccion
FROM trabaja AS t, vendedor v
WHERE
	t.dni = v.dni AND
	v.ventas = (
	SELECT MAX(ventas)
	FROM vendedor
)
;

-- 3)
SELECT g.dni, m.direccion, p.nombre, p.precio
FROM(
	SELECT p.direccion, MAX(p.precio) as max
	FROM producto as p
	GROUP BY p.direccion
) AS m, trabaja AS t, producto AS p, gerente AS g
WHERE m.direccion = t.direccion AND t.dni = g.dni AND p.precio = m.max
;

-- 4)
SELECT m.direccion, v.dni
FROM (
	SELECT t.direccion, MAX(v.ventas) AS ventas
	FROM trabaja as t, vendedor as v
	WHERE t.dni = v.dni
	GROUP BY t.direccion
) AS m, trabaja AS t, vendedor as v
WHERE m.direccion = t.direccion AND
v.ventas = m.ventas AND
t.dni = v.dni
;
