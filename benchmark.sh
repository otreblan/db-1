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

psql-explain 100000 '
	SELECT t.direccion, g.dni
	FROM trabaja AS t, gerente AS g
	WHERE t.dni = g.dni
	;'
