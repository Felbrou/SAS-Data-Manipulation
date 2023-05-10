***********************************************************;
*  Activity 2.04                                          *;
*  1) Change the WHERE statement to a subsetting IF       *;
*     statement and submit the program. How many rows are *;
*     included in the output table?                       *;
*  2) Move the subsetting IF statement just before the    *;
*     RUN statement and submit the program. How many rows *;
*     are included in the output table?                   *;
*  3) Consider the sequence of the statements in the      *;
*     execution phase. Where is the optimal placement of  *;
*     the subsetting IF statement?                        *;
***********************************************************;
proc sort data=pg2.storm_2017 out=storm2017_sort;
	by Basin MaxWindMPH;
run;

data storm2017_max;
	set storm2017_sort;
	by Basin;
	IF last.Basin=1;
	StormLength=EndDate-StartDate;
	MaxWindKM=MaxWindMPH*1.60934;
run;
/*answer: Five rows, one for each value of Basin */

/*2)Move the subsetting IF statement just before the RUN statement and submit the program. How many rows are included in the output table?*/
proc sort data=pg2.storm_2017 out=storm2017_sort;
	by Basin MaxWindMPH;
run;

data storm2017_max;
	set storm2017_sort;
	by Basin;	
	StormLength=EndDate-StartDate;
	MaxWindKM=MaxWindMPH*1.60934;
	IF last.Basin=1;
run;
/*Answer: Five rows, the same as the previous program*/

/*3)Consider the sequence of the statements in the execution phase. Where is the optimal placement of the subsetting IF statement?*/
/*Answer: Use the subsetting IF statement aas early as possible so that SAS processes additional satements only for rows that will be written to the output table, the execution its faster too for the IF placed in the firsts rows of the DATA step
data storm2017_max;
    set storm2017_sort;
    by Basin;
    if last.Basin=1;
    StormLength=EndDate-StartDate;
    MaxWindKM=MaxWindMPH*1.60934;
run;  */
