Prokaryotic Coding Density Calculator(PCDC)

Description: Calculates protein coding and non-coding density of a prokaryotic genome using NCBI genome Ids as input

Input: NCBI genome IDs (prokaryotes)

Usage: \
```
sh multigenome.sh inputfilename
```
Requirements for running on Ubuntu:
curl \
xsltproc (sudo apt install xsltproc)

Final output file contains:
1. Total length of genome
2. Total gene region length
3. Total CDS region length
4. Total non-coding region length
5. Protein coding percentage
6. Coding (CDS) percentage
7. Non-coding percentage
8. Total number of Genes
9. Total number of CDS
