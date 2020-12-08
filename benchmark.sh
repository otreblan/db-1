#!/usr/bin/env bash

# psql-explain n QUERY
function psql-explain()
{
	local n=$1
	shift

	awk \
		-vcmd="$@" \
		-vn=$n \
		'BEGIN{
			for(i = 0; i < n; i++){
				printf "-cEXPLAIN (ANALYZE, FORMAT JSON) %s;\0", cmd;
			}
		}' |\
		xargs -0 psql -tAUpostgres |\
		jq '.[]."Execution Time"'
}

n=${1:-100}

psql-explain $n '
	SELECT t.direccion, g.dni, e.nombre
	FROM trabaja AS t, gerente AS g, empleado as e
	WHERE t.dni = g.dni AND e.dni = g.dni
	;'

psql-explain $n '
	SELECT t.direccion
	FROM trabaja AS t, vendedor v
	WHERE
		t.dni = v.dni AND
		v.ventas = (
		SELECT MAX(ventas)
		FROM vendedor
	)
	;'

# psql-explain $n ''

psql-explain $n '
	SELECT m.direccion, v.dni
	FROM (
		SELECT t.direccion, MAX(v.ventas) AS ventas
		FROM trabaja as t, vendedor as v
		WHERE t.dni = v.dni
		GROUP BY t.direccion
	) AS m, trabaja AS t, vendedor as v
	WHERE m.direccion = t.direccion AND
	v.ventas = m.ventas
	;'

