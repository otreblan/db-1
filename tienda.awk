#!/usr/bin/env -S awk -f

BEGIN {
	n = ARGC > 1 ? ARGV[ARGC-1] : 100;
	srand();

	for(i = 0; i < n; i++) {
		print i;
	}
}
