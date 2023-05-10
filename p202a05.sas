**************************************************;
*  Activity 2.05                                 *;
*    Add a subsetting IF statement to output     *;
*    only the final day of each month.           *;
**************************************************;


/*Run the program. How many rows are in the output table?*/
data houston_monthly;
	set pg2.weather_houston;
	keep Date Month DailyRain MTDRain;
	by Month;
	if first.Month=1 then MTDRain=0;
	MTDRain+DailyRain;
run;       
/*answer: 365 rows and 4 columns*/

/*Add a subsetting IF statement to output only the final day of each month. Run the program.*/

data houston_monthly;
	set pg2.weather_houston;
	keep Date Month DailyRain MTDRain;
	by Month;
	if first.Month=1 then MTDRain=0;
	MTDRain+DailyRain;
	if last.Month=1;
run;

/*Answer: data houston_monthly;
    set pg2.weather_houston;
    keep Date Month DailyRain MTDRain;
    by Month;
    if first.Month=1 then MTDRain=0;
    MTDRain+DailyRain;
    if last.Month=1;
run;       
These are equivalent statements:

if last.Month;
if last.Month then output;*/

/*12 row, one for each month*/
