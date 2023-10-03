/*This code performs a Forward Stepwise approach for finding the best model.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc reg data = inputs.ch08q04 outest = fits;
model Y = X1 X2 X3 / selection = stepwise slentry = 0.1 slstay = 0.1;
run;
quit;
