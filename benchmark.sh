#!/usr/bin/env bash

# psql-explain n QUERY
function psql-explain()
{
	local n=$1
	shift

	echo "time"
	awk \
		-vcmd="$@" \
		-vn=$n \
		'BEGIN{
			for(i = 0; i < n; i++){
				printf "-cEXPLAIN (ANALYZE, FORMAT JSON) %s;\0", cmd;
			}
		}' |\
		parallel -m0 psql -tAUpostgres |\
		jq '.[]."Execution Time"'
}

# benchmark suffix n
function benchmark()
{
	local suffix="$1"
	local n=${2:-100}

	psql-explain $n '
		SELECT t.direccion, g.dni, e.nombre
		FROM trabaja AS t, gerente AS g, empleado as e
		WHERE t.dni = g.dni AND e.dni = g.dni
		;' > query-1-"$suffix".csv

	psql-explain $n '
		SELECT t.direccion
		FROM trabaja AS t, vendedor v
		WHERE
			t.dni = v.dni AND
			v.ventas = (
			SELECT MAX(ventas)
			FROM vendedor
		)
		;' > query-2-"$suffix".csv

	psql-explain $n '
		SELECT g.dni, m.direccion, p.nombre, p.precio
		FROM(
			SELECT p.direccion, MAX(p.precio) as max
			FROM producto as p
			GROUP BY p.direccion
		) AS m, trabaja AS t, producto AS p, gerente AS g
		WHERE m.direccion = t.direccion AND t.dni = g.dni AND p.precio = m.max
		;' > query-3-"$suffix".csv

	psql-explain $n '
		SELECT m.direccion, v.dni
		FROM (
			SELECT t.direccion, MAX(v.ventas) AS ventas
			FROM trabaja as t, vendedor as v
			WHERE t.dni = v.dni
			GROUP BY t.direccion
		) AS m, trabaja AS t, vendedor as v
		WHERE m.direccion = t.direccion AND
		m.ventas = v.ventas AND
		t.dni = v.dni
		;' > query-4-"$suffix".csv
}

for index in index noindex
do
	psql \
		-Upostgres \
		-c"DROP TABLE IF EXISTS
			cliente,
			empleado,
			es,
			gerente,
			pedido,
			producto,
			repartidor,
			tienda,
			trabaja,
			vehiculo,
			vendedor
			CASCADE;"

	psql -Upostgres -f tablas.sql

	if [[ "$index" == index ]]
	then
		psql -Upostgres -f index.sql
	fi

	for n in 1000 10000 100000 1000000
	do
		./data.sh $n
		psql -Upostgres -f load.sql
		benchmark "$index-$n" ${1:-100}
	done
done
