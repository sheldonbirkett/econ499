****2005-2019 REGRESSIONS BY SHELDON BIRKETT***

clear 

import delimited "C:\Users\sheld\Documents\Thesis_Data_Full_United_States\merged_data_with_block_groups\ACS5_2005_2019_FULL_DATAFRAME_FOR_ANALYSIS_no_geo.csv"


//Labels for Reference
// 			  "Total Race":"race_0", 
//               "White alone":"race_1",
//               "Black or African American alone":"race_2",
//               "American Indian and Alaska Native alone":"race_3",
//               "Asian alone":"race_4",
//               "Native Hawaiian and Other Pacific Islander alone":"race_5",
//               "Some other race alone":"race_6",
//               "Two or more races":"race_7",
//               "Total Travel Time to Work":"travel_0",
//               "Less than 5 minutes": "travel_1",
//               "5 to 9 minutes":"travel_2",
//               "10 to 14 minutes":"travel_3",
//               "15 to 19 minutes":"travel_4",
//               "20 to 24 minutes":"travel_5",
//               "25 to 29 minutes":"travel_6",
//               "30 to 34 minutes":"travel_7",
//               "35 to 39 minutes":"travel_8",
//               "40 to 44 minutes":"travel_9",
//               "45 to 59 minutes":"travel_10",
//               "60 to 89 minutes":"travel_11",
//               "90 or more minutes":"travel_12",
//               "Total Educational Attainment for the Population 25 Years and Over":"educ_0",
//               "No schooling completed":"educ_1",
//               "Nursery to 4th grade":"educ_2",
//               "5th and 6th grade":"educ_3",
//               "7th and 8th grade":"educ_4",
//               "9th grade":"educ_5",
//               "10th grade":"educ_6",
//               "11th grade":"educ_7",
//               "12th grade no diploma":"educ_8",
//               "High school graduate, GED, or alternative":"educ_9",
//               "Some college less than 1 year":"educ_10",
//               "Some college 1 or more years no degree":"educ_11",
//               "Associate's degree":"educ_12",
//               "Bachelor's degree":"educ_13",
//               "Master's degree":"educ_14",
//               "Professional school degree":"educ_15",
//               "Doctorate degree":"educ_16",
//               "Total Year Structure Built":"built_0",
//               "Built 2000 or later":"built_1",
//               "Built 1990 to 1999":"built_2",
//               "Built 1980 to 1989":"built_3",
//               "Built 1970 to 1979":"built_4",
//               "Built 1960 to 1969":"built_5",
//               "Built 1950 to 1959":"built_6",
//               "Built 1940 to 1949":"built_7",
//               "Built 1939 or earlier":"built_8",
//               "Total Bedrooms":"bdrm_0",
//               "1 bedroom":"bdrm_1",
//               "2 bedrooms":"bdrm_2",
//               "3 bedrooms":"bdrm_3",
//               "4 bedrooms":"bdrm_4",
//               "5 or more bedrooms":"bdrm_5", 
//               "Median gross rent":"rent",
//               "Lower value quartile (dollars)":"lowval",
//               "Median value (dollars)":"medval",
//               "Upper value quartile (dollars)":"upval",
//               "Total Mortgage Status":"mortag_0",
//               "Housing units with a mortgage contract to purchase or similar debt":"mortag_1",
//               "Housing units with a mortgage contract to purchase or similar debt With either a second mortgage or home equity loan but not both": "mortag_2",
//               "Housing units with a mortgage contract to purchase or similar debt Both second mortgage and home equity loan":"mortag_3",
//               "Housing units with a mortgage contract to purchase or similar debt No second mortgage and no home equity loan":"mortag_4",
//               "Housing units without a mortgage":"mortag_5"

****GENERATE DUMMY VARIABLES FOR MIN DISTANCE TO WILDFIRE VARIABLES - This is the cuttoff for treatment/control. I will be usings 4 km cuttoff ~ In literature 3.22km (3220m) (as specified by Loomis 2004)****

****Generate Dummt for Each Year***
forval i=5(1)9{
    generate treated_200`i'_sim = 0
	replace treated_200`i'_sim = 1 if min_dist_200`i'_sim <= 4000
}

forval i=10(1)18{
    generate treated_20`i'_sim = 0
	replace treated_20`i'_sim = 1 if min_dist_20`i'_sim <= 4000
}

