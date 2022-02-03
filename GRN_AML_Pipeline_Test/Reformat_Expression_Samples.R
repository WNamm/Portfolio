#This script was used to replace hyphens with periods in the sample names of the complete expression matrix, FredHutch_1TPM_Final_Expression.txt.
#This way, the names can match those in the mutation table, FusionSummaryMod2.txt.
#This is necessary for creating the expression box plots; that script needs to be able to match up the samples between the two tables.
setwd("C:/Users/WNamm/Documents/Moffitt_Shaw_Lab/AML_Data")
file <- readLines("FredHutch_1TPM_Final_Expression.txt")
file[1] <- gsub("-", ".", file[1])
writeLines(file, "FredHutch_1TPM_Final_Expression_Mod.txt")
