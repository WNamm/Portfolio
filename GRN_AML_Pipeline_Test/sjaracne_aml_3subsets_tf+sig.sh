# This shell script uses SJARACNe to generate six gene networks for the subsets of the AML dataset that each contain 300 random samples.
# There are three random subsets used, and each one is used for both transcription factor (TF) and signaling factor (SIG) network generation.
# Requires activation of the conda environment py36_SJARACNe
sjaracne local -e /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/inputs/FredHutch_1TPM_Final_randsubset1.txt -g /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/test_data/inputs/Transcription_Factor_List.txt -n 2 -o /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/outputs/cwl/aml_TF_FredHutch_subset1
echo "+++++ subset 1 TF complete +++++"
sjaracne local -e /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/inputs/FredHutch_1TPM_Final_randsubset2.txt -g /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/test_data/inputs/Transcription_Factor_List.txt -n 2 -o /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/outputs/cwl/aml_TF_FredHutch_subset2
echo "+++++ subset 2 TF complete +++++"
sjaracne local -e /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/inputs/FredHutch_1TPM_Final_randsubset3.txt -g /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/test_data/inputs/Transcription_Factor_List.txt -n 2 -o /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/outputs/cwl/aml_TF_FredHutch_subset3
echo "+++++ subset 3 TF complete +++++"
sjaracne local -e /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/inputs/FredHutch_1TPM_Final_randsubset1.txt -g /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/test_data/inputs/sig_geneSymbol_uniq.txt -n 2 -o /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/outputs/cwl/aml_SIG_FredHutch_subset1
echo "+++++ subset 1 SIG complete +++++"
sjaracne local -e /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/inputs/FredHutch_1TPM_Final_randsubset2.txt -g /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/test_data/inputs/sig_geneSymbol_uniq.txt -n 2 -o /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/outputs/cwl/aml_SIG_FredHutch_subset2
echo "+++++ subset 2 SIG complete +++++"
sjaracne local -e /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/inputs/FredHutch_1TPM_Final_randsubset3.txt -g /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/test_data/inputs/sig_geneSymbol_uniq.txt -n 2 -o /home/wnamm/documents/Moffitt_Shaw_Lab/SJARACNe-studies/aml_data/outputs/cwl/aml_SIG_FredHutch_subset3
echo "+++++ subset 3 SIG complete +++++"
