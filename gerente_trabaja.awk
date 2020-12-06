#!/usr/bin/env -S awk -f

BEGIN {
	srand();
}

{
	printf "%d,%d,%d\n",
		$0,
		int(rand()*1000),
		i++
	;
}