forval i=5(1)9{
	generate treated_200`i'_sim4 = 0
	replace treated_200`i'_sim4 = 1 if min_dist_200`i'_sim > 4000 & min_dist_200`i'_sim <= 20000
}

forval i=10(1)18{
	generate treated_20`i'_sim4 = 0
	replace treated_20`i'_sim4 = 1 if min_dist_20`i'_sim > 4000 & min_dist_20`i'_sim <= 20000
}

forval i=5(1)9{
	generate treated_200`i'_sim20 = 0
	replace treated_200`i'_sim20 = 1 if min_dist_200`i'_sim > 20000
}

forval i=10(1)18{
	generate treated_20`i'_sim20 = 0
	replace treated_20`i'_sim20 = 1 if min_dist_20`i'_sim > 20000
}

***Generate Dummy by Kilometers By Fire Year***

***For =< 4km***

generate fire_4km_2005 = 0

forval i=5(1)9{
	replace fire_4km_2005 = 1 if treated_200`i'_sim == 1 
}

generate fire_4km_2010 = 0

forval i=10(1)14{
	replace fire_4km_2010 = 1 if treated_20`i'_sim == 1
}

generate fire_4km_2015 = 0

forval i=15(1)18{
	replace fire_4km_2015 = 1 if treated_20`i'_sim == 1
}

***For > 4km and <= 20km

generate fire_4_20km_2005 = 0

forval i=5(1)9{
	replace fire_4_20km_2005 = 1 if treated_200`i'_sim4 == 1 
}

generate fire_4_20km_2010 = 0

forval i=10(1)14{
	replace fire_4_20km_2010 = 1 if treated_20`i'_sim4 == 1
}

generate fire_4_20km_2015 = 0

forval i=15(1)18{
	replace fire_4_20km_2015 = 1 if treated_20`i'_sim4 == 1
}

***For > 20km

generate fire_20km_2005 = 0

forval i = 5(1)9{
	replace fire_20km_2005 = 1 if treated_200`i'_sim20 == 1
}

generate fire_20km_2010 = 0

forval i=10(1)14{
	replace fire_20km_2010 = 1 if treated_20`i'_sim20 == 1
}

generate fire_20km_2015 = 0

