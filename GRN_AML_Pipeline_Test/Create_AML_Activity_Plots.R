#This R script creates box plots showing the activity levels of drivers in the AML data set.
#Data is taken from tables that show the activity levels for each sample and gene.
#Another table is used as well that displays whether each sample was mutant or wild type for each of the 19 driver genes.
#The activity tables are each n=1,376, but the mutation table is n=1,350.
#So, the samples must be filtered to make sure they match up between the two tables.
#The resulting output is a series of box plots, one for each gene and activity table.
#Each plot is separated into two columns, one for mutant and one for wild type, and the p-value of a Wilcoxon ranked-sum test is displayed.
library(ggplot2)
library(ggpubr)
setwd("C:/Users/WNamm/Documents/Moffitt_Shaw_Lab/AML_Data")

#The table of samples with mutations and all six calculated activity tables are read into data frames.
mutations <- read.table("FusionSummaryMod2.txt", header=T, sep="\t")
activities.tf.1 <- read.table("TF_Calculated_Activity_1.txt", header=T, sep="\t")
activities.tf.2 <- read.table("TF_Calculated_Activity_2.txt", header=T, sep="\t")
activities.tf.3 <- read.table("TF_Calculated_Activity_3.txt", header=T, sep="\t")
activities.sig.1 <- read.table("SIG_Calculated_Activity_1.txt", header=T, sep="\t")
activities.sig.2 <- read.table("SIG_Calculated_Activity_2.txt", header=T, sep="\t")
activities.sig.3 <- read.table("SIG_Calculated_Activity_3.txt", header=T, sep="\t")

#The gene.boxplot() function is defined to return a box plot for the given gene using data from the given activity table.
gene.boxplot <- function(gene, activities) {
#The mutations data frame is filtered so that it only contains samples that are also in activities.
filtered.mutations <- mutations[which(mutations$Sample %in% colnames(activities)),]
sample.id <- filtered.mutations$Sample

#For the given gene, data is taken from activities and filtered.mutations.
#A new data frame is created that contains activity levels and mutation statuses for each sample.
mut.status <- filtered.mutations[,gene]
activ.value <- NULL
for (id in sample.id) {
  value <- activities[match(gene, activities$Gene), id]
  activ.value <- append(activ.value, value)
}
activ.mut.table <- data.frame(sample.id, mut.status, activ.value)

#The mutation values are changed to strings so that the Wilcox test can recognize them.
activ.mut.table[activ.mut.table$mut.status == 1, "mut.status"] <- "Mutant"
activ.mut.table[activ.mut.table$mut.status == 0, "mut.status"] <- "Wild Type"

#A box plot is created from this new data frame.
activ.mut.plot <- ggplot(activ.mut.table, aes(x=mut.status, y=activ.value, group=mut.status)) + geom_boxplot(aes(factor(mut.status)), fill=c("#FF0000", "#00FF00"))
activ.mut.plot <- activ.mut.plot + stat_compare_means(method="wilcox.test")
activ.mut.plot <- activ.mut.plot + theme(text=element_text(size=16), plot.title=element_text(hjust = 0.5), plot.subtitle=element_text(hjust = 0.5))
return(activ.mut.plot)
}

#For each gene and activity table, a box plot is created and saved as an image.
#Each iteration of the For loop uses a different gene, and each iteration goes through all six activity tables to make six plots.
setwd("C:/Users/WNamm/Documents/Moffitt_Shaw_Lab/AML_Data/Activity_Plots")
gene.list <- colnames(mutations)[2:20]
for (gene in gene.list) {
plot <- gene.boxplot(gene, activities.tf.1)
title <- paste("TF Activity of", gene)
plot <- plot + labs(title=title, subtitle="Using Data Subset 1", x="", y="Activity Levels")
file <- paste0(gene, "_TF_1.png")
ggsave(filename=file, plot=plot, width=4, height=4)

plot <- gene.boxplot(gene, activities.tf.2)
title <- paste("TF Activity of", gene)
plot <- plot + labs(title=title, subtitle="Using Data Subset 2", x="", y="Activity Levels")
file <- paste0(gene, "_TF_2.png")
ggsave(filename=file, plot=plot, width=4, height=4)

plot <- gene.boxplot(gene, activities.tf.3)
title <- paste("TF Activity of", gene)
plot <- plot + labs(title=title, subtitle="Using Data Subset 3", x="", y="Activity Levels")
file <- paste0(gene, "_TF_3.png")
ggsave(filename=file, plot=plot, width=4, height=4)

plot <- gene.boxplot(gene, activities.sig.1)
title <- paste("SIG Activity of", gene)
plot <- plot + labs(title=title, subtitle="Using Data Subset 1", x="", y="Activity Levels")
file <- paste0(gene, "_SIG_1.png")
ggsave(filename=file, plot=plot, width=4, height=4)

plot <- gene.boxplot(gene, activities.sig.2)
title <- paste("SIG Activity of", gene)
plot <- plot + labs(title=title, subtitle="Using Data Subset 2", x="", y="Activity Levels")
file <- paste0(gene, "_SIG_2.png")
ggsave(filename=file, plot=plot, width=4, height=4)

plot <- gene.boxplot(gene, activities.sig.3)
title <- paste("SIG Activity of", gene)
plot <- plot + labs(title=title, subtitle="Using Data Subset 3", x="", y="Activity Levels")
file <- paste0(gene, "_SIG_3.png")
ggsave(filename=file, plot=plot, width=4, height=4)
}