#!/usr/bin/env -S awk -f

BEGIN {
	n = ARGC > 1 ? ARGV[ARGC-1] : 100;
	srand();


	print "i,n"

	for(i = 0; i < n; i++) {
		printf "%d,%d\n", i, int(rand()*1000)
	}
}
