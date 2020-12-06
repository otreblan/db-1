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
