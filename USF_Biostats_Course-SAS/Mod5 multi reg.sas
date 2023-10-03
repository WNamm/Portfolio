/*This code performs a multiple regression analysis.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc reg data = inputs.ch08q11;
model SALES = TV PRINT;
run;
quit;
