/*Used for plotting the studentized residuals versus the predicted values,
as well as making the outlier plots.*/
libname inputs = "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc reg data = inputs.ch05q01;
model LOGDRYWG = AGE;
run;
quit;
