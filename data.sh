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

function _trabaja()
{
	echo "dni,sueldo, direccion"
	cat <<< $gerentes_t

	printf "%s\n" "$dnis" "$gerentes" |\
		sort |\
		uniq -u |\
		awk \
		-vi=$tienda_n \
		'BEGIN {
			srand()
		}
		{
			printf "%s,%s,%s\n",
				$0,
				int(rand()*1000),
				int(rand()*i)
		}'
}



n="${1:-100}"
tienda_n=$((n/2))

empleados="$(./empleado.awk "$n")"

dnis="$(cut -d, -f1 <<< $empleados)"

vendedores="$(./vendedor.awk <<< $dnis)"
tiendas="$(./tienda.awk "$tienda_n")"
gerentes="$(shuf -n$tienda_n <<< $dnis)"
gerentes_t="$(./gerente_trabaja.awk <<< $gerentes)"

_empleados > empleado.csv
_vendedores > vendedor.csv
_tiendas > tienda.csv
_gerentes > gerente.csv
_trabaja > trabaja.csv
