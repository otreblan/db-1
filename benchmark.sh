#!/usr/bin/env bash

# psql-explain n QUERY
function psql-explain()
{
	local n=$1
	shift

	yes |\
		head -n$n |\
		awk -vcmd="$@" '{printf "-cEXPLAIN (ANALYZE, FORMAT JSON) %s;\0", cmd}' |\
		xargs -0 psql -tAUpostgres
}

psql-explain 10000 "SELECT * FROM gerente" | jq '.[]."Execution Time"'
