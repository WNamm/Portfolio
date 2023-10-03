/*This code uses the given data set modified to have dummy variables:
LATIN = 0 and AFRICAN = 1.  Also, the INTR column contains YNG*COUNTRY.
It will determine Hypothesis tests for Parallelism, Equal Intercepts, and Coincidence.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc reg data = inputs.ch12q02_mod;
model PCI = YNG COUNTRY INTR;
run;
quit;
