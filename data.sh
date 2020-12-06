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

_empleados > empleados.csv
_vendedores > vendedores.csv
_tiendas > tiendas.csv
_gerentes > gerentes.csv
