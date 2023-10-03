/*This program performs two variables added in order tests.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc glm data = inputs.exam2b;
model Y = X2 X1 / SS1;
run;
proc glm data = inputs.exam2b;
model Y = X1 X2 / SS1;
run;
quit;
