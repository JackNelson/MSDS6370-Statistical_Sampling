data industry2;
infile '/home/nelsonjohn0/sasuser.v94/MSDS6370/MSDS6370_LAB04_2.csv' dlm=',' firstobs=2 dsd;                                                                                                        
input industry $ UnitId mos stratum Sales;                                                                                                                                      

proc surveyselect data=industry2 method=srs out=propsample sampsize=(19, 13, 9, 5, 4) seed=91118;
strata stratum;
title 'Proportional allocation';

proc surveyselect data=industry2 method=srs out=neysample sampsize=(7, 11, 14, 9, 9) seed=91119;
strata stratum;
title 'Neyman allocation';

proc surveyselect data=industry2 method=srs out=mossample sampsize=(3, 7, 11, 12, 17) seed=91120;
strata stratum;
title 'Neyman with mos for std dev allocation';

run;

data strsizes;
input stratum _total_;
datalines;
1 141
2 100
3 63
4 38
5 31
;

run;

proc surveymeans data=propsample sum clsum total=strsizes mean sum CLSUM;
var sales;
weight SamplingWeight;
strata stratum;
title "Proportional allocation";
run;

proc surveymeans data=neysample sum clsum total=strsizes mean sum CLSUM;
var sales;
weight SamplingWeight;
strata stratum;
title "Neyman allocation";
run;

proc surveymeans data=mossample sum clsum total=strsizes mean sum CLSUM;
var sales;
weight SamplingWeight;
strata stratum;
title "Neyman substituting MOS allocation";
run;