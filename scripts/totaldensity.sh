#!/bin/bash

x=$(cat tempFile/totalLength.txt)
echo "Total Genome length: $x bp" 
t=$(grep -c "locus\|gene" < tempFile/geneCoords.txt)
echo "Total no.of genes: $t "
s=$(grep -c "locus\|CDS" < tempFile/cdsCoords.txt)
echo "Total no.of CDS: $s "
z=$(cat tempFile/myGenes.txt)
echo "Total length of gene region: $z bp"  | sed 's/-//'
y=$(cat tempFile/myCDS.txt)
echo "Total length of CDS region: $y bp" | sed 's/-//'
b=$(echo "$x - $z" | bc)
echo "Total length of non-coding regions: $b bp"
d=$(awk "BEGIN {printf \"%.2f\",$t/($x/1000000)} ")
echo "Gene Density per Mb: $d"
m=$(awk "BEGIN {printf \"%.3f\",$z*100/$x}")
echo "Total Protein Percentage: $m%" | sed 's/-//'
n=$(awk "BEGIN {printf \"%.3f\",$y*100/$x}")
echo "Total Coding Percentage: $n%" | sed 's/-//'
k=$(awk "BEGIN {printf \"%.3f\",$b*100/$x}")
echo "Total Non-Coding Percentage: $k%" | sed 's/-//'
echo =================================================

gi=$(cat tempFile/locusId.txt)

a=$(echo "$gi	$x	$z	$y	$b	$m	$n	$k	$t	$s")
echo $a  >> .FinalOutTable.txt


exit 0;