forval i=15(1)18{
	replace fire_20km_2015 = 1 if treated_20`i'_sim20 == 1
}

***Generate Time Dummy***

generate time = 0
replace time = 2 if year == "2015-2019"
replace time = 1 if year == "2010-2014"

****DESCRIPTIVE STATISTICS****

gen post_fire = 0
replace post_fire = 1 if treated_2005_sim == 1 | treated_2006_sim == 1 | treated_2007_sim == 1 | treated_2008_sim == 1 | treated_2009_sim == 1 | treated_2010_sim == 1 | treated_2011_sim == 1 | treated_2012_sim == 1 | treated_2013_sim == 1 | treated_2014_sim == 1 | treated_2015_sim == 1 | treated_2016_sim == 1 | treated_2017_sim == 1 | treated_2018_sim == 1

label variable post_fire "Block Group Close to Wildfire"

estpost tabstat medval lowval upval if time == 0, statistics(mean median) by(post_fire)

esttab, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2005-2009") eqlabels(, lhs("Within 4 km"))

esttab using comparison_table_2005_new.tex, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2005-2009") eqlabels(, lhs("Within 4 km")) replace

eststo clear 

estpost tabstat medval lowval upval if time == 1, statistics(mean median) by(post_fire)

esttab, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2010-2014") eqlabels(, lhs("Within 4 km"))

esttab using comparison_table_2010_new.tex, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2010-2014") eqlabels(, lhs("Within 4 km")) replace

eststo clear 

estpost tabstat medval lowval upval if time == 2, statistics(mean median) by(post_fire)

esttab, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2015-2019") eqlabels(, lhs("Within 4 km"))

esttab using comparison_table_2015_new.tex, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2015-2019") eqlabels(, lhs("Within 4 km")) replace

eststo clear 

egen average_mind_wildfire_sim = rowmean(min_dist_2005_sim min_dist_2006_sim min_dist_2007_sim min_dist_2008_sim min_dist_2009_sim min_dist_2010_sim min_dist_2011_sim min_dist_2012_sim min_dist_2013_sim min_dist_2014_sim min_dist_2015_sim min_dist_2016_sim min_dist_2017_sim min_dist_2018_sim)

label variable average_mind_wildfire_sim "Average Min Distance to a Wildfire (2005-2018)"

estpost summarize medval lowval upval average_mind_wildfire_sim

esttab, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) label title(Table 1. Summary Statistics: Property Value and Average Wildfire Distance) nonumber

esttab using tablesummstat_new.tex, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) label title(Table 1. Summary Statistics) nonumber replace

eststo clear 

mat T = J(3,5,.)

ttest medval if time == 0, by(post_fire)

mat T[1,1] = r(mu_1)
mat T[1,2] = r(mu_2)
mat T[1,3] = r(N_1)
mat T[1,4] = r(N_2)
mat T[1,5] = r(p)


ttest medval if time == 1, by(post_fire)

mat T[2,1] = r(mu_1)
mat T[2,2] = r(mu_2)
mat T[2,3] = r(N_1)
mat T[2,4] = r(N_2)
mat T[2,5] = r(p)

ttest medval if time == 2, by(post_fire)

mat T[3,1] = r(mu_1)
mat T[3,2] = r(mu_2)
mat T[3,3] = r(N_1)
mat T[3,4] = r(N_2)
mat T[3,5] = r(p)
mat rownames T = medval0 medval1 medval2

frmttable using ttest.tex, statmat(T) varlabels replace ///
	ctitle("", Sample1mean, Sample2mean, N_1, N_2, "p-value")


***Categories of Distances and Years - Number of Observations***

estpost sum fire_4km_2005 fire_4_20km_2005 fire_20km_2005 fire_4km_2010 fire_4_20km_2010 fire_20km_2010 fire_4km_2015 fire_4_20km_2015 fire_20km_2015

esttab, varwidth(20) modelwidth(10 20 10 10) cell((sum(label(Count)))) label title("Wildfires by Years and Distance" ) nonumber

esttab using distance_category.tex, varwidth(20) modelwidth(10 20 10 10) cell((sum(label(Count)))) label title("Wildfires by Years and Distance" ) nonumber replace

eststo clear

generate firebin_2005_2009 = 0
replace firebin_2005_2009 = 3 if treated_2005_sim20 == 1 | treated_2006_sim20 == 1 | treated_2007_sim20 == 1 | treated_2008_sim20 == 1 | treated_2009_sim20 == 1
replace firebin_2005_2009 = 2 if treated_2005_sim4 == 1 | treated_2006_sim4 == 1 | treated_2007_sim4 == 1 | treated_2008_sim4 == 1 | treated_2009_sim4 == 1
replace firebin_2005_2009 = 1 if treated_2005_sim == 1 | treated_2006_sim == 1 | treated_2007_sim == 1 | treated_2008_sim == 1 | treated_2009_sim == 1


generate firebin_2010_2014 = 0
replace firebin_2010_2014 = 3 if treated_2010_sim20 == 1 | treated_2011_sim20 == 1 | treated_2012_sim20 == 1 | treated_2013_sim20 == 1 | treated_2014_sim20 == 1
replace firebin_2010_2014 = 2 if treated_2010_sim4 == 1 | treated_2011_sim4 == 1 | treated_2012_sim4 == 1 | treated_2013_sim4 == 1 | treated_2014_sim4 == 1
replace firebin_2010_2014 = 1 if treated_2010_sim == 1 | treated_2011_sim == 1 | treated_2012_sim == 1 | treated_2013_sim == 1 | treated_2014_sim == 1

generate firebin_2015_2019 = 0
replace firebin_2015_2019 = 3 if treated_2015_sim20 == 1 | treated_2016_sim20 == 1 | treated_2017_sim20 == 1 | treated_2018_sim20 == 1
replace firebin_2015_2019 = 2 if treated_2015_sim4 == 1 | treated_2016_sim4 == 1 | treated_2017_sim4 == 1 | treated_2018_sim4 == 1
replace firebin_2015_2019 = 1 if treated_2015_sim == 1 | treated_2016_sim == 1 | treated_2017_sim == 1 | treated_2018_sim == 1

label variable firebin_2005_2009 "2005-2009"
label variable firebin_2010_2014 "2010-2014"
label variable firebin_2015_2019 "2015-2019"

estpost tabulate firebin_2005_2009 firebin_2010_2014

esttab, varwidth(10) modelwidth(10 10 10 10) unstack label title("Distance by Period: 2005-2009 by 2010-2014" ) nonumber

esttab using tab_2005_2009_by_2010_2014.tex, varwidth(10) modelwidth(10 10 10 10) unstack label title("Distance by Period: 2005-2009 by 2010-2014" ) nonumber replace

eststo clear 

estpost tabulate firebin_2005_2009 firebin_2015_2019

esttab, varwidth(10) modelwidth(10 10 10 10) unstack label title("Distance by Period: 2005-2009 by 2015-2018" ) nonumber

esttab using tab_2005_2009_by_2015_2018.tex, varwidth(10) modelwidth(10 10 10 10) unstack label title("Distance by Period: 2005-2009 by 2015-2018" ) nonumber replace

eststo clear 

estpost tabulate firebin_2010_2014 firebin_2015_2019

esttab, varwidth(10) modelwidth(10 10 10 10) unstack label title("Distance by Period: 2010-2014 by 2015-2018" ) nonumber

esttab using tab_2010_2014_by_2015_2018.tex, varwidth(10) modelwidth(10 10 10 10) unstack label title("Distance by Period: 2010-2014 by 2015-2018" ) nonumber replace

eststo clear


***firebin_****_**** == 1 if <= 4km, firebin_****_**** == 2 if <4km and <= 20km, firebin_****_**** == 3 if > 20km****

***REGRESSIONS****

global race race_2 race_3 race_4 race_5 race_6 race_7 
global travel travel_2 travel_3 travel_4 travel_5 travel_6 travel_7 travel_8 travel_9 travel_10 travel_11 travel_12
global educ educ_2 educ_3 educ_4 educ_5 educ_6 educ_7 educ_8 educ_9 educ_10 educ_11 educ_12 educ_13 educ_14 educ_15 educ_16
global built built_2 built_3 built_4 built_5 built_6 built_7 built_8
global bdrm bdrm_1 bdrm_2 bdrm_3 bdrm_4 bdrm_5
global mortag mortag_3 mortag_4 mortag_5

***mortag_2 mortag_3 mortag_4 are sub categories of mortag_1
***took out race 1, travel_1, educ_1, built_1, nobedroom, mortag_2 are the base categories

generate fire_2015 = 0 
replace fire_2015 = 1 if (treated_2005_sim == 1 | treated_2006_sim == 1 | treated_2007_sim == 1 | treated_2008_sim == 1 | treated_2009_sim == 1 | treated_2010_sim == 1 | treated_2011_sim == 1 | treated_2012_sim == 1 | treated_2013_sim == 1 | treated_2014_sim == 1) & (treated_2015_sim == 1)
replace fire_2015 = 1 if treated_2015_sim == 1

***Fire dummy within 4km for having experienced a fire in both periods or having experienced a fire only in 2015***

reg medval fire_2015

***REG (1) -TABLE 1***
eststo: reg medval fire_2015 $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)

reg medval fire_2015 $race $travel $educ $built $bdrm $mortag i.statea if time == 0, vce(robust)

reg medval fire_2015 $race $travel $educ $built $bdrm $mortag i.statea if time == 1, vce(robust)

reg medval fire_2015 $race $travel $educ $built $bdrm $mortag i.statea if time == 2, vce(robust)

**Crosssectional regresssions by period are not significant

sort gisjoin year 

by gisjoin: gen dmedval = medval-medval[_n-1]

*by gisjoin: gen dfire_2015 = fire_2015-fire_2015[_n-1] * no obs where dfire_2015 == 1

forval i=1(1)7{
	by gisjoin: gen drace_`i' = race_`i'- race_`i'[_n-1]
}

forval i=1(1)12{
	by gisjoin: gen dtravel_`i'= travel_`i'-travel_`i'[_n-1]
}

forval i=1(1)16{
	by gisjoin: gen deduc_`i' = educ_`i'-educ_`i'[_n-1]
}

forval i=1(1)8{
	by gisjoin: gen dbuilt_`i'=built_`i'-built_`i'[_n-1]
}

by gisjoin: gen dnobedroom = nobedroom - nobedroom[_n-1]

forval i=1(1)5{
	by gisjoin: gen dbdrm_`i' = bdrm_`i'-bdrm_`i'[_n-1]
}

forval i=2(1)5{
	by gisjoin: gen dmortag_`i'=mortag_`i'-mortag_`i'[_n-1]
}

global drace drace_2 drace_3 drace_4 drace_5 drace_6 drace_7
global dtravel dtravel_2 dtravel_3 dtravel_4 dtravel_5 dtravel_6 dtravel_7 dtravel_8 dtravel_9 dtravel_10 dtravel_11 dtravel_12
global deduc deduc_2 deduc_3 deduc_4 deduc_5 deduc_6 deduc_7 deduc_8 deduc_9 deduc_10 deduc_11 deduc_12 deduc_13 deduc_14 deduc_15 deduc_16
global dbuilt dbuilt_2 dbuilt_3 dbuilt_4 dbuilt_5 dbuilt_6 dbuilt_7 dbuilt_8
global dbdrm dbdrm_1 dbdrm_2 dbdrm_3 dbdrm_4 dbdrm_5
global dmortag dmortag_3 dmortag_4 dmortag_5

***took out drace_1, dtravel_1, deduc_1, dbuilt_1, dnobedroom, dmortag_2 are the base categories

reg dmedval fire_2015

***Regress x on the change in y shows a clear decrease by being close to a 2015 wildfire. This can suggest that after a wildfire your median property value decreases for homes close to a wildfire (not unexplained fixed effects are cancelled out in the difference so it controls for a lot of factors not captured in the no change in y regression)
***in comparison to the regression x on y the median property value is higher for homes close to a wildfire becuase there is no way of cancelling out unexplained fixed effects (amenity values, such as water, forests etc.) 

***REG (2)-TABLE 1***
eststo: reg dmedval fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

gen lnmedval = log(medval)

by gisjoin: gen dlnmedval = lnmedval - lnmedval[_n-1]


***REG (3)-TABLE 1***
eststo: reg dlnmedval fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)




forval i = 2000(500)30000{
	generate fire_2015_`i' = 0
	replace fire_2015_`i' = 1 if (min_dist_2005_sim <= `i' | min_dist_2006_sim <= `i' | min_dist_2007_sim <= `i' | min_dist_2008_sim <= `i' | min_dist_2009_sim <= `i' | min_dist_2010_sim <= `i' | min_dist_2011_sim <= `i' | min_dist_2012_sim <=`i' | min_dist_2013_sim <= `i' | min_dist_2014_sim <= `i') & (min_dist_2015_sim <= `i')
	replace fire_2015_`i' = 1 if min_dist_2015_sim <= `i'
}

