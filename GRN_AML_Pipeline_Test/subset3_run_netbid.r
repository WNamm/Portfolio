#This R script calculates gene activity using NetBID2.
#This script uses a transcription factor (TF) network, a signaling factor (SIG) network, and the complete expression matrix as inputs.
#The two networks used were generated from data subset 3.
#The outputs are two activity tables.
#This particular script was originally provided by the internship mentor.  It was simply copied for each NetBID2 run and modified (file paths, project names, etc.) for this project.
library(NetBID2)

if(exists('analysis.par')==TRUE) rm(analysis.par)

project_main_dir <- '/home/wnamm/documents/Moffitt_Shaw_Lab/aml_NetBID2_runs/FredHutch_subset3'
project_name <- 'TCGA_Network'
network.project.name <- 'project_2021-09-22'
network.dir= "/home/wnamm/documents/Moffitt_Shaw_Lab/aml_NetBID2_runs/FredHutch_subset3"
  
analysis.par <- NetBID.analysis.dir.create(project_main_dir=project_main_dir,
  network_dir = network.dir,
  project_name=project_name,
  network_project_name=network.project.name)
  
analysis.par$tf.network <- get.SJAracne.network(network_file=analysis.par$tf.network.file)
analysis.par$sig.network <- get.SJAracne.network(network_file=analysis.par$sig.network.file)

net_dat <- read.delim(file=analysis.par$tf.network.file,stringsAsFactors = FALSE)
target_list <- get_net2target_list(net_dat)

mat = read.table("/home/wnamm/documents/Moffitt_Shaw_Lab/aml_NetBID2_runs/FredHutch_subset3/FredHutch_1TPM_Final.txt", sep="\t", header=T, row.names=1);

ac_mat <- cal.Activity(target_list=analysis.par$tf.network$target_list,
cal_mat=mat, igraph_obj=analysis.par$tf.network$igraph_obj,
es.method='weightedmean')


sig_ac_mat <- cal.Activity(target_list=analysis.par$sig.network$target_list,
cal_mat=mat, igraph_obj=analysis.par$sig.network$igraph_obj,
es.method='weightedmean')

write.table(ac_mat, file="/home/wnamm/documents/Moffitt_Shaw_Lab/aml_NetBID2_runs/FredHutch_subset3/TF_Calculated_Activity_3.txt",sep="\t");

write.table(sig_ac_mat, file="/home/wnamm/documents/Moffitt_Shaw_Lab/aml_NetBID2_runs/FredHutch_subset3/SIG_Calculated_Activity_3.txt",sep="\t");

