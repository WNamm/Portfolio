/*This program runs three different regression analyses:
first on both predictors, then on each predictor separately.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc reg data = inputs.ch08q02;
model Y = X1 X2;
model Y = X1;
model Y = X2;
run;
quit;