local xlsrow = 2
putexcel set betaresult_2015, replace sheet("Betas1")
putexcel A1=("Betas")
putexcel B1=("Cutoff_Value")
putexcel C1=("Lower_Bound_CI")
putexcel D1=("Upper_Bound_CI")
forval i = 2000(500)30000{
	reg dmedval fire_2015_`i' $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
	scalar b`i'= _b[fire_2015_`i']
	scalar lb_cons`i' = _b[fire_2015_`i'] - invttail(e(df_r),0.025)*_se[fire_2015_`i']
	scalar ub_cons`i' = _b[fire_2015_`i'] + invttail(e(df_r),0.025)*_se[fire_2015_`i']
	display b`i'
	putexcel A`xlsrow' = (b`i')
	putexcel B`xlsrow' = (`i')
	putexcel C`xlsrow' = (lb_cons`i')
	putexcel D`xlsrow' = (ub_cons`i')
	local xlsrow = `xlsrow'+1
	}
	
local xlsrow = 2
putexcel set betaresult_2015_ln, replace sheet("Betas1")
putexcel A1=("Betas")
putexcel B1=("Cutoff_Value")
putexcel C1=("Lower_Bound_CI")
putexcel D1=("Upper_Bound_CI")
forval i = 2000(500)30000{
	reg dlnmedval fire_2015_`i' $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
	scalar b`i'= _b[fire_2015_`i']
	scalar lb_cons`i' = _b[fire_2015_`i'] - invttail(e(df_r),0.025)*_se[fire_2015_`i']
	scalar ub_cons`i' = _b[fire_2015_`i'] + invttail(e(df_r),0.025)*_se[fire_2015_`i']
	display b`i'
	putexcel A`xlsrow' = (b`i')
	putexcel B`xlsrow' = (`i')
	putexcel C`xlsrow' = (lb_cons`i')
	putexcel D`xlsrow' = (ub_cons`i')
	local xlsrow = `xlsrow'+1
	}
	
***The effect doesn't leave the CI for the 4km bound will see what happens when I extend the bounds up to 100 km 

forval i = 2000(500)100000{
	generate fire100_2015_`i' = 0
	replace fire100_2015_`i' = 1 if (min_dist_2005_sim <= `i' | min_dist_2006_sim <= `i' | min_dist_2007_sim <= `i' | min_dist_2008_sim <= `i' | min_dist_2009_sim <= `i' | min_dist_2010_sim <= `i' | min_dist_2011_sim <= `i' | min_dist_2012_sim <=`i' | min_dist_2013_sim <= `i' | min_dist_2014_sim <= `i') & (min_dist_2015_sim <= `i')
	replace fire100_2015_`i' = 1 if min_dist_2015_sim <= `i'
}

