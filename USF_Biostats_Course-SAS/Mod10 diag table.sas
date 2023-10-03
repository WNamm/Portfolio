/*This code displays a chart of numerical regression diagnostic data.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc reg data = inputs.ch08q02;
model Y = X1 X2;
output out=diagnostics(keep = X1 X2 Y rstud lev cooks dffit) rstudent=rstud h=lev cookd=cooks dffits=dffit;
run;
quit;

proc print data=diagnostics;
run;
quit;
