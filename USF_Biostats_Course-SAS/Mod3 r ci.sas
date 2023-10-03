/*Calculates sample correlation coefficient r and
the 95% confidence interval for population correlation coefficient rho
for two different regressions.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc corr data=inputs.ch05q01 fisher (biasadj=no);
var DRYWGT AGE;
run;
proc corr data=inputs.ch05q01 fisher (biasadj=no);
var LOGDRYWG AGE;
run;
quit;