local xlsrow = 2
putexcel set betaresult100_2015, replace sheet("Betas1")
putexcel A1=("Betas")
putexcel B1=("Cutoff_Value")
putexcel C1=("Lower_Bound_CI")
putexcel D1=("Upper_Bound_CI")
forval i = 2000(500)100000{
	reg dmedval fire100_2015_`i' $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
	scalar b`i'= _b[fire100_2015_`i']
	scalar lb_cons`i' = _b[fire100_2015_`i'] - invttail(e(df_r),0.025)*_se[fire100_2015_`i']
	scalar ub_cons`i' = _b[fire100_2015_`i'] + invttail(e(df_r),0.025)*_se[fire100_2015_`i']
	display b`i'
	putexcel A`xlsrow' = (b`i')
	putexcel B`xlsrow' = (`i')
	putexcel C`xlsrow' = (lb_cons`i')
	putexcel D`xlsrow' = (ub_cons`i')
	local xlsrow = `xlsrow'+1
	}
	
local xlsrow = 2
putexcel set betaresult100_2015_ln, replace sheet("Betas1")
putexcel A1=("Betas")
putexcel B1=("Cutoff_Value")
putexcel C1=("Lower_Bound_CI")
putexcel D1=("Upper_Bound_CI")
forval i = 2000(500)100000{
	reg dlnmedval fire100_2015_`i' $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
	scalar b`i'= _b[fire100_2015_`i']
	scalar lb_cons`i' = _b[fire100_2015_`i'] - invttail(e(df_r),0.025)*_se[fire100_2015_`i']
	scalar ub_cons`i' = _b[fire100_2015_`i'] + invttail(e(df_r),0.025)*_se[fire100_2015_`i']
	display b`i'
	putexcel A`xlsrow' = (b`i')
	putexcel B`xlsrow' = (`i')
	putexcel C`xlsrow' = (lb_cons`i')
	putexcel D`xlsrow' = (ub_cons`i')
	local xlsrow = `xlsrow'+1
	}
	
	
***Run regresssions on dummy categories within 4km and 4km-20km
***Dummy for within 4-20km for 2015 and years before. 1,1 and 0,1. 
generate fire_2015_4_20km = 0
replace fire_2015_4_20km = 1 if (treated_2005_sim4 == 1 | treated_2006_sim4 == 1 | treated_2007_sim4 == 1 | treated_2008_sim4 == 1 | treated_2009_sim4 == 1 | treated_2010_sim4 == 1 | treated_2011_sim4 == 1 | treated_2012_sim4 == 1 | treated_2013_sim4 == 1 | treated_2014_sim4 == 1) & (treated_2015_sim4 == 1)
replace fire_2015_4_20km = 1 if treated_2015_sim4 == 1 

**eststo: reg dmedval fire_2015 fire_2015_4_20km $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)


**eststo: reg dlnmedval fire_2015 fire_2015_4_20km $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

esttab using regresssions_olsfirstdiff.tex, label title("OLS & First Difference Regression For Within 4 km of 2015 Wildfire Perimeter") scalars(r2) keep(fire_2015) replace

eststo clear


***excluded category is greater than 20km

***Question: Do I include the time fixed effect in the first difference regression?

***Make a Pre-Trend Graph***

// collapse (mean) medval, by(fire_2015 time)
// separate medval, by(fire_2015)
// graph twoway line medval0 medval1 time, sort

***Quick Robustnesss Checks***

***Control for block groups which have wildfires in the pre-periods 2005-2009 and 2010-2014
***Control for block groups only with fire in pre-period. 

gen fire_pre_2015_4km = 0 
replace fire_pre_2015_4km = 1 if (treated_2005_sim == 1 | treated_2006_sim == 1 | treated_2007_sim == 1 | treated_2008_sim == 1 | treated_2009_sim == 1 | treated_2010_sim == 1 | treated_2011_sim == 1 | treated_2012_sim == 1 | treated_2013_sim == 1 | treated_2014_sim == 1) & (treated_2015_sim == 0)
**block groups which had fires within 4km in the pre-period and no fire within 4 km in the after period.

count if fire_pre_2015_4km == 1
***11,871 observations treated in pre - not treated post

gen fire_pre_2015_4_20km = 0
replace fire_pre_2015_4_20km = 1 if (treated_2005_sim4 == 1 | treated_2006_sim4 == 1 | treated_2007_sim4 == 1 | treated_2008_sim4 == 1 | treated_2009_sim4 == 1 | treated_2010_sim4 == 1 | treated_2011_sim4 == 1 | treated_2012_sim4 == 1 | treated_2013_sim4 == 1 | treated_2014_sim4 == 1) & (treated_2015_sim4 == 0)
**block groups which had fires between 4km  and 20km in the pre-period and no fire between 4km and 20km in the after period.

count if fire_pre_2015_4_20km == 1
***61,702 treated in pre 4 to 20km not treated in post 4 to 20km 

gen only_treat_2015 = 0
replace only_treat_2015 = 1 if (treated_2005_sim == 0 | treated_2006_sim == 0 | treated_2007_sim == 0 | treated_2008_sim == 0 | treated_2009_sim == 0 | treated_2010_sim == 0 | treated_2011_sim == 0 | treated_2012_sim == 0 | treated_2013_sim == 0 | treated_2014_sim == 0) & (treated_2015_sim == 1)

gen only_treat_2015_4_20km = 0
replace only_treat_2015_4_20km = 1 if (treated_2005_sim4 == 0 | treated_2006_sim4 == 0 | treated_2007_sim4 == 0 | treated_2008_sim4 == 0 | treated_2009_sim4 == 0 | treated_2010_sim4 == 0 | treated_2011_sim4 == 0 | treated_2012_sim4 == 0 | treated_2013_sim4 == 0 | treated_2014_sim4 == 0) & (treated_2015_sim4 == 1)


count if only_treat_2015 == 1
**481 observations, not treated in pre but treated in 2015.

count if only_treat_2015_4_20km == 1
**9,742 obs, not treated within 4 and 20km in pre and treated within 4 to 20km in post. 

eststo clear

***eststo: reg medval only_treat_2015 fire_pre_2015_4km $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)
*Not significant

***eststo: reg medval only_treat_2015 only_treat_2015_4_20km fire_pre_2015_4km fire_pre_2015_4_20km $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)
*Not significant

***eststo: reg dmedval only_treat_2015 fire_pre_2015_4km $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***eststo: reg dmedval only_treat_2015 only_treat_2015_4_20km fire_pre_2015_4km fire_pre_2015_4_20km $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***FD results appear to be robust controlling for block groups which had any fire in the pre period and No fire in 2015. 

***Check how many only post treatment
gen treat_exclusive_2015 = 0 
replace treat_exclusive_2015 = 1 if (treated_2005_sim == 0 & treated_2006_sim == 0 & treated_2007_sim == 0 & treated_2008_sim == 0 & treated_2009_sim == 0 & treated_2010_sim == 0 & treated_2011_sim == 0 & treated_2012_sim == 0 & treated_2013_sim == 0 & treated_2014_sim == 0) & (treated_2015_sim == 1)

count if treat_exclusive_2015 == 1
***281 obs treat_exclusive_2015 ---- Very small fraction of data 
***REG (-) - TABLE 2***
**eststo: reg medval treat_exclusive_2015 $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)

***REG(1) - TABLE 2***

eststo: reg dmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***REG (2) - TABLE 2***

eststo: reg dlnmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***Limit Analysis to Inner and Outer Ring***

***REG (3) - TABLE 2***
eststo: reg dmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <=20000, vce(cluster gisjoin)

***REG (4) - TABLE 2***
eststo: reg dlnmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <=20000, vce(cluster gisjoin)

***Generate Fire Controls***

forval i = 5(1)9{
    gen fire_200`i' = 0
	replace fire_200`i' = 1 if min_dist_200`i'_sim <= 4000
}

