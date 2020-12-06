--

-- 1)
SELECT t.direccion, g.dni
FROM trabaja AS t, gerente AS g
WHERE t.dni = g.dni
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
