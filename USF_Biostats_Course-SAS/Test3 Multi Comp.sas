/*This code performs an overall F test and a multiple comparison test
for data with a categorical predictor variable.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc glm data = inputs.exam3b;
class Program;
model Y = Program;
Means Program / Tukey;
run;
quit;
