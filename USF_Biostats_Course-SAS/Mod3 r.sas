libname mod3 "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs\mod3";
proc corr data=mod3.ch05q01 outp=corr;
var DRYWGT AGE;
run;
quit;