forval i = 10(1)14{
    gen fire_20`i' = 0
	replace fire_20`i' = 1 if min_dist_20`i'_sim <= 4000
}

global fire_pre fire_2005 fire_2006 fire_2007 fire_2008 fire_2009 fire_2010 fire_2011 fire_2012 fire_2013 fire_2014

***REG (5) - TABLE 2***
eststo: reg dmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag $fire_pre i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)

***REG (6) - TABLE 2 ***
eststo: reg dlnmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag $fire_pre i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)

***REG (7) - TABLE 2- exclude observations with fire in previous period***

// eststo: reg dmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag $fire_pre i.time if (min_dist_2015_sim <= 20000 & min_dist_2005_sim > 4000 & min_dist_2006_sim > 4000 & min_dist_2007_sim > 4000 & min_dist_2008_sim > 4000 & min_dist_2009_sim > 4000 & min_dist_2010_sim > 4000 & min_dist_2011_sim > 4000 & min_dist_2012_sim > 4000 & min_dist_2013_sim > 4000 & min_dist_2014_sim > 4000), vce(cluster gisjoin)

esttab using regresssions_robustness.tex, label title("First Difference Robustness Regressions") scalars(r2) keep(treat_exclusive_2015) replace


generate treat_exclusive_count = 0
replace treat_exclusive_count = 1 if (time == 2 & treat_exclusive_2015 == 1)

