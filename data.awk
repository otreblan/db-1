#!/usr/bin/env -S awk -f

# \copy empleado FROM empleado.csv CSV HEADER
BEGIN {
	n = ARGC > 1 ? ARGV[ARGC-1] : 100;
	srand();

	print "dni,nombre,residencia,celular"

	for(i = 0; i < n; i++) {
		printf "%d,%d,%s,%d\n",
			i,
			int(rand()*1000),
			int(rand()*1000),
			int(rand()*1000)
		;
	}
}
