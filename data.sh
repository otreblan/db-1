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

empleados="$(./empleado.awk "$@")"

dnis="$(cut -d, -f1 <<< $empleados)"

vendedores="$(./vendedor.awk <<< "$dnis")"

_empleados > empleados.csv
_vendedores > vendedores.csv
