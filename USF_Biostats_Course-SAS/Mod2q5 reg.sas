libname Mod2q5 "C:\Users\WNamm\Documents\SAS_docs\SAS_inputs\mod2ch5q5";
proc reg data = Mod2q5.ch05q05;
model VOTE = TVEXP;
run;
quit;
