/*This code uses corr to find r and the standard deviations of X and Y.
It also performs regression to get beta1.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc corr data = inputs.ch06q03;
var Y X;
run;
proc reg data = inputs.ch06q03;
model Y = X;
run;
quit;
