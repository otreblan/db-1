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
SELECT p.direccion, p.nombre, g.dni, MAX(p.precio) as max
FROM producto AS p, trabaja AS t, gerente as g
WHERE t.direccion = p.direccion AND t.dni = g.dni
GROUP BY p.direccion, p.nombre, g.dni
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
v.ventas = m.ventas
;
