#!/usr/bin/env -S awk -f
BEGIN {
	srand();
	if(ARGC >1) {
		n = ARGV[ARGC-1];
	}
	else {
		n = 100;
	}

	print "i,n"

	for(i = 0; i < n; i++) {
		printf "%d,%d\n", i, int(rand()*1000)
	}
}
