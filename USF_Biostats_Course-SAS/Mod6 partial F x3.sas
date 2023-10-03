/*This program performs regression with three partial F tests:
Two are variables-added-in-order and one is variables-added-last.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc glm data = inputs.ch08q02;
model Y = X1 X2 / SS1;
run;
proc glm data = inputs.ch08q02;
model Y = X2 X1 / SS1;
run;
proc glm data = inputs.ch08q02;
model Y = X1 X2 / SS3;
run;
quit;
