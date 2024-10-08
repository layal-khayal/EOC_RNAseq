#!/bin/bash

#the script calls out Trimmomatic to perform trimming on the RNAseq reads

#path to where the data
BASE='/home/layal/Documents/EOC'

TRIMMOMATIC='/home/layal/Trimmomatic-0.39'

pathRNA=${BASE}/Raw_RNA

pathTrimRNAout=${BASE}/RNA_afterTrimming

## make folder of the RNAseq the output of the trimming
if [ ! -d ${pathTrimRNAout} ];
then
    mkdir ${pathTrimRNAout}
fi

for f in $pathRNA/*.fastq.gz ; 
do
	echo "the full path of the file is : $f"
	i=$((basename $f) | cut -f1,2,5 -d'_')
	echo "Calling Trimmomatic on $i"
	
	java -jar ${TRIMMOMATIC}/trimmomatic-0.39.jar SE -phred33 $f $pathTrimRNAout/${i}_trimmed.fq.gz	ILLUMINACLIP:${TRIMMOMATIC}/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 2>&1 | tee $pathTrimRNAout/log_$i.txt
	
done






