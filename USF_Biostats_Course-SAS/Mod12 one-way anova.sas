/*This code performs one-way ANOVA; it is used to find the category means,
an overall F test, and a Scheffe multiple comparison test.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc glm data = inputs.ch17q08;
class PERSON;
model Y = PERSON;
means PERSON / Scheffe;
run;
quit;
