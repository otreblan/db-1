#!/usr/bin/env bash

n="${1:-100}"
tienda_n=$((n/100))

empleados="$(./empleado.awk "$n")"
dnis="$(cut -d, -f1 <<< $empleados)"
vendedores="$(./vendedor.awk <<< $dnis)"
tiendas="$(./tienda.awk "$tienda_n")"
gerentes="$(shuf -n$tienda_n <<< $dnis)"
gerentes_t="$(./gerente_trabaja.awk <<< $gerentes)"

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

function _producto()
{
	echo "direccion,nombre,stock,precio"
	printf "%s\n" "$tiendas" |\
		awk '{
			for(i = 0; i < 100; i++){
				printf "%s,%s,%s,%s\n",
				$0,
				i,
				int(rand()*1000),
				rand()*1000
			}
		}'
}

_empleados  > empleado.csv
_vendedores > vendedor.csv
_tiendas    > tienda.csv
_gerentes   > gerente.csv
_trabaja    > trabaja.csv
_producto   > producto.csv
