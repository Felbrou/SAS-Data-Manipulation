proc sort data=sashelp.shoes
	out=shoes_sorted;
	by Region Product;
run;
	
data profitsummary;
	set shoes_sorted;
	by Region Product;
	Profit=Sales-Returns;
	if First.Product=1 then TotalProfit=0;
	TotalProfit+Profit;
	if Last.Product=1;
	keep Region Product TotalProfit;
	format TotalProfit dollar12. Profit dollar12.;
run;
