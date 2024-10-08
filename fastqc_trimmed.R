# _ Autor_ : Layal Abo Khayal

if(!require(fastqcr)){
  install_github("kassambara/fastqcr")
}
library("fastqcr")

fqFiles = "~/Documents/EOC/RNA_afterTrimming"
qc.dir = "~/Documents/EOC/QC_Trimmed"

if(!dir.exists(qc.dir)){
  dir.create(qc.dir)
}
#after trimming 
fastqcr::fastqc(fqFiles,  qc.dir, threads = 4)

