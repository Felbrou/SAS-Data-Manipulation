/*Challenge Practice: Creating Multiple Output Tables Based on Group Values*/

/*Create a new program.

Write a DATA step that creates two tables, singlestate and multistate, from the pg2.np_acres table.
The singlestate table includes the rows with unique park names.
The multistate table includes the rows with park names that appear in multiple states.
The parks should be grouped within their associated regions.
When sorting the data, keep only the Region, ParkName, State, and GrossAcres columns.
Submit the program and examine the output data.*/

proc sort data=pg2.np_acres 
          out=sortedAcres(keep=Region ParkName State GrossAcres);
    by Region ParkName;
run;
	
data multiState singleState;
    set sortedAcres;
    by Region ParkName;
    if First.ParkName=1 and Last.ParkName=1 
        then output singleState;
    else output multiState;
    format GrossAcres comma15.;
run;
