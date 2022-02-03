#This R script creates three random subsets of the original samples in the AML expression data set, and each subset contains 300 samples.
#First, the tab-separated table in a text file is read into a data frame.
full.data <- read.table("/home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/inputs/FredHutch_1TPM_Final.txt", header=TRUE, sep="\t")
#The first column, containing gene names, is duplicated so that the subset files are in the right format for SJARACNe.
isoformId <- full.data$geneSymbol
#The seed is set for the random generator, for reproducibility.
set.seed(257)
#Next, a new data frame is created that takes a random sample of columns from the original table.
#The first column of full.data has gene names and is always preserved.
subset.data1 <- data.frame(isoformId, full.data[1], sample(full.data[2:length(full.data)], size=300))
#Finally, the new data subset is written to a text file as a tab-separated table.
write.table(subset.data1, "/home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/inputs/FredHutch_1TPM_Final_randsubset1.txt", sep="\t", quote=FALSE, row.names=FALSE)
#The process is repeated to create two more subset files.
set.seed(934)
subset.data2 <- data.frame(isoformId, full.data[1], sample(full.data[2:length(full.data)], size=300))
write.table(subset.data2, "/home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/inputs/FredHutch_1TPM_Final_randsubset2.txt", sep="\t", quote=FALSE, row.names=FALSE)
set.seed(537)
subset.data3 <- data.frame(isoformId, full.data[1], sample(full.data[2:length(full.data)], size=300))
write.table(subset.data3, "/home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/inputs/FredHutch_1TPM_Final_randsubset3.txt", sep="\t", quote=FALSE, row.names=FALSE)
