/*MSDS 6370: STATISTICAL SAMPLING TERM PROJECT*/

/*Read in and Descriptive Statistics*/
data projectData;
infile '/home/nelsonjohn0/sasuser.v94/MSDS6370/projectData_strata.csv' dlm=',' firstobs=2 dsd;                                                                                                        
input coID Sales Inventory cumInventory Strata1 Strata2 Strata3;

/*SAMPLING METHOD 3: Equal W_h S_h*/
/*Determine Neyman Samples*/
proc surveyselect data=projectData method=srs out=method3_samp1 sampsize=(44, 37, 7, 14, 7, 43, 43, 116, 189) seed=91119;
strata Strata3;
title 'Method 3: 1';

proc surveyselect data=projectData method=srs out=method3_samp2 sampsize=(44, 37, 7, 14, 7, 43, 43, 116, 189) seed=91120;
strata Strata3;
title 'Method 3: 2';

proc surveyselect data=projectData method=srs out=method3_samp3 sampsize=(44, 37, 7, 14, 7, 43, 43, 116, 189) seed=91121;
strata Strata3;
title 'Method 3: 3';

proc surveyselect data=projectData method=srs out=method3_samp4 sampsize=(44, 37, 7, 14, 7, 43, 43, 116, 189) seed=91122;
strata Strata3;
title 'Method 3: 4';

proc surveyselect data=projectData method=srs out=method3_samp5 sampsize=(44, 37, 7, 14, 7, 43, 43, 116, 189) seed=91123;
strata Strata3;
title 'Method 3: 5';

/*Manual input: strata sizes from python file*/
data strsizes3;
input Strata3 _total_;
datalines;
1 4215
2 1513
3 963
4 717
5 556
6 781
7 471
8 357
9 189
;

/*Results*/
proc surveymeans data=projectData mean stderr CLM sum std CLSUM total=strsizes3;
var Inventory;
strata Strata3; 
ods output statistics=true_values3;
title "Method 2: Actual";
run;

proc surveymeans data=method3_samp1 mean stderr CLM sum std CLSUM total=strsizes3;
var Inventory;
weight SamplingWeight;
strata Strata3; 
ods output statistics=method3_result1;
title "Method 3: 1";
run;


proc surveymeans data=method3_samp2 mean stderr CLM sum std CLSUM total=strsizes3;
var Inventory;
weight SamplingWeight;
strata Strata3;
ods output statistics=method3_result2;
title "Method 3: 2";
run;

proc surveymeans data=method3_samp3 mean stderr CLM sum std CLSUM total=strsizes3;
var Inventory;
weight SamplingWeight;
strata Strata3;
ods output statistics=method3_result3;
title "Method 3: 3";
run;

proc surveymeans data=method3_samp4 mean stderr CLM sum std CLSUM total=strsizes3;
var Inventory;
weight SamplingWeight;
strata Strata3;
ods output statistics=method3_result4;
title "Method 3: 4";
run;

proc surveymeans data=method3_samp5 mean stderr CLM sum std CLSUM total=strsizes3;
var Inventory;
weight SamplingWeight;
strata Strata3;
ods output statistics=method3_result5;
title "Method 3: 5";
run;

data method3_results;
set true_values3 method3_result1 method3_result2 method3_result3 method3_result4 method3_result5;
title "Method 3: Results";
run;

proc print data=method3_results;
run;

/*Results*/
proc surveymeans data=projectData mean stderr CLM sum std CLSUM total=strsizes3;
var Sales;
strata Strata3; 
ods output statistics=true_values3;
title "Method 2: Actual";
run;

proc surveymeans data=method3_samp1 mean stderr CLM sum std CLSUM total=strsizes3;
var Sales;
weight SamplingWeight;
strata Strata3; 
ods output statistics=method3_result1;
title "Method 3: 1";
run;


proc surveymeans data=method3_samp2 mean stderr CLM sum std CLSUM total=strsizes3;
var Sales;
weight SamplingWeight;
strata Strata3;
ods output statistics=method3_result2;
title "Method 3: 2";
run;

proc surveymeans data=method3_samp3 mean stderr CLM sum std CLSUM total=strsizes3;
var Sales;
weight SamplingWeight;
strata Strata3;
ods output statistics=method3_result3;
title "Method 3: 3";
run;

proc surveymeans data=method3_samp4 mean stderr CLM sum std CLSUM total=strsizes3;
var Sales;
weight SamplingWeight;
strata Strata3;
ods output statistics=method3_result4;
title "Method 3: 4";
run;

proc surveymeans data=method3_samp5 mean stderr CLM sum std CLSUM total=strsizes3;
var Sales;
weight SamplingWeight;
strata Strata3;
ods output statistics=method3_result5;
title "Method 3: 5";
run;

data method3_results;
set true_values3 method3_result1 method3_result2 method3_result3 method3_result4 method3_result5;
title "Method 3: Results";
run;

proc print data=method3_results;
run;