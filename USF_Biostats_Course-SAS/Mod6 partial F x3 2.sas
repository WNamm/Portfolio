/*This program performs regression with three partial F tests:
Two are variables-added-in-order and one is variables-added-last.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc glm data = inputs.ch08q11;
model SALES = TV PRINT / SS1;
run;
proc glm data = inputs.ch08q11;
model SALES = PRINT TV / SS1;
run;
proc glm data = inputs.ch08q11;
model SALES = TV PRINT / SS3;
run;
quit;
