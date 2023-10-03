libname test1 "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs\test1";
proc reg data = test1.exam1b;
model Y=X;
run;
quit;
