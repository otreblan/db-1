#!/usr/bin/env bash

function _empleados()
{
	echo "dni,nombre,residencia,celular"
	cat <<< $empleados
}

function _vendedores()
{
	echo "dni,ventas,caja"
	cat <<< $vendedores
}

function _tiendas()
{
	echo "direccion"
	cat <<< $tiendas
}

function _gerentes()
{
	echo "dni"
	cat <<< $gerentes
}

n="${1:-100}"
tienda_n=$((n/2))

empleados="$(./empleado.awk "$n")"

dnis="$(cut -d, -f1 <<< $empleados)"

vendedores="$(./vendedor.awk <<< $dnis)"
tiendas="$(./tienda.awk "$tienda_n")"
gerentes="$(shuf -n$tienda_n <<< $dnis)"

_empleados > empleado.csv
_vendedores > vendedor.csv
_tiendas > tienda.csv
_gerentes > gerente.csv

# \copy empleado FROM empleado.csv CSV HEADER
# \copy vendedor FROM vendedor.csv CSV HEADER
# \copy tienda FROM tienda.csv CSV HEADER
# \copy gerente FROM gerente.csv CSV HEADER
