/*DUMMY CODE: PROC SURVEYSELECT AND PROC SURVEYMEANS SKELETON CODE*/
/*PROCESS REPEATED 5 TIMES FOR EACH SAMPLING DESIGN ON EACH VARIABLE*/
/*THE SAME 5 SEEDS WERE USED IN EACH REPETITION*/

/*SAMPLING METHOD X: Method Name*/
proc surveyselect data=projectData method=srs out=methodX_samp1 
sampsize=(55, 32, 18, 18, 33, 25, 126, 125, 57, 11) /*changes depending on method*/
seed=91119; /*91119-91123 used in succession for each sample iteration*/
strata StrataX;
title 'Method X: 1';

*
*
*
*
Repeat to Method X: 5;

/*Manual input: strata sizes from python file*/
data strsizesX;
input StrataX _total_;
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
; /*changes depending on method*/

/*Results*/
proc surveymeans data=projectData mean stderr CLM sum std CLSUM total=strsizesX;
var <variable>; /*insert variable*/
strata StrataX; 
ods output statistics=true_values;
title "Method X: Actual";
run;

proc surveymeans data=methodX_samp1 mean stderr CLM sum std CLSUM total=strsizesX;
var <variable>; /*insert variable*/
weight SamplingWeight;
strata StrataX; 
ods output statistics=methodX_result1;
title "Method X: 1";
run;

*
*
*
*
Repeat to Method X: 5;

data method1_results;
set true_values methodX_result1 methodX_result2 methodX_result3 methodX_result4 methodX_result5;
title "Method X: Results";
run;

proc print data=methodX_results;
run;