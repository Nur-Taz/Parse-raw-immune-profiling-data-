#!/bin/bash

#Usage: find duplicates in column 2 of an input file 
#originally made to look into all contig annotations files 
#assuming the barcodes are in column 2 

input="$1"

awk -F',' '
NR==1 { 
	print 					#print header 
	next 					#skip processing for header 
}

{
	count[$2]++
	lines[NR]=$0
	col[NR]=$2
}

END {
	for (i=1; i<=NR; i++) {
		if (count[col[i]] >1)
			print lines[i]
}
}
' "$input" 



