/*MSDS 6370: STATISTICAL SAMPLING TERM PROJECT*/

/*Read in and Descriptive Statistics*/
data projectData;
infile '/home/nelsonjohn0/sasuser.v94/MSDS6370/projectData2.csv' dlm=',' firstobs=2 dsd;                                                                                                        
input num coID Sales Inventory Strata1 Strata2 Strata3;

/*SAMPLING METHOD 1: Cumulative Sample*/
/*Determine Neyman Samples*/
proc surveyselect data=projectData method=srs out=method1_samp1 sampsize=(55, 32, 18, 18, 33, 25, 126, 125, 57, 11) seed=91119;
strata Strata1;
title 'Method 1: 1';

proc surveyselect data=projectData method=srs out=method1_samp2 sampsize=(55, 32, 18, 18, 33, 25, 126, 125, 57, 11) seed=91120;
strata Strata1;
title 'Method 1: 2';

proc surveyselect data=projectData method=srs out=method1_samp3 sampsize=(55, 32, 18, 18, 33, 25, 126, 125, 57, 11) seed=91121;
strata Strata1;
title 'Method 1: 3';

proc surveyselect data=projectData method=srs out=method1_samp4 sampsize=(55, 32, 18, 18, 33, 25, 126, 125, 57, 11) seed=91122;
strata Strata1;
title 'Method 1: 4';

proc surveyselect data=projectData method=srs out=method1_samp5 sampsize=(55, 32, 18, 18, 33, 25, 126, 125, 57, 11) seed=91123;
strata Strata1;
title 'Method 1: 5';

/*Manual input: strata sizes from python file*/
data strsizes1;
input Strata1 _total_;
datalines;
1 4285
2 1988
3 1308
4 919
5 554
6 314
7 201
8 125
9 57
10 11
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


/*SAMPLING METHOD 2: Cumulative SQRT Frequency Sample*/
/*Determine Neyman Samples*/
proc surveyselect data=projectData method=srs out=method2_samp1 sampsize=(15, 3, 15, 2, 10, 15, 15, 311, 114) seed=91119;
strata Strata2;
title 'Method 2: 1';

proc surveyselect data=projectData method=srs out=method2_samp2 sampsize=(15, 3, 15, 2, 10, 15, 15, 311, 114) seed=91120;
strata Strata2;
title 'Method 2: 2';

proc surveyselect data=projectData method=srs out=method2_samp3 sampsize=(15, 3, 15, 2, 10, 15, 15, 311, 114) seed=91121;
strata Strata2;
title 'Method 2: 3';

proc surveyselect data=projectData method=srs out=method2_samp4 sampsize=(15, 3, 15, 2, 10, 15, 15, 311, 114) seed=91122;
strata Strata2;
title 'Method 2: 4';

proc surveyselect data=projectData method=srs out=method2_samp5 sampsize=(15, 3, 15, 2, 10, 15, 15, 311, 114) seed=91123;
strata Strata2;
title 'Method 2: 5';

/*Manual input: strata sizes from python file*/
data strsizes2;
input Strata2 _total_;
datalines;
1 2560
3 1725
4 1988
5 707
6 1099
7 740
8 410
9 419
10 114
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

/*SAMPLING METHOD 3: Equal W_h S_h*/
/*Determine Neyman Samples*/
proc surveyselect data=projectData method=srs out=method3_samp1 sampsize=(51, 97, 57, 60, 137, 85, 11, 2) seed=91119;
strata Strata3;
title 'Method 3: 1';

proc surveyselect data=projectData method=srs out=method3_samp2 sampsize=(51, 97, 57, 60, 137, 85, 11, 2) seed=91120;
strata Strata3;
title 'Method 3: 2';

proc surveyselect data=projectData method=srs out=method3_samp3 sampsize=(51, 97, 57, 60, 137, 85, 11, 2) seed=91121;
strata Strata3;
title 'Method 3: 3';

proc surveyselect data=projectData method=srs out=method3_samp4 sampsize=(51, 97, 57, 60, 137, 85, 11, 2) seed=91122;
strata Strata3;
title 'Method 3: 4';

proc surveyselect data=projectData method=srs out=method3_samp5 sampsize=(51, 97, 57, 60, 137, 85, 11, 2) seed=91123;
strata Strata3;
title 'Method 3: 5';

/*Manual input: strata sizes from python file*/
data strsizes3;
input Strata3 _total_;
datalines;
1 4208
2 3435
3 1212
4 529
5 280
6 85
7 11
8 2
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