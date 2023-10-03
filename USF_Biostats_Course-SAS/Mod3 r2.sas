/*Calculates determination coefficient r2 using typical regression procedure
for two regression lines.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc reg data=inputs.ch05q01;
model DRYWGT=AGE;
run;
proc reg data=inputs.ch05q01;
model LOGDRYWG=AGE;
run;
quit;
