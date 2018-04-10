/*MSDS 6370: STATISTICAL SAMPLING TERM PROJECT*/

/*Read in and Descriptive Statistics*/
data projectData;
infile '/home/nelsonjohn0/sasuser.v94/MSDS6370/projectData_strata.csv' dlm=',' firstobs=2 dsd;                                                                                                        
input coID Sales Inventory cumInventory Strata1 Strata2 Strata3;

/*SAMPLING METHOD 2: Cumulative SQRT Frequency Sample*/
/*Determine Neyman Samples*/
proc surveyselect data=projectData method=srs out=method2_samp1 sampsize=(63, 63, 62, 62, 62, 62, 62, 62, 2) seed=91119;
strata Strata2;
title 'Method 2: 1';

proc surveyselect data=projectData method=srs out=method2_samp2 sampsize=(63, 63, 62, 62, 62, 62, 62, 62, 2) seed=91120;
strata Strata2;
title 'Method 2: 2';

proc surveyselect data=projectData method=srs out=method2_samp3 sampsize=(63, 63, 62, 62, 62, 62, 62, 62, 2) seed=91121;
strata Strata2;
title 'Method 2: 3';

proc surveyselect data=projectData method=srs out=method2_samp4 sampsize=(63, 63, 62, 62, 62, 62, 62, 62, 2) seed=91122;
strata Strata2;
title 'Method 2: 4';

proc surveyselect data=projectData method=srs out=method2_samp5 sampsize=(63, 63, 62, 62, 62, 62, 62, 62, 2) seed=91123;
strata Strata2;
title 'Method 2: 5';

/*Manual input: strata sizes from python file*/
data strsizes2;
input Strata2 _total_;
datalines;
1 3368
2 2473
3 1535
4 842
5 556
6 364
7 241
8 381
9 2
;

/*Results*/
proc surveymeans data=projectData mean stderr CLM sum std CLSUM total=strsizes2;
var Inventory;
strata Strata2; 
ods output statistics=true_values2;
title "Method 2: Actual";
run;

proc surveymeans data=method2_samp1 mean stderr CLM sum std CLSUM total=strsizes2;
var Inventory;
weight SamplingWeight;
strata Strata2; 
ods output statistics=method2_result1;
title "Method 2: 1";
run;


proc surveymeans data=method2_samp2 mean stderr CLM sum std CLSUM total=strsizes2;
var Inventory;
weight SamplingWeight;
strata Strata2;
ods output statistics=method2_result2;
title "Method 2: 2";
run;

proc surveymeans data=method2_samp3 mean stderr CLM sum std CLSUM total=strsizes2;
var Inventory;
weight SamplingWeight;
strata Strata2;
ods output statistics=method2_result3;
title "Method 2: 3";
run;

proc surveymeans data=method2_samp4 mean stderr CLM sum std CLSUM total=strsizes2;
var Inventory;
weight SamplingWeight;
strata Strata2;
ods output statistics=method2_result4;
title "Method 2: 4";
run;

proc surveymeans data=method2_samp5 mean stderr CLM sum std CLSUM total=strsizes2;
var Inventory;
weight SamplingWeight;
strata Strata2;
ods output statistics=method2_result5;
title "Method 2: 5";
run;

data method2_results;
set true_values2 method2_result1 method2_result2 method2_result3 method2_result4 method2_result5;
title "Method 2: Results";
run;

proc print data=method2_results;
run;

/*Results*/
proc surveymeans data=projectData mean stderr CLM sum std CLSUM total=strsizes2;
var Sales;
strata Strata2; 
ods output statistics=true_values2;
title "Method 2: Actual";
run;

proc surveymeans data=method2_samp1 mean stderr CLM sum std CLSUM total=strsizes2;
var Sales;
weight SamplingWeight;
strata Strata2; 
ods output statistics=method2_result1;
title "Method 2: 1";
run;


proc surveymeans data=method2_samp2 mean stderr CLM sum std CLSUM total=strsizes2;
var Sales;
weight SamplingWeight;
strata Strata2;
ods output statistics=method2_result2;
title "Method 2: 2";
run;

proc surveymeans data=method2_samp3 mean stderr CLM sum std CLSUM total=strsizes2;
var Sales;
weight SamplingWeight;
strata Strata2;
ods output statistics=method2_result3;
title "Method 2: 3";
run;

proc surveymeans data=method2_samp4 mean stderr CLM sum std CLSUM total=strsizes2;
var Sales;
weight SamplingWeight;
strata Strata2;
ods output statistics=method2_result4;
title "Method 2: 4";
run;

proc surveymeans data=method2_samp5 mean stderr CLM sum std CLSUM total=strsizes2;
var Sales;
weight SamplingWeight;
strata Strata2;
ods output statistics=method2_result5;
title "Method 2: 5";
run;

data method2_results;
set true_values2 method2_result1 method2_result2 method2_result3 method2_result4 method2_result5;
title "Method 2: Results";
run;

proc print data=method2_results;
run;