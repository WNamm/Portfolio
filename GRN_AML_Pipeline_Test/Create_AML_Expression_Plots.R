#This R script creates box plots that show the expression levels for driver genes in the AML data set.
#Data is taken from a table that shows the expression levels for each sample and gene.
#Another table is used as well that displays whether each sample was mutant or wild type for each of the 19 driver genes.
#The expression matrix is n=1,376, but the mutation table is n=1,350.
#So, the samples must be filtered to make sure they match up between the two tables.
#The resulting output is a series of box plots, one for each gene.
#Each plot is separated into two columns, one for mutant and one for wild type, and the p-value of a Wilcoxon ranked-sum test is displayed.
library(ggplot2)
library(ggpubr)
setwd("C:/Users/WNamm/Documents/Moffitt_Shaw_Lab/AML_Data")

#The expression matrix and mutation table are read into data frames.
expressions <- read.table("FredHutch_1TPM_Final_Expression_Mod.txt", header=T, sep="\t")
mutations <- read.table("FusionSummaryMod2.txt", header=T, sep="\t")
#The mutations data frame is filtered so that it only contains samples that are also in expressions.
filtered.mutations <- mutations[which(mutations$Sample %in% colnames(expressions)),]
sample.id <- filtered.mutations$Sample

#The gene.boxplot() function is defined to return a box plot for the given gene using data from expressions and filtered.mutations.
gene.boxplot <- function(gene) {
  #A new data frame is created that contains mutation statuses and expression levels for each sample.
  mut.status <- filtered.mutations[,gene]
  express.value <- NULL
  for (id in sample.id) {
    value <- expressions[match(gene, expressions$geneSymbol), id]
    express.value <- append(express.value, value)
  }
  #The mutation values are changed to strings so that the Wilcox test can recognize them.
  mut.status[mut.status == 0] <- "Wild Type"
  mut.status[mut.status == 1] <- "Mutant"
  express.mut.table <- data.frame(sample.id, mut.status, express.value)
  
  #A box plot is created from this new data frame.
  express.mut.plot <- ggplot(express.mut.table, aes(x=mut.status, y=express.value, group=mut.status))
  express.mut.plot <- express.mut.plot + geom_boxplot(aes(factor(mut.status)), fill=c("#FF0099", "#66CC99"))
  express.mut.plot <- express.mut.plot + stat_compare_means(method="wilcox.test")
  title <- paste("Expression of", gene)
  express.mut.plot <- express.mut.plot + labs(title=title, x="", y="Expression Levels")
  express.mut.plot <- express.mut.plot + theme(text=element_text(size=16), plot.title=element_text(hjust = 0.5))
  return(express.mut.plot)
}

#For each gene, a box plot is created and saved as an image.
setwd("C:/Users/WNamm/Documents/Moffitt_Shaw_Lab/AML_Data/Expression_Plots")
gene.list <- colnames(mutations)[2:20]
for (gene in gene.list) {
  plot <- gene.boxplot(gene)
  file <- paste0(gene, "_Exp.png")
  ggsave(filename=file, plot=plot, width=4, height=4)
}