/*This code can creat various plots and a table of Jackknife residuals, labeled as Rstudent by SAS.*/
libname inputs "C:\Users\WNamm\Documents\SAS_docs\SAS_Inputs";
proc reg data = inputs.ch05q01;
model LOGDRYWG = AGE / influence;
plot rstudent.*nqq.;
ods output OutputStatistics=mod10out;
run;
Proc boxplot data = work.mod10out;
plot RStudent*Dependent;
run;
proc univariate data = work.mod10out;
histogram Rstudent;
run;
quit;
