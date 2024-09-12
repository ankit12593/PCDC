#!/bin/bash


sed 's/ /\t/g' | cut -s -f1,2 | awk '{ if ($2 < $1) print $2," "$1; else print $1," "$2;}'| awk '{ $3 = ($2 + 1) - $1 } 1' | sed 's/ /\t/g' | sed 's/-//g'| cut -f3 | awk '{total = total + $1}END{print total}'  > tempFile/myCDS.txt
exit 0;
