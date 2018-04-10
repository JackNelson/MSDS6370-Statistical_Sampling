FILENAME REFFILE '/home/opadilla0/sasuser.v94/MSDS6370/projectData_strata.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=projectData;
	GETNAMES=YES;
RUN;

/* Section 1. Descriptive Statistics */

ods noproctitle;
ods graphics / imagemap=on;

proc means data=WORK.PROJECTDATA chartype mean std min max median n nmiss 
		sum vardef=df clm alpha=0.05 qmethod=os;
	var inventory sales;
	title 'Section 1. Descriptive Statistics';
run;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=projectData;
	histogram inventory /;
	density inventory;
	yaxis grid;
	title 'Inventory Histogram';
run;

ods graphics / reset;

ods noproctitle;
ods graphics / imagemap=on;

proc corr data=projectData pearson nosimple noprob 
		plots(maxpoints=none)=matrix(histogram);
	var inventory;
	with sales;
	title 'Correlation Sales-Inventory';
run;

/* Correlation by Strata */
ods noproctitle;
ods graphics / imagemap=on;

proc sort data=projectData out=Work.SortTempTableSorted;
	by Cum_fy_Stratum;
run;

proc corr data=Work.SortTempTableSorted pearson nosimple noprob 
		plots(maxpoints=none)=matrix(histogram nvar=10 nwith=10);
	var inventory;
	with sales;
	by Cum_fy_Stratum;
run;

proc delete data=Work.SortTempTableSorted;
run;

/* Section 2. Stratification */
/* 2.1 Cumulative Method of Forming Strata */
proc surveyselect data=projectData method = srs out = cum_method 
	sampsize = (166, 47, 36, 38, 44, 50, 52, 51, 14, 2) 
	seed=91118; 
	strata Cum_Stratum; 
	title "Selection: Cumulative Method of Forming Strata";
run;

data cum_method_sizes;
	input Cum_Stratum _total_;
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
run;

proc surveymeans data = cum_method sum clsum total = cum_method_sizes
	mean sum clm CLSUM;
	var inventory sales;
	weight SamplingWeight;
	strata Cum_Stratum;
	title "Estimates: Cumulative Method of Forming Strata";
run;

/* 2.2 Equal WhSh per Stratum Method */
proc surveyselect data=projectData method = srs out = EWhSh_method 
	sampsize = (63, 63, 62, 62, 62, 62, 62, 62, 2) 
	seed=91119; 
	strata E_Stratum_3; 
	title "Selection: Equal WhSh per Stratum Method";
run;

data EWhSh_method_sizes;
	input E_Stratum_3 _total_;
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
run;

proc surveymeans data = EWhSh_method sum clsum total = EWhSh_method_sizes
	mean sum clm CLSUM;
	var inventory sales;
	weight SamplingWeight;
	strata E_Stratum_3;
	title "Estimates: Equal WhSh per Stratum Method";
run;

/* 2.3 cum sqrt of f Method */
proc surveyselect data=projectData method = srs out = cum_sqf_method 
	sampsize = (44, 37, 7, 14, 7, 43, 43, 116, 189) 
	seed=91121; 
	strata Cum_fy_Stratum; 
	title "Selection: cum sqrt of f Method";
run;

data cum_sqf_method_sizes;
	input Cum_fy_Stratum _total_;
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
run;

proc surveymeans data = cum_sqf_method sum clsum total = cum_sqf_method_sizes
	mean sum clm CLSUM;
	var inventory sales;
	weight SamplingWeight;
	strata Cum_fy_Stratum;
	title "Estimates: cum sqrt of f Method";
run;

/* 2.1a Cumulative Method Seed 1 */
proc surveyselect data=projectData method = srs out = seed1 
	sampsize = (166, 47, 36, 38, 44, 50, 52, 51, 14, 2) 
	seed=13177; 
	strata Cum_Stratum; 
	title "Selection: Seed 1";
run;


proc surveymeans data = seed1 sum clsum total = cum_method_sizes
	mean sum clm CLSUM;
	var inventory;
	weight SamplingWeight;
	strata Cum_Stratum;
	title "Estimates: Seed 1";
run;

/* 2.1b Cumulative Method Seed 2 */
proc surveyselect data=projectData method = srs out = seed2 
	sampsize = (166, 47, 36, 38, 44, 50, 52, 51, 14, 2) 
	seed=23973; 
	strata Cum_Stratum; 
	title "Selection: Seed 2";
run;


proc surveymeans data = seed2 sum clsum total = cum_method_sizes
	mean sum clm CLSUM;
	var inventory;
	weight SamplingWeight;
	strata Cum_Stratum;
	title "Estimates: Seed 2";
run;

/* 2.1c Cumulative Method Seed 3 */
proc surveyselect data=projectData method = srs out = seed3 
	sampsize = (166, 47, 36, 38, 44, 50, 52, 51, 14, 2) 
	seed=35777; 
	strata Cum_Stratum; 
	title "Selection: Seed 3";
run;


proc surveymeans data = seed3 sum clsum total = cum_method_sizes
	mean sum clm CLSUM;
	var inventory;
	weight SamplingWeight;
	strata Cum_Stratum;
	title "Estimates: Seed 3";
run;

/* 2.1d Cumulative Method Seed 4 */
proc surveyselect data=projectData method = srs out = seed4 
	sampsize = (166, 47, 36, 38, 44, 50, 52, 51, 14, 2) 
	seed=43687; 
	strata Cum_Stratum; 
	title "Selection: Seed 4";
run;


proc surveymeans data = seed4 sum clsum total = cum_method_sizes
	mean sum clm CLSUM;
	var inventory;
	weight SamplingWeight;
	strata Cum_Stratum;
	title "Estimates: Seed 4";
run;

/* 2.1e Cumulative Method Seed 5 */
proc surveyselect data=projectData method = srs out = seed5 
	sampsize = (166, 47, 36, 38, 44, 50, 52, 51, 14, 2) 
	seed=50915; 
	strata Cum_Stratum; 
	title "Selection: Seed 5";
run;


proc surveymeans data = seed5 sum clsum total = cum_method_sizes
	mean sum clm CLSUM;
	var inventory;
	weight SamplingWeight;
	strata Cum_Stratum;
	title "Estimates: Seed 5";
run;

/* 2.6 SRS without Stratification */
proc surveyselect data=projectData method = srs out = srswostrat 
	sampsize = 500 
	seed=17;
	title "SRS without Stratification";
run;


proc surveymeans data = srswostrat sum clsum total = 9762
	mean sum clm CLSUM;
	var inventory;
	title "Estimates: SRS without Stratification";
run;