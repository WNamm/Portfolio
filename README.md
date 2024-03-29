# William Namm's Portfolio
This is a portfolio that showcases code written by William Namm.  The scripts are organized into folders according to the project, course, etc. for which they were written.  Descriptions of each folder's contents can be found below.  There is also work in other repositories; links to these and descriptions are located further down.
## Moffitt_GRN_AML_Pipeline_Test
**Testing the Accuracy of SJARACNe and NetBID2 Pipeline with Data on Acute Myeloid Leukemia**

This project was completed during an internship at Moffitt Cancer Center in Tampa, Florida.  It was done under the mentorship of Dr. Timothy Shaw during the fall of 2021.  It involves gene regulatory networks (GRN) and data from patients with Acute Myeloid Leukemia (AML).  The purpose of the project was to test the accuracy of a pipeline that utilized both SJARACNe and NetBID2 to determine the activity of certain driver genes.  These drivers are known to be important in the oncogenesis of AML.

Starting with a gene expression matrix (n=1,376), the data was randomly subsampled into three subsets, n=300 each.  This had to be done due to RAM limitations with running SJARACNe.  Each subset was run through SJARACNe with two lists of hub genes, both a transcription factor (TF) list and a signaling factor (SIG) list, to create six networks.  Each of these networks, along with the original expression matrix, was then used by NetBID2 functions to create six activity tables (n=1,376 each).  The activity data and a table stating which drivers of interest were mutated in each sample were both used to create a series of box plots.  These activity box plots had two columns that compared mutant and wild type samples using a Wilcoxon rank-sum test.  Expression box plots were also created in a similar manner using the original expression matrix.  Finally, the changes in activity between wild type and mutant samples, as shown by the box plots and their Wilcoxon p-values, were compared with the literature.  Genes that are known to be oncogenes had expected higher activity with mutations, and genes that are known to be tumor suppressors had expected lower activity with mutations. This was used to determine how accurate the whole pipeline was.

This project was done using R and Bash.  Early parts were done on the command line with Ubuntu (from the start to using NetBID2) and later parts were completed using RStudio (box plot generation).  A report was written that was over 6,000 words, and an oral presentation with a slideshow was given as well.

SJARACNe and NetBID2 are available at https://github.com/jyyulab/SJARACNe and https://github.com/jyyulab/NetBID, respectively.
## USF_Python_Course
This is a collection of Python scripts written for a programming course at the University of South Florida in the spring of 2020.  Three of these scripts were homework assignments (HW1_CarDealer, HW2_Inventory, and HW3_Sales), and are longer and more complex than the other three, which were simpler exercises.
## USF_Biostats_Course-SAS
This is a collection of SAS scripts written for the Biostatistics II course at the University of South Florida in the summer of 2021.  Examples of statistical procedures used include regression, confidence interval prediction, anova, and calculating residuals.
## Code in Other Repositories
Some projects and other work for showcase are located in other repositories on GitHub.  These are listed below, with links to their repositories and descriptions of the work.
### USF OneHealth Codeathon 2022 &mdash; Automating Meta-Analyses
**Tool for Automating Meta-Analyses of Treatments for Rare Diseases &mdash; Won Second Place**

https://github.com/USFOneHealthCodeathon2022/Topic1_TeamA

This team project was created for the annual USF OneHealth Codeathon.  The codeathon ran for three days, from February 28 to March 2, 2022.  It was hosted by the Genomics department at the University of South Florida in Tampa, Florida.  The theme for the year was "Exploring Rare and Neglected Diseases," and my team's prompt was to develop automated pipelines for conducting meta-analyses and systematic reviews.  My team won second place, and there were ten teams total that participated.

My team created a software tool that can provide meta-analysis data on groups of studies that show the effects of a certain treatment on a certain disease.  It involves a GUI that contains input fields for the disease and treatment in question.  There are also output fields: one displays a forest plot of the meta-analysis results, and the other summarizes this data with various statistics.  The team used data from nine clinical trials on treatments for lymphangioleiomyomatosis (LAM) as sample data for the meta-analysis.  The GUI currently displays the forest plot and summary for this sample data automatically.  The original plan was to use the input fields to query the AACT database for ClinicalTrials.gov, and then use the resulting data in the meta-analysis.  That way, the user could get a forest plot for clinical trials on any disease they search on.  However, this query portion of the project could not be completed during the three-day codeathon due to the time constraints.

My contribution to the team's project was to create the code for calculating the meta-analysis in the background.  I created an R package that could create the forest plot from input data.  It does so by utilizing the Meta package.  Then, I added the function I wrote to the R markdown code for the GUI so that it would create a forest plot and the summary statistics using the LAM data.
### ProteinAnalyst
**R Package**

https://github.com/WNamm/ProteinAnalyst

This R package was created as a final project for the R Programming Course at the University of South Florida in the spring of 2021.  The package contains several functions that can be used to analyze the amino acid content of protein sequences in given fasta-format text files.  These functions can count the amino acids by all 20 types, sort them into broader categories, and display this information as lists, data frames, or bar graphs.
### USF R Programming

https://github.com/WNamm/USF_R_Programming

This repository contains assignments from the R Programming course at the University of South Florida, taken in the spring of 2021.  Alongside writing R scripts for the course, I also wrote blog posts describing what I learned.  These blog posts can be found at https://journeythroughr.wordpress.com/.