count if treat_exclusive_count == 1 
***Only 89 seperate block groups which are treated within 4km from 2015 wildfire. 

gen treat_exclusive_2015_4 = 0 
replace treat_exclusive_2015_4 = 1 if (treated_2005_sim4 == 0 & treated_2006_sim4 == 0 & treated_2007_sim4 == 0 & treated_2008_sim4 == 0 & treated_2009_sim4 == 0 & treated_2010_sim4 == 0 & treated_2011_sim4 == 0 & treated_2012_sim4 == 0 & treated_2013_sim4 == 0 & treated_2014_sim4 == 0) & (treated_2015_sim4 == 1)

count if treat_exclusive_2015_4 == 1

gen treat_exclusive4 = 0
replace treat_exclusive4 = 1 if (time == 2 & treat_exclusive_2015_4 == 1)

count if treat_exclusive4 == 1
***229 block groups treated in 2015 (real) between 4km and 20km 

eststo clear

gen min_dist_2005_km = min_dist_2005_sim/1000
gen min_dist_2006_km = min_dist_2006_sim/1000
gen min_dist_2007_km = min_dist_2007_sim/1000
gen min_dist_2008_km = min_dist_2008_sim/1000
gen min_dist_2009_km = min_dist_2009_sim/1000
gen min_dist_2010_km = min_dist_2010_sim/1000
gen min_dist_2011_km = min_dist_2011_sim/1000
gen min_dist_2012_km = min_dist_2012_sim/1000
gen min_dist_2013_km = min_dist_2013_sim/1000
gen min_dist_2014_km = min_dist_2014_sim/1000
gen min_dist_2015_km = min_dist_2015_sim/1000
gen min_dist_2016_km = min_dist_2016_sim/1000
gen min_dist_2017_km = min_dist_2017_sim/1000
gen min_dist_2018_km = min_dist_2018_sim/1000
gen average_mind_wildfire_sim_km = average_mind_wildfire_sim/1000

