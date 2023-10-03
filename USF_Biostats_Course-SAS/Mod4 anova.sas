/*Uses standard reqression procedure to construct an ANOVA table*/
libname mod4 "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs\mod4";
proc reg data=mod4.ch07q11;
model NUMCELLS=TEMP;
run;
quit;
