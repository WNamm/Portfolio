/*This code determines two correlation coefficients (r).*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc reg data = inputs.exam2b;
model Y = X1 X2/pcorr1;
model Y = X2 X1/pcorr1
run;
quit;
