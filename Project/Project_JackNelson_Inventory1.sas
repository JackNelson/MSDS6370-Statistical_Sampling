/*MSDS 6370: STATISTICAL SAMPLING TERM PROJECT*/

/*Read in and Descriptive Statistics*/
data projectData;
infile '/home/nelsonjohn0/sasuser.v94/MSDS6370/projectData_strata.csv' dlm=',' firstobs=2 dsd;                                                                                                        
input coID Sales Inventory cumInventory Strata1 Strata2 Strata3;

/*SAMPLING METHOD 1: Cumulative Sample*/
/*Determine Neyman Samples*/
proc surveyselect data=projectData method=srs out=method1_samp1 sampsize=(166, 47, 36, 38, 44, 50, 52, 51, 14, 2) seed=91119;
strata Strata1;
title 'Method 1: 1';

proc surveyselect data=projectData method=srs out=method1_samp2 sampsize=(166, 47, 36, 38, 44, 50, 52, 51, 14, 2) seed=91120;
strata Strata1;
title 'Method 1: 2';

proc surveyselect data=projectData method=srs out=method1_samp3 sampsize=(166, 47, 36, 38, 44, 50, 52, 51, 14, 2) seed=91121;
strata Strata1;
title 'Method 1: 3';

proc surveyselect data=projectData method=srs out=method1_samp4 sampsize=(166, 47, 36, 38, 44, 50, 52, 51, 14, 2) seed=91122;
strata Strata1;
title 'Method 1: 4';

proc surveyselect data=projectData method=srs out=method1_samp5 sampsize=(166, 47, 36, 38, 44, 50, 52, 51, 14, 2) seed=91123;
strata Strata1;
title 'Method 1: 5';

/*Manual input: strata sizes from python file*/
data strsizes1;
input Strata1 _total_;
datalines;
1 5728
2 1680
3 1002
4 600
5 361
6 202
7 122
8 51
9 14
10 2
;

/*Results*/
proc surveymeans data=projectData mean stderr CLM sum std CLSUM total=strsizes1;
var Inventory;
strata Strata1; 
ods output statistics=true_values;
title "Method 1: Actual";
run;

proc surveymeans data=method1_samp1 mean stderr CLM sum std CLSUM total=strsizes1;
var Inventory;
weight SamplingWeight;
strata Strata1; 
ods output statistics=method1_result1;
title "Method 1: 1";
run;


proc surveymeans data=method1_samp2 mean stderr CLM sum std CLSUM total=strsizes1;
var Inventory;
weight SamplingWeight;
strata Strata1;
ods output statistics=method1_result2;
title "Method 1: 2";
run;

proc surveymeans data=method1_samp3 mean stderr CLM sum std CLSUM total=strsizes1;
var Inventory;
weight SamplingWeight;
strata Strata1;
ods output statistics=method1_result3;
title "Method 1: 3";
run;

proc surveymeans data=method1_samp4 mean stderr CLM sum std CLSUM total=strsizes1;
var Inventory;
weight SamplingWeight;
strata Strata1;
ods output statistics=method1_result4;
title "Method 1: 4";
run;

proc surveymeans data=method1_samp5 mean stderr CLM sum std CLSUM total=strsizes1;
var Inventory;
weight SamplingWeight;
strata Strata1;
ods output statistics=method1_result5;
title "Method 1: 5";
run;

data method1_results;
set true_values method1_result1 method1_result2 method1_result3 method1_result4 method1_result5;
title "Method 1: Results";
run;

proc print data=method1_results;
run;

/*Results*/
proc surveymeans data=projectData mean stderr CLM sum std CLSUM total=strsizes1;
var Sales;
strata Strata1; 
ods output statistics=true_values;
title "Method 1: Actual";
run;

proc surveymeans data=method1_samp1 mean stderr CLM sum std CLSUM total=strsizes1;
var Sales;
weight SamplingWeight;
strata Strata1; 
ods output statistics=method1_result1;
title "Method 1: 1";
run;


proc surveymeans data=method1_samp2 mean stderr CLM sum std CLSUM total=strsizes1;
var Sales;
weight SamplingWeight;
strata Strata1;
ods output statistics=method1_result2;
title "Method 1: 2";
run;

proc surveymeans data=method1_samp3 mean stderr CLM sum std CLSUM total=strsizes1;
var Sales;
weight SamplingWeight;
strata Strata1;
ods output statistics=method1_result3;
title "Method 1: 3";
run;

proc surveymeans data=method1_samp4 mean stderr CLM sum std CLSUM total=strsizes1;
var Sales;
weight SamplingWeight;
strata Strata1;
ods output statistics=method1_result4;
title "Method 1: 4";
run;

proc surveymeans data=method1_samp5 mean stderr CLM sum std CLSUM total=strsizes1;
var Sales;
weight SamplingWeight;
strata Strata1;
ods output statistics=method1_result5;
title "Method 1: 5";
run;

data method1_results;
set true_values method1_result1 method1_result2 method1_result3 method1_result4 method1_result5;
title "Method 1: Results";
run;

proc print data=method1_results;
run;
