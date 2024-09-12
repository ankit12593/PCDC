#!/bin/bash

# Check if filename is provided as argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file=$1

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found."
    exit 1
fi

# Reading file line by line using while loop
while IFS= read -r line; do

curl -s "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=$line&retmode=xml" > tempFile/gbFileXml.txt


##Requires xsltproc (sudo apt install xsltproc)
#Run xsl stylesheets to extract specific information from Gb file

xsltproc --novalid scripts/gene.xsl - < tempFile/gbFileXml.txt  > tempFile/geneCoords.txt
xsltproc --novalid scripts/cds.xsl - < tempFile/gbFileXml.txt  > tempFile/cdsCoords.txt
xsltproc --novalid scripts/glength.xsl - < tempFile/gbFileXml.txt > tempFile/totalLength.txt
xsltproc --novalid scripts/locus.xsl - < tempFile/gbFileXml.txt > tempFile/locusId.txt

sh scripts/genes.sh < tempFile/geneCoords.txt
sh scripts/cdsfinal.sh < tempFile/cdsCoords.txt
sh scripts/totaldensity.sh


done < "$input_file"

header=$(echo "LocusId	Total_Length	GeneRegion_Length	CDSregion_Length	NonCodingRegion_Length	Protein_Perc	Coding_Perc	NonCoding_Perc	gene_Count	CDS_count")
echo $header > .header.txt

#Merge header and final output in a tsv file
cat .header.txt .FinalOutTable.txt > FinalOutput.tsv

#Delete all temporary files at last
rm -rf tempFile/*

mv .header.txt .FinalOutTable.txt tempFile/

rm -rf tempFile/.header.txt 
rm -rf tempFile/.FinalOutTable.txt


exit 0;