***SUM STATISTICS TABLE***

label variable built_1 "Proportion Built 2000 or later"
label variable built_2 "Proportion Built 1990 to 1999"
label variable built_3 "Proportion Built 1980 to 1989"
label variable built_4 "Proportion Built 1970 to 1979"
label variable built_5 "Proportion Built 1960 to 1969"
label variable built_6 "Proportion Built 1950 to 1959"
label variable built_7 "Proportion Built 1940 to 1949"
label variable built_8 "Proportion Built 1939 or earlier"

label variable bdrm_1 "Proportion 1 bedroom"
label variable bdrm_2 "Proportion 2 bedrooms"
label variable bdrm_3 "Proportion 3 bedrooms"
label variable bdrm_4 "Proportion 4 bedrooms"
label variable bdrm_5 "Proportion 5 bedrooms"

label variable mortag_1 "Proportion Housing With a Mortgage"
label variable mortag_5 "Proportion Housing With No Mortgage"

label variable medval "Median Property Value"
label variable lnmedval "Natural Log Median Property Value"
label variable dmedval "Difference in Median Property Value"
label variable dlnmedval "Natural Log Difference in Median Property Value"

label variable average_mind_wildfire_sim_km "Average Minimum Distance to a Wildfire Perimeter"

format medval %8.0f

estpost summarize medval lnmedval dmedval dlnmedval average_mind_wildfire_sim_km built_1 $built $bdrm mortag_1 mortag_5

esttab, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean) fmt(2)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) label title(Summary Statistics Property Value and Block Group Housing Characteristics) nonumber

esttab using tablesummstat_new.tex, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean) fmt(2)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) label title(Summary Statistics) nonumber replace

eststo clear





