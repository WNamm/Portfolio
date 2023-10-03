/*This code is used to determine the regression model,
predict an outcome given new predictor values,
and perform an overall F test.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
data house_pred;
if _N_=1 then X1=12.5;output;
if _N_=1 then X2=2;output;
set inputs.exam2b;
run;
proc reg data = house_pred;
model Y = X1 X2/STB CLB clm;
run;
quit;
