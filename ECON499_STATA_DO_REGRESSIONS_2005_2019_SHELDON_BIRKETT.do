****2005-2019 REGRESSIONS BY SHELDON BIRKETT***

clear 

**import delimited "C:\Users\sheld\Documents\Thesis_Data_Full_United_States\merged_data_with_block_groups\ACS5_2005_2019_FULL_DATAFRAME_FOR_ANALYSIS_no_geo.csv"

***This one has the 2020 Wildfire Hazard Potential Index***

import delimited "C:\Users\sheld\Documents\Thesis_Data_Full_United_States\merged_data_with_block_groups\ACS5_2005_2019_FULL_DATAFRAME_FOR_ANALYSIS_no_geo_WHP.csv"

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

***LABLE VARIABLES****

tokenize `""White alone" "Black or African American alone" "American Indian and Alaska Native alone" "Asian alone" "Native Hawaiian and Other Pacific Islander alone" "Some other race alone" "Two or more races""'

forvalues i=1/7{
	label variable race_`i' "``i''"
	display race_`i'
}

label variable race_0 "Total Race"

tokenize `""Less than 5 minutes" "5 to 9 minutes" "10 to 14 minutes" "15 to 19 minutes" "20 to 24 minutes" "25 to 29 minutes" "30 to 34 minutes" "35 to 39 minutes" "40 to 44 minutes" "45 to 59 minutes" "60 to 89 minutes" "90 or more minutes""'

forvalues i=1/12{
    label variable travel_`i' "``i''"
}

label variable travel_0 "Total Travel Time to Work"

tokenize `""No schooling completed" "Nursery to 4th grade" "5th and 6th grade" "7th and 8th grade" "9th grade" "10th grade" "11th grade" "12th grade no diploma" "High school graduate, GED, or alternative" "Some college less than 1 year" "Some college 1 or more years no degree" "Associates degree" "Bachelors degree" "Masters degree" "Professional school degree" "Doctorate degree""'

forvalues i=1/16{
    label variable educ_`i' "``i''"
}

label variable educ_0 "Total Educational Attainment for the Population 25 Years and Over"

tokenize `""Built 2000 or later" "Built 1990 to 1999" "Built 1980 to 1989" "Built 1970 to 1979" "Built 1960 to 1969" "Built 1950 to 1959" "Built 1940 to 1949" "Built 1939 or earlier""'

forvalues i=1/8{
    label variable built_`i' "``i''"
}

label variable built_0 "Total Year Structure Built"

tokenize `""1 bedroom" "2 bedrooms" "3 bedrooms" "4 bedrooms" "5 or more bedrooms""'

forvalues i=1/5{
    label variable bdrm_`i' "``i''"
}

label variable bdrm_0 "Total Bedrooms"

tokenize `""Housing units with a mortgage contract to purchase or similar debt" "Housing units with a mortgage contract to purchase or similar debt With either a second mortgage or home equity loan but not both" "Housing units with a mortgage contract to purchase or similar debt Both second mortgage and home equity loan" "Housing units with a mortgage contract to purchase or similar debt No second mortgage and no home equity loan" "Housing units without a mortgage""'

forvalues i=1/5{
    label variable mortag_`i' "``i''"
}

label variable mortag_0 "Total Mortgage Status"

label variable rent "Median gross rent"
label variable lowval "Lower value quartile (dollars)"
label variable medval "Median Value"
label variable upval "Upper value quartile (dollars)"

****GENERATE DUMMY VARIABLES FOR MIN DISTANCE TO WILDFIRE VARIABLES - This is the cuttoff for treatment/control. I will be usings 4 km cuttoff ~ In literature 3.22km (3220m) (as specified by Loomis 2004)****

****Generate Dummy Variables for Each Year and Time Frame***
***For Example, if dummy treated_2005 is 1 if within 4km from wildfire and the block group is in the 2005-2009 period***

***Note: I made dummy variables non overlapping below for regression, in the cross tabs tables for summary stats take off (year == "xxxx-xxxxx") for overlapping tabulations****

***WITHIN 4KM FOR EACH YEAR***

forval i=5(1)9{
    generate treated_200`i'_sim = 0
	replace treated_200`i'_sim = 1 if (min_dist_200`i'_sim <= 4000) & (year == "2005-2009")
}

forval i=10(1)14{
    generate treated_20`i'_sim = 0
	replace treated_20`i'_sim = 1 if (min_dist_20`i'_sim <= 4000) & (year == "2010-2014")
}

forval i=15(1)18{
	generate treated_20`i'_sim = 0
	replace treated_20`i'_sim = 1 if (min_dist_20`i'_sim <= 4000) & (year == "2015-2019")
}

***BETWEEN 4KM AND 20KM FOR EACH YEAR***

forval i=5(1)9{
	generate treated_200`i'_sim4 = 0
	replace treated_200`i'_sim4 = 1 if (min_dist_200`i'_sim > 4000) & (min_dist_200`i'_sim <= 20000) & (year == "2005-2009")
}

forval i=10(1)14{
	generate treated_20`i'_sim4 = 0
	replace treated_20`i'_sim4 = 1 if (min_dist_20`i'_sim > 4000) & (min_dist_20`i'_sim <= 20000) & (year == "2010-2014")
}

forval i=15(1)18{
	generate treated_20`i'_sim4 = 0
	replace treated_20`i'_sim4 = 1 if (min_dist_20`i'_sim > 4000) & (min_dist_20`i'_sim <= 20000) & (year == "2015-2019")
}

***OVER 20KM FOR EACH YEAR (FOR SUMM STATS)***

forval i=5(1)9{
	generate treated_200`i'_sim20 = 0
	replace treated_200`i'_sim20 = 1 if (min_dist_200`i'_sim > 20000) & (year == "2005-2009")
}

forval i=10(1)14{
	generate treated_20`i'_sim20 = 0
	replace treated_20`i'_sim20 = 1 if (min_dist_20`i'_sim > 20000) & (year == "2010-2014")
}

forval i=15(1)18{
	generate treated_20`i'_sim20 = 0
	replace treated_20`i'_sim20 = 1 if (min_dist_20`i'_sim > 20000) & (year == "2015-2019")
}

***FIRE DUMMIES BY PERIOD***

***fire_4km_2005 is for fire within 4km in the 2005-2009 period ---> pre period control***

generate fire_4km_2005 = 0

forval i=5(1)9{
	replace fire_4km_2005 = 1 if treated_200`i'_sim == 1 
}

***fire_4km_2010 is for fire within 4km in the 2010-2014 period ---> pre period control***

generate fire_4km_2010 = 0

forval i=10(1)14{
	replace fire_4km_2010 = 1 if treated_20`i'_sim == 1
}

***fire_4km_2015 is for fire within 4km in 2015-2019 period (includes within 4km from a wildfire perimeter between 2015 and 2016-2018)***

generate fire_4km_2015 = 0

forval i=15(1)18{
	replace fire_4km_2015 = 1 if treated_20`i'_sim == 1
}

***REMEMBER: treated_2015_sim is the treatment I am interested in, which is within 4km from a wildfire perimeter in 2015 only***


***fire_4_20km_2005 is for fire between 4km and 20km in the 2005-2009 period ---> pre period control****

generate fire_4_20km_2005 = 0

forval i=5(1)9{
	replace fire_4_20km_2005 = 1 if treated_200`i'_sim4 == 1 
}

***fire_4_20km_2010 is for fire between 4km and 20km in the 2010-2014 period ---> pre period control****

generate fire_4_20km_2010 = 0

forval i=10(1)14{
	replace fire_4_20km_2010 = 1 if treated_20`i'_sim4 == 1
}

***fire_4_20km_2015 is for fire between 4km and 20km in the 2015-2019 period (includes between 4km and 20km from a wildfire in 2015 and 2016-2018)

generate fire_4_20km_2015 = 0

forval i=15(1)18{
	replace fire_4_20km_2015 = 1 if treated_20`i'_sim4 == 1
}

****REMEMBER: treated_2015_sim4 is the 4km-20km treatment I am interested in, which is between 4km-20km from a wildfire perimeter in 2015 only***

***fire_20km_xxxx variables below are primarily for summary statistics***

***fire_20km_2005 is dummy for block group beyond 20km from wildfire perimeter in 2005-2009 period***

generate fire_20km_2005 = 0

forval i = 5(1)9{
	replace fire_20km_2005 = 1 if treated_200`i'_sim20 == 1
}

***fire_20km_2010 is dummy for block group beyond 20km from wildfire perimeter in 2010-2014 period***

generate fire_20km_2010 = 0

forval i=10(1)14{
	replace fire_20km_2010 = 1 if treated_20`i'_sim20 == 1
}

***fire_20km_2015 is dummy for block group beyond 20km from wildfire perimeter in 2015-2019 period***

generate fire_20km_2015 = 0

forval i=15(1)18{
	replace fire_20km_2015 = 1 if treated_20`i'_sim20 == 1
}

***Generate Time Dummy***

generate time = 0
replace time = 2 if year == "2015-2019"
replace time = 1 if year == "2010-2014"

**********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

****DESCRIPTIVE STATISTICS****

***post_fire is dummy for within 4km from a wildfire perimeter across all periods***

gen post_fire = 0
replace post_fire = 1 if treated_2005_sim == 1 | treated_2006_sim == 1 | treated_2007_sim == 1 | treated_2008_sim == 1 | treated_2009_sim == 1 | treated_2010_sim == 1 | treated_2011_sim == 1 | treated_2012_sim == 1 | treated_2013_sim == 1 | treated_2014_sim == 1 | treated_2015_sim == 1 | treated_2016_sim == 1 | treated_2017_sim == 1 | treated_2018_sim == 1

rename median median_whp

label variable median_whp "Median WHP 2020"

label variable post_fire "Block Group Close to Wildfire"

***descriptive statistics comparing average median price of homes within and not within 4km from wildfire perimeter for each period***

estpost tabstat medval median_whp lowval upval if time == 0, statistics(mean median) by(post_fire)

esttab, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2005-2009") eqlabels(, lhs("Within 4 km")) 

esttab using comparison_table_2005_new.tex, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2005-2009") eqlabels(, lhs("Within 4 km")) replace

eststo clear

estpost tabstat median_whp medval if time == 0, statistics(mean median) by(post_fire)

esttab, varwidth(20) cell(median_whp) unstack nonumber collabels(none) title("Comparison of WHP Within 4 km Distance from Wildfire Perimeter 2005-2009") eqlabels(, lhs("Within 4 km"))

esttab using median_whp_comp2009.tex, varwidth(20) cell(median_whp) unstack nonumber collabels(none) title("Comparison of WHP Within 4 km Distance from Wildfire Perimeter 2005-2009") eqlabels(, lhs("Within 4 km")) replace

eststo clear 

estpost tabstat medval median_whp lowval upval if time == 1, statistics(mean median) by(post_fire)

esttab, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2010-2014") eqlabels(, lhs("Within 4 km"))

esttab using comparison_table_2010_new.tex, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2010-2014") eqlabels(, lhs("Within 4 km")) replace

eststo clear 

estpost tabstat median_whp medval if time == 1, statistics(mean median) by(post_fire)

esttab, varwidth(20) cell(median_whp) unstack nonumber collabels(none) title("Comparison of WHP Within 4 km Distance from Wildfire Perimeter 2010-2014") eqlabels(, lhs("Within 4 km"))

esttab using median_whp_comp2014.tex, varwidth(20) cell(median_whp) unstack nonumber collabels(none) title("Comparison of WHP Within 4 km Distance from Wildfire Perimeter 2010-2014") eqlabels(, lhs("Within 4 km")) replace

eststo clear 

estpost tabstat medval median_whp lowval upval if time == 2, statistics(mean median) by(post_fire)

esttab, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2015-2019") eqlabels(, lhs("Within 4 km"))

esttab using comparison_table_2015_new.tex, varwidth(20) cell(medval) unstack nonumber collabels(none) title("Comparison of Median Property Values Within 4 km Distance from Wildfire Perimeter 2015-2019") eqlabels(, lhs("Within 4 km")) replace

eststo clear 

eststo clear 

estpost tabstat median_whp medval if time == 2, statistics(mean median) by(post_fire)

esttab, varwidth(20) cell(median_whp) unstack nonumber collabels(none) title("Comparison of WHP Within 4 km Distance from Wildfire Perimeter 2015-2019") eqlabels(, lhs("Within 4 km"))

esttab using median_whp_comp2019.tex, varwidth(20) cell(median_whp) unstack nonumber collabels(none) title("Comparison of WHP Within 4 km Distance from Wildfire Perimeter 2015-2019") eqlabels(, lhs("Within 4 km")) replace

eststo clear 

egen average_mind_wildfire_sim = rowmean(min_dist_2005_sim min_dist_2006_sim min_dist_2007_sim min_dist_2008_sim min_dist_2009_sim min_dist_2010_sim min_dist_2011_sim min_dist_2012_sim min_dist_2013_sim min_dist_2014_sim min_dist_2015_sim min_dist_2016_sim min_dist_2017_sim min_dist_2018_sim)

label variable average_mind_wildfire_sim "Average Min Distance to a Wildfire (2005-2018)"

estpost summarize medval lowval upval average_mind_wildfire_sim

esttab, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) label title(Table 1. Summary Statistics: Property Value and Average Wildfire Distance) nonumber

esttab using tablesummstat_new.tex, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) label title(Table 1. Summary Statistics) nonumber replace

eststo clear 

***table below is just the reformated version of the sum stats table above, comparing average median property values within and not within 4km from a wildfire perimeter***

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

eststo clear

***Categories of Distances and Years - Number of Observations***

estpost sum fire_4km_2005 fire_4_20km_2005 fire_20km_2005 fire_4km_2010 fire_4_20km_2010 fire_20km_2010 fire_4km_2015 fire_4_20km_2015 fire_20km_2015

esttab, varwidth(20) modelwidth(10 20 10 10) cell((sum(label(Count)))) label title("Wildfires by Years and Distance" ) nonumber

esttab using distance_category.tex, varwidth(20) modelwidth(10 20 10 10) cell((sum(label(Count)))) label title("Wildfires by Years and Distance" ) nonumber replace

eststo clear

****Generated Non-Overlapping Category Tabulations for Number of Block Groups within 4km, 4km-20km, and beyond 20km****
****For Over Lapping re-generate treated variables 'treated_xxxx_simxx' within year condition '& year == 'xxxx-xxxx'' when intially defining categories above, I made them non-overlapping for the regression analysis****

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

**********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

***REGRESSIONS****

***Define global variables****

global race race_2 race_3 race_4 race_5 race_6 race_7 
global travel travel_2 travel_3 travel_4 travel_5 travel_6 travel_7 travel_8 travel_9 travel_10 travel_11 travel_12
global educ educ_2 educ_3 educ_4 educ_5 educ_6 educ_7 educ_8 educ_9 educ_10 educ_11 educ_12 educ_13 educ_14 educ_15 educ_16
global built built_2 built_3 built_4 built_5 built_6 built_7 built_8
global bdrm bdrm_1 bdrm_2 bdrm_3 bdrm_4 bdrm_5
global mortag mortag_3 mortag_4 mortag_5

***mortag_2 mortag_3 mortag_4 are sub categories of mortag_1
***took out race 1, travel_1, educ_1, built_1, nobedroom, mortag_2 are the base categories


****fire_2015 treatment is for within 4km from a wildfire perimeter in either both periods & only in 2015.****

generate fire_2015 = 0 
replace fire_2015 = 1 if (treated_2005_sim == 1 | treated_2006_sim == 1 | treated_2007_sim == 1 | treated_2008_sim == 1 | treated_2009_sim == 1 | treated_2010_sim == 1 | treated_2011_sim == 1 | treated_2012_sim == 1 | treated_2013_sim == 1 | treated_2014_sim == 1) & (treated_2015_sim == 1)
replace fire_2015 = 1 if treated_2015_sim == 1

***Fire dummy within 4km for having experienced a fire in both periods or having experienced a fire only in 2015***

**reg medval fire_2015

// reg medval fire_2015 $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)
//
// reg medval fire_2015 $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(cluster gisjoin)


eststo clear

***REG (1) -TABLE 1***
eststo: quietly reg medval fire_2015 $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)

***reg medval fire_2015 $race $travel $educ $built $bdrm $mortag i.statea if time == 0, vce(robust)

***reg medval fire_2015 $race $travel $educ $built $bdrm $mortag i.statea if time == 1, vce(robust)

***reg medval fire_2015 $race $travel $educ $built $bdrm $mortag i.statea if time == 2, vce(robust)

***Crosssectional regresssions by period are not significant/collinear***

***SETUP FOR FIRST DIFFERENCE REGRESSIONS***

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

by gisjoin: gen dmortag_1 = mortag_1-mortag_1[_n-1]

global drace drace_2 drace_3 drace_4 drace_5 drace_6 drace_7
global dtravel dtravel_2 dtravel_3 dtravel_4 dtravel_5 dtravel_6 dtravel_7 dtravel_8 dtravel_9 dtravel_10 dtravel_11 dtravel_12
global deduc deduc_2 deduc_3 deduc_4 deduc_5 deduc_6 deduc_7 deduc_8 deduc_9 deduc_10 deduc_11 deduc_12 deduc_13 deduc_14 deduc_15 deduc_16
global dbuilt dbuilt_2 dbuilt_3 dbuilt_4 dbuilt_5 dbuilt_6 dbuilt_7 dbuilt_8
global dbdrm dbdrm_1 dbdrm_2 dbdrm_3 dbdrm_4 dbdrm_5
global dmortag dmortag_3 dmortag_4 dmortag_5

***took out drace_1, dtravel_1, deduc_1, dbuilt_1, dnobedroom, dmortag_2 are the base categories

***reg dmedval fire_2015

***Regress x on the change in y shows a clear decrease by being close to a 2015 wildfire. This can suggest that after a wildfire your median property value decreases for homes close to a wildfire (not unexplained fixed effects are cancelled out in the difference so it controls for a lot of factors not captured in the no change in y regression)
***in comparison to the regression x on y the median property value is higher for homes close to a wildfire becuase there is no way of cancelling out unexplained fixed effects (amenity values, such as water, forests etc.) 

***REG (2)-TABLE 1***
eststo: quietly reg dmedval fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

gen lnmedval = log(medval)

by gisjoin: gen dlnmedval = lnmedval - lnmedval[_n-1]


***REG (3)-TABLE 1***
eststo: quietly reg dlnmedval fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)


***REG (4)-TABLE 1***limit to block groups within 20km from wildfire***

eststo: quietly reg dmedval fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)

***REG (5)-TABLE 1***

eststo: quietly reg dlnmedval fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)

label variable fire_2015 "4km 2015 Ring"

label variable medval "Median Value"

label variable dmedval "D Median Value"

label variable dlnmedval "D ln(Median Value)"

esttab, label modelwidth(20) addnotes("Model (1) use state and time fixed effects, and robust standard errors." "Models (2)-(5) use time fixed effects and standard errors are clustered on block groups." "Models (4) and (5) exclude block groups greater than 20km from a wildfire perimeter." "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("Within 4km from a 2015 Wildfire Perimeter on Block Group Median Property Values") scalars(r2) keep(fire_2015)

esttab using regresssions_thesis_table1.tex, label modelwidth(20) addnotes("Model (1) use state and time fixed effects, and robust standard errors." "Models (2)-(5) use time fixed effects and standard errors are clustered on block groups." "Models (4) and (5) exclude block groups greater than 20km from a wildfire perimeter." "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("Within 4km from a 2015 Wildfire Perimeter on Block Group Median Property Values") scalars(r2) keep(fire_2015) replace

eststo clear 

***GRAPHS OF MAIN ANALYSIS: PLOTTING COEFFICIENT ON fire_2015 AGAINST DIFFERENT CUTOFF VALUES***
***SAVED OUTPUT IN EXCELL THEN USED PYTHON TO PLOT***

***2KM TO 30KM***

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
	
***2KM TO 100KM***
	
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

	
****ROBUSTNESS SECTION****
**********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

***A) Regression on only treated in 2015 within 4km, and 4km-20km controlling for previous wildfires

***i) OLS Regressions on 4km and 4km-20km

***fire_4km_2005 is for fire within 4km in the 2005-2009 period ---> pre period control***

***fire_4km_2010 is for fire within 4km in the 2010-2014 period ---> pre period control***

***treated_2015_sim dummy for within 4km only in 2015 in period 2015-2019

***fire_4km_2005_2010 is a pre fire control variable, 1 if fire within 4km in 2005-2009 period or fire within 4km in 2010-2014 period

eststo clear

***REG (1) - Table 2 - Baseline ols with no pre-fire controls on treated_2015_sim only (i.e. treated in 2015 and last period 2015-2019)***

eststo: quietly reg medval treated_2015_sim $race $travel $educ $built $bdrm $mortag i.time i.statea, robust

***REG (2) - Table 2 - Baseline ols with pre-fire controls 2005-2010 years within 4km on treated_2015_sim only 

eststo: quietly reg medval treated_2015_sim fire_4km_2005 fire_4km_2010 $race $travel $educ $built $bdrm $mortag i.time i.statea, robust

***fire_4_20km_2005 is for fire between 4km and 20km in the 2005-2009 period ---> pre period control****
***fire_4_20km_2010 is for fire between 4km and 20km in the 2010-2014 period ---> pre period control****
***Now with 4km-20km ring and pre period controls for those rings***
***treated_2015_sim4 is dummy for within 4-20km only in 2015 in period 2015-2019***

***REG (3) - Table 2 - Baseline ols with no pre-fire controls on treated_2015_sim treated_2015_sim4 only***

eststo: quietly reg medval treated_2015_sim treated_2015_sim4 $race $travel $educ $built $bdrm $mortag i.time i.statea, robust

***REG (4) - Table 2 - Baseline ols with pre-fire controls on treated_2015_sim treated_2015_sim4 only***

eststo: quietly reg medval treated_2015_sim treated_2015_sim4 fire_4km_2005 fire_4km_2010 fire_4_20km_2005 fire_4_20km_2010 $race $travel $educ $built $bdrm $mortag i.time i.statea, robust

***Now significant in the 4km-20km ring for 2015 treatment only for simple OLS***

label variable treated_2015_sim "4km 2015 \& 2015-2019"

label variable treated_2015_sim4 "4km-20km 2015 \& 2015-2019"

label variable fire_4km_2005 "Pre-Fire 4km 2005-2009"

label variable fire_4km_2010 "Pre-Fire 4km 2010-2014"

label variable fire_4_20km_2005 "Pre-Fire 4km-20km 2005-2009"

label variable fire_4_20km_2010 "Pre-Fire 4km-20km 2010-2014"

esttab, label varwidth(30) modelwidth(15) addnotes("Model (1),(2),(3),(4) use state and time fixed effects, and robust standard errors." "Models (2) and (4) include controls for wildfires that happened within 4km and 4km-20km in the 2005-2009 and 2010-2014 pre-periods." "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("OLS Within 4km and 4km-20km from a 2015 Wildfire Perimeter on Block Group Median Property Values") scalars(r2) keep(treated_2015_sim treated_2015_sim4 fire_4km_2005 fire_4km_2010 fire_4_20km_2005 fire_4_20km_2010)

esttab using regresssions_thesis_table2.tex, label varwidth(30) modelwidth(15) addnotes("Model (1),(2),(3),(4) use state and time fixed effects, and robust standard errors." "Models (2) and (4) include controls for wildfires that happened within 4km and 4km-20km in the 2005-2009 and 2010-2014 pre-periods." "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("OLS Within 4km and 4km-20km from a 2015 Wildfire Perimeter on Block Group Median Property Values") scalars(r2) keep(treated_2015_sim treated_2015_sim4 fire_4km_2005 fire_4km_2010 fire_4_20km_2005 fire_4_20km_2010) replace

******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

***STATA drop out fire_4km_2005 in first difference since they only occur in the 2005-2009 period***
***Not really capturing first period wildfires in this specification***

***ii) FD regressions on 4km and 4km-20km

eststo clear

***Generates fire_4km_2005_2010 dummy, which is a dummy for a home within 4km from a 2005-2009 fire and a 2010-2014 fire, I am creating this as the fire_4km_2005 dummy would otherwise drop out in the first difference regression***

generate fire_4km_2005_2010 = 0
replace fire_4km_2005_2010 = 1 if fire_4km_2005 == 1
***Puts Dummys in 2010-2014, and 2015-2019 years if Dummy in 2005-2009 is 1. Spreads 2005-2009 dummy across years in each panel***
bysort gisjoin (year): replace fire_4km_2005_2010 = fire_4km_2005_2010[1]
***Puts dummy for 2010-2014 for homes within 4km of wildfire in 2010-2014***
replace fire_4km_2005_2010 = 1 if fire_4km_2010 == 1
***Removes extra dummy in each panel which was created in the ealier command for the last year***
replace fire_4km_2005_2010 = 0 if year == "2015-2019"

***REG (1) - Table 3 - FD only on treated_2015_sim no pre-fire control

eststo: quietly reg dmedval treated_2015_sim $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***FD regression for within 4km controlling for all fires within 4km in the pre period***

***REG (2) -Table 3 - FD only on treated_2015_sim with pre-fire control fire_4km_2005_2010 for block groups which had fires within 4km in 2005-2009 or 2010-2014 period

eststo: quietly reg dmedval treated_2015_sim fire_4km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***Generate fire_4_20km_2005_2010 dummy, which is a dummy for a home within 4km-20km from a 2005-2009 fire and a 2010-2014 fire, creating this as fire_4_20km_2005 dummy would otherwise drop out in first difference regression***

generate fire_4_20km_2005_2010 = 0
replace fire_4_20km_2005_2010 = 1 if fire_4_20km_2005 == 1
bysort gisjoin (year): replace fire_4_20km_2005_2010 = fire_4_20km_2005_2010[1]
replace fire_4_20km_2005_2010 = 1 if fire_4_20km_2010 == 1
replace fire_4_20km_2005_2010 = 0 if year == "2015-2019"

***REG (3) - Table 3 - FD only on treated_2015_sim treated_2015_sim4 within 4km and within 4km-20km in 2015, no pre fire controls 

eststo: quietly reg dmedval treated_2015_sim treated_2015_sim4 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***FD regession for within 4km and 4km-20km controlling for all fires within 4km and 4km-20km in the pre period***

***REG (4) - Table 3 - FD only on treated_2015_sim treated_2015_sim4 within 4km and within 4km-20km in 2015, with pre fire controls 

eststo: quietly reg dmedval treated_2015_sim treated_2015_sim4 fire_4km_2005_2010 fire_4_20km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

label variable fire_4km_2005_2010 "Pre-Fire 4km 2005-2014"

label variable fire_4_20km_2005_2010 "Pre-Fire 4km-20km 2005-2014"

esttab, label varwidth(30) modelwidth(15) addnotes("Models (1)-(4) use time fixed effects, and standard errors clustered on block groups." "Models (2) and (4) include controls for wildfires that happened within 4km and 4km-20km in the 2005-2009 and 2010-2014 pre-periods." "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("First Difference Within 4km and 4km-20km from a 2015 Wildfire Perimeter on Block Group Median Property Values") scalars(r2) keep(treated_2015_sim treated_2015_sim4 fire_4km_2005_2010 fire_4_20km_2005_2010)

esttab using regression_thesis_table3.tex, label varwidth(30) modelwidth(15) addnotes("Models (1)-(4) use time fixed effects, and standard errors clustered on block groups." "Models (2) and (4) include controls for wildfires that happened within 4km and 4km-20km in the 2005-2009 and 2010-2014 pre-periods." "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("First Difference Within 4km and 4km-20km from a 2015 Wildfire Perimeter on Block Group Median Property Values") scalars(r2) keep(treated_2015_sim treated_2015_sim4 fire_4km_2005_2010 fire_4_20km_2005_2010) replace
 

***Make same table as regression_thesis_table3, but with dlnmedval as the dependent variable***

eststo clear 

eststo: quietly reg dlnmedval treated_2015_sim $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
eststo: quietly reg dlnmedval treated_2015_sim fire_4km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
eststo: quietly reg dlnmedval treated_2015_sim treated_2015_sim4 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
eststo: quietly reg dlnmedval treated_2015_sim treated_2015_sim4 fire_4km_2005_2010 fire_4_20km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

esttab, label varwidth(30) modelwidth(20) addnotes("Models (1)-(4) use time fixed effects, and standard errors clustered on block groups." "Models (2) and (4) include controls for wildfires that happened within 4km and 4km-20km in the 2005-2009 and 2010-2014 pre-periods." "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("First Difference Within 4km and 4km-20km from a 2015 Wildfire Perimeter on Block Group Median Property Values") scalars(r2) keep(treated_2015_sim treated_2015_sim4 fire_4km_2005_2010 fire_4_20km_2005_2010)

esttab using regression_thesis_table4.tex, label varwidth(30) modelwidth(20) addnotes("Models (1)-(4) use time fixed effects, and standard errors clustered on block groups." "Models (2) and (4) include controls for wildfires that happened within 4km and 4km-20km in the 2005-2009 and 2010-2014 pre-periods." "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("First Difference Within 4km and 4km-20km from a 2015 Wildfire Perimeter on Block Group Median Property Values") scalars(r2) keep(treated_2015_sim treated_2015_sim4 fire_4km_2005_2010 fire_4_20km_2005_2010) replace

eststo clear

******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

***B) Non-Overlapping Treatment Bands within 4km, 4-10km, 10km-15km, 15km-20km

***BETWEEN 4KM AND 10KM FOR EACH YEAR***

forval i=5(1)9{
	generate treated_200`i'_sim4_10 = 0
	replace treated_200`i'_sim4_10 = 1 if (min_dist_200`i'_sim > 4000) & (min_dist_200`i'_sim <= 10000) & (year == "2005-2009")
}

forval i=10(1)14{
	generate treated_20`i'_sim4_10 = 0
	replace treated_20`i'_sim4_10 = 1 if (min_dist_20`i'_sim > 4000) & (min_dist_20`i'_sim <= 10000) & (year == "2010-2014")
}

forval i=15(1)18{
	generate treated_20`i'_sim4_10 = 0
	replace treated_20`i'_sim4_10 = 1 if (min_dist_20`i'_sim > 4000) & (min_dist_20`i'_sim <= 10000) & (year == "2015-2019")
}

***BETWEEN 10KM AND 15KM FOR EACH YEAR***

forval i=5(1)9{
	generate treated_200`i'_sim10_15 = 0
	replace treated_200`i'_sim10_15 = 1 if (min_dist_200`i'_sim > 10000) & (min_dist_200`i'_sim <= 15000) & (year == "2005-2009")
}

forval i=10(1)14{
	generate treated_20`i'_sim10_15 = 0
	replace treated_20`i'_sim10_15 = 1 if (min_dist_20`i'_sim > 10000) & (min_dist_20`i'_sim <= 15000) & (year == "2010-2014")
}

forval i=15(1)18{
	generate treated_20`i'_sim10_15 = 0
	replace treated_20`i'_sim10_15 = 1 if (min_dist_20`i'_sim > 10000) & (min_dist_20`i'_sim <= 15000) & (year == "2015-2019")
}

***BETWEEN 15KM AND 20KM FOR EACH YEAR***

forval i=5(1)9{
	generate treated_200`i'_sim15_20 = 0
	replace treated_200`i'_sim15_20 = 1 if (min_dist_200`i'_sim > 15000) & (min_dist_200`i'_sim <= 20000) & (year == "2005-2009")
}

forval i=10(1)14{
	generate treated_20`i'_sim15_20 = 0
	replace treated_20`i'_sim15_20 = 1 if (min_dist_20`i'_sim > 15000) & (min_dist_20`i'_sim <= 20000) & (year == "2010-2014")
}

forval i=15(1)18{
	generate treated_20`i'_sim15_20 = 0
	replace treated_20`i'_sim15_20 = 1 if (min_dist_20`i'_sim > 15000) & (min_dist_20`i'_sim <= 20000) & (year == "2015-2019")
}


***FIRE DUMMY BY PERIOD***

***fire_4_10km_2005 is for fire between 4km and 10km in the 2005-2009 period ---> pre period control****

generate fire_4_10km_2005 = 0

forval i=5(1)9{
	replace fire_4_10km_2005 = 1 if treated_200`i'_sim4_10 == 1 
}

***fire_4_10km_2010 is for fire between 4km and 10km in the 2010-2014 period ---> pre period control****

generate fire_4_10km_2010 = 0

forval i=10(1)14{
	replace fire_4_10km_2010 = 1 if treated_20`i'_sim4_10 == 1
}

***fire_4_10km_2015 is for fire between 4km and 10km in the 2015-2019 period (includes between 4km and 10km from a wildfire in 2015 and 2016-2018)

generate fire_4_10km_2015 = 0

forval i=15(1)18{
	replace fire_4_10km_2015 = 1 if treated_20`i'_sim4_10 == 1
}

***Remember: Variable of interest is treated_2015_sim4_10 . 


***fire_10_15km_2005 is for fire between 10km and 15km in the 2005-2009 period ---> pre period control****

generate fire_10_15km_2005 = 0

forval i=5(1)9{
	replace fire_10_15km_2005 = 1 if treated_200`i'_sim10_15 == 1 
}

***fire_10_15km_2010 is for fire between 10km and 15km in the 2010-2014 period ---> pre period control****

generate fire_10_15km_2010 = 0

forval i=10(1)14{
	replace fire_10_15km_2010 = 1 if treated_20`i'_sim10_15 == 1
}

***fire_10_15km_2015 is for fire between 10km and 15km in the 2015-2019 period (includes between 10km and 15km from a wildfire in 2015 and 2016-2018)

generate fire_10_15km_2015 = 0

forval i=15(1)18{
	replace fire_10_15km_2015 = 1 if treated_20`i'_sim10_15 == 1
}

***Remember: Variable of interest is treated_2015_sim10_15 . 


***fire_15_20km_2005 is for fire between 15km and 20km in the 2005-2009 period ---> pre period control****

generate fire_15_20km_2005 = 0

forval i=5(1)9{
	replace fire_15_20km_2005 = 1 if treated_200`i'_sim15_20 == 1 
}

***fire_15_20km_2010 is for fire between 15km and 20km in the 2010-2014 period ---> pre period control****

generate fire_15_20km_2010 = 0

forval i=10(1)14{
	replace fire_15_20km_2010 = 1 if treated_20`i'_sim15_20 == 1
}

***fire_15_20km_2015 is for fire between 15km and 20km in the 2015-2019 period (includes between 15km and 20km from a wildfire in 2015 and 2016-2018)

generate fire_15_20km_2015 = 0

forval i=15(1)18{
	replace fire_15_20km_2015 = 1 if treated_20`i'_sim15_20 == 1
}

***Remember: Variable of interest is treated_2015_sim15_20.
	
***Now Run OLS with new cuttoff points***

eststo clear

***No pre fire controls	

***REG(1) - Table 5*** - within 4, 4-10, 10-15, 15-20, no pre fire controls 

eststo: quietly reg medval treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 $race $travel $educ $built $bdrm $mortag i.time i.statea, robust	

***With pre fire controls 

***REG(2) - Table 5 - within 4, 4-10, 10-15, 15-20, with pre fire controls 

eststo: quietly reg medval treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005 fire_4km_2010 fire_4_10km_2005 fire_4_10km_2010 fire_10_15km_2005 fire_10_15km_2010 fire_15_20km_2005 fire_15_20km_2010 $race $travel $educ $built $bdrm $mortag i.time i.statea, robust	

***Not significant within 4km or 4km-10km. 

***Generate dummy which incorporates fires in 2005 period for FD regression pre-period fire controls, since FD drops 2005 fires if I do not create a dummy which incorporate wildfires for each distance***

generate fire_4_10km_2005_2010 = 0
replace fire_4_10km_2005_2010 = 1 if fire_4_10km_2005 == 1
bysort gisjoin (year): replace fire_4_10km_2005_2010 = fire_4_10km_2005_2010[1]
replace fire_4_10km_2005_2010 = 1 if fire_4_10km_2010 == 1
replace fire_4_10km_2005_2010 = 0 if year == "2015-2019"
	
generate fire_10_15km_2005_2010 = 0
replace fire_10_15km_2005_2010 = 1 if fire_10_15km_2005 == 1
bysort gisjoin (year): replace fire_10_15km_2005_2010 = fire_10_15km_2005_2010[1]
replace fire_10_15km_2005_2010 = 1 if fire_10_15km_2010 == 1
replace fire_10_15km_2005_2010 = 0 if year == "2015-2019"

generate fire_15_20km_2005_2010 = 0
replace fire_15_20km_2005_2010 = 1 if fire_15_20km_2005 == 1
bysort gisjoin (year): replace fire_15_20km_2005_2010 = fire_15_20km_2005_2010[1]
replace fire_15_20km_2005_2010 = 1 if fire_15_20km_2010 == 1
replace fire_15_20km_2005_2010 = 0 if year == "2015-2019"	

***Now run FD regressions with pre-period controls for new categories***


***REG (3) -Table 5- within 4, 4-10, 10-15, 15-20, no pre fire controls
eststo: quietly reg dmedval treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***REG(4) -Table 5-within 4, 4-10, 10-15, 15-20, with pre fire controls

eststo: quietly reg dmedval treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005_2010 fire_4_10km_2005_2010 fire_10_15km_2005_2010 fire_15_20km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***REG(5) - Table 5- within 4, 4-10, 10-15, 15-20, no pre fire controls

eststo: quietly reg dlnmedval treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***REG(6) - Table 5 - within 4, 4-10, 10-15, 15-20, with pre fire controls

eststo: quietly reg dlnmedval treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005_2010 fire_4_10km_2005_2010 fire_10_15km_2005_2010 fire_15_20km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***Significant within 4km and 4km-10km, but not significant beyond 10km. 

label variable treated_2015_sim4_10 "4km-10km 2015 \& 2015-2019"
label variable treated_2015_sim10_15 "10km-15km 2015 \& 2015-2019"
label variable treated_2015_sim15_20 "15km-20km 2015 \& 2015-2019"
label variable fire_4_10km_2005_2010 "Pre-Fire 4km-10km 2005-2014"
label variable fire_10_15km_2005_2010 "Pre-Fire 10km-15km 2005-2014"
label variable fire_15_20km_2005_2010 "Pre-Fire 15km-20km 2005-2014"

esttab, label varwidth(30) modelwidth(20) addnotes("Models (3)-(6) use time fixed effects, and standard errors clustered on block groups." "Models (1)-(2) use time and state fixed effects with robust standard errors." "Model (2),(4), and (6) controls for previous wildfires in the 2005-2009 and 2010-2014 periods within 4km, 4km-10km, 10km-15km, and 15km-20km from block group" "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("OLS \& First Difference Within 4km, 4km-10km, 10km-15km, and 15km-20km from a 2015 Wildfire Perimeter on Block Group Median Property Values") scalars(r2) keep(treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005_2010 fire_4_10km_2005_2010 fire_10_15km_2005_2010 fire_15_20km_2005_2010)

esttab using regression_thesis_table5.tex, label varwidth(30) modelwidth(20) addnotes("Models (3)-(6) use time fixed effects, and standard errors clustered on block groups." "Models (1)-(2) use time and state fixed effects with robust standard errors." "Model (2),(4), and (6) controls for previous wildfires in the 2005-2009 and 2010-2014 periods within 4km, 4km-10km, 10km-15km, and 15km-20km from block group" "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("OLS \& First Difference Within 4km, 4km-10km, 10km-15km, and 15km-20km from a 2015 Wildfire Perimeter on Block Group Median Property Values") scalars(r2) keep(treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005_2010 fire_4_10km_2005_2010 fire_10_15km_2005_2010 fire_15_20km_2005_2010) replace

eststo clear

***************************************************************************************************************************************************************************************************************************************************

***Core Assumption: There are no time-varying factors within a block-group that are correlated with both property values and being within 4km away from a wildfire perimeter. --> regress growth rate of house prices between 2005-2009 and 2010-2014 and regress with original specificaton and regression coefficient should be close to zero if the core assumption is true***

sort gisjoin year 

by gisjoin: gen growth_medval_2005_2010 = lnmedval[2] - lnmedval[1]

by gisjoin: gen growth_medval_2005_2010_p = (medval[2] - medval[1])/medval[1]

**Ran it on percentage growth and ln approximation and results were consistent to the approximation 
**growth_medval_2005_2010_p is the growth rate in median property values between 2005-2009 and 2010-2014, with controls first 2005-2009 will drop out and growth over that period will be regressed on later fires***

***Original specification where dummy fire_2015 is within 4km for 2015 fire and at least one previous fire***

eststo clear 

***REG(1) - Table 6*** - regressing within 4km on change in prices between 2005-2009 and 2010-2014 periods. 

eststo: quietly reg growth_medval_2005_2010_p fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

**reg growth_medval_2005_2010 fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

**reg growth_medval_2005_2010_p fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***REG(2) - Table 6 *** regressing within 4km on change in prices between 2005-2009 and 2010-2014 periods, limit analysis to block groups only 20km away from wildfire perimeter

eststo: quietly reg growth_medval_2005_2010_p fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)

**reg growth_medval_2005_2010 fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)

**reg growth_medval_2005_2010_p fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)

***reg dlnmedval fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
***regressing on growth_medval_2005_2010 shows effect is not significant, but is in original spec, this is evidence to suggest there are no time varying factors correlated wth both property values and being within 4km from a 2015 wildfire. 

***REG(3) - Table 6 - regressing within 4, 4-10, 10-15, and 15-20 on change in growth of prices between 2005-2009 and 2010-2014 with no pre-fire controls. 

eststo: quietly reg growth_medval_2005_2010_p treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

**reg growth_medval_2005_2010 treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

**reg growth_medval_2005_2010_p treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***REG(4)-Table 6 - regressing within 4, 4-10, 10-15, and 15-20 on change in growth of prices between 2005-2009 and 2010-2014 with pre-fire controls.

eststo: quietly reg growth_medval_2005_2010_p treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005_2010 fire_4_10km_2005_2010 fire_10_15km_2005_2010 fire_15_20km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

**reg growth_medval_2005_2010 treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005_2010 fire_4_10km_2005_2010 fire_10_15km_2005_2010 fire_15_20km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

**reg growth_medval_2005_2010_p treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005_2010 fire_4_10km_2005_2010 fire_10_15km_2005_2010 fire_15_20km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***reg dlnmedval treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005_2010 fire_4_10km_2005_2010 fire_10_15km_2005_2010 fire_15_20km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***beyond 4km it seems like the core assumption is violated and there may be other time varying factors correlated with property values and being within 4km from a wildfire.***

label variable growth_medval_2005_2010_p "\% D in Median Value"

***For small percentage changes the difference in log(y_t)-log(y_{t-1}) is approximately equal to Y_t-Y_{t-1}/Y_t 
***summarize growth_medval_2005_2010


esttab, label varwidth(30) modelwidth(20) addnotes("Models (1)-(4) use time fixed effects, and standard errors clustered on block groups." "Model (2) excludes block groups further than 20km from a 2015 wildfire perimeter" "Model (4) controls for previous wildfires in the 2005-2009 and 2010-2014 periods within 4km, 4km-10km, 10km-15km, and 15km-20km from a block group" "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("First Difference Regressions Distance from a 2015 Wildfire Perimeter on Percentage Change in Median Value between 2005-2009 and 2010-2014 Periods") scalars(r2) keep(fire_2015 treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005_2010 fire_4_10km_2005_2010 fire_10_15km_2005_2010 fire_15_20km_2005_2010)

esttab using regression_thesis_table6.tex, label varwidth(30) modelwidth(20) addnotes("Models (1)-(4) use time fixed effects, and standard errors clustered on block groups." "Model (2) excludes block groups further than 20km from a 2015 wildfire perimeter" "Model (4) controls for previous wildfires in the 2005-2009 and 2010-2014 periods within 4km, 4km-10km, 10km-15km, and 15km-20km from a block group" "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("First Difference Regressions Distance from a 2015 Wildfire Perimeter on Percentage Change in Median Value between 2005-2009 and 2010-2014 Periods") scalars(r2) keep(fire_2015 treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005_2010 fire_4_10km_2005_2010 fire_10_15km_2005_2010 fire_15_20km_2005_2010) replace

eststo clear

***************************************************************************************************************************************************************************************************************************************************

*****COMPARE MEANS FOR TREATED VERSUS UNTREATED GROUPS ACROSS CONTROL VARIABLES*******

eststo clear 

estpost ttest race_1 race_2 race_3 race_4 race_5 race_6 race_7 travel_1 travel_2 travel_3 travel_4 travel_5 travel_6 travel_7 travel_8 travel_9 travel_10 travel_11 travel_12 educ_1 educ_2 educ_3 educ_4 educ_5 educ_6 educ_7 educ_8 educ_9 educ_10 educ_11 educ_12 educ_13 educ_14 educ_15 educ_16 built_1 built_2 built_3 built_4 built_5 built_6 built_7 built_8 nobedroom bdrm_1 bdrm_2 bdrm_3 bdrm_4 bdrm_5 mortag_1 mortag_5, by(fire_2015) unequal

esttab, wide varwidth(50) nonumber mtitle("diff.") title("Two Sample t-test with Unequal Variances on Control Variables by Within 4km from a 2015 Wildfire") addnotes("4km 2015 Ring dummy variable is used to create the two samples between within and not within 4km from a 2015 wildfire perimeter" "diff. is difference in means between control and treated groups (i.e. not within 4km - within 4km)" "*All variables above are in proportion terms of the block group (e.g. 1 bedroom is proportion of homes in the block group with one bedroom)") label

esttab using mean_comparisson_controls.tex, wide varwidth(50) nonumber mtitle("diff.") title("Two Sample t-test with Unequal Variances on Control Variables by Within 4km from a 2015 Wildfire") addnotes("4km 2015 Ring dummy variable is used to create the two samples between within and not within 4km from a 2015 wildfire perimeter" "diff. is difference in means between control and treated groups (i.e. not within 4km - within 4km)" "*All variables above are in proportion terms of the block group (e.g. 1 bedroom is proportion of homes in the block group with one bedroom)") label replace 

eststo clear 

estpost ttest race_1 race_2 race_3 race_4 race_5 race_6 race_7 travel_1 travel_2 travel_3 travel_4 travel_5 travel_6 travel_7 travel_8 travel_9 travel_10 travel_11 travel_12 educ_1 educ_2 educ_3 educ_4 educ_5 educ_6 educ_7 educ_8 educ_9 educ_10 educ_11 educ_12 educ_13 educ_14 educ_15 educ_16 built_1 built_2 built_3 built_4 built_5 built_6 built_7 built_8 nobedroom bdrm_1 bdrm_2 bdrm_3 bdrm_4 bdrm_5 mortag_1 mortag_2 mortag_3 mortag_4 mortag_5, by(treated_2015_sim) unequal

esttab, wide nonumber mtitle("diff.")

eststo clear

****Extend Treatment Dummy out to 10KM given previous robustness regression where effect was significant within 10KM****

forval i=5(1)9{
	generate treated_200`i'_within10 = 0
	replace treated_200`i'_within10 = 1 if (min_dist_200`i'_sim <= 10000) & (year == "2005-2009")
}

forval i=10(1)14{
	generate treated_20`i'_within10 = 0
	replace treated_20`i'_within10 = 1 if (min_dist_20`i'_sim <= 10000) & (year == "2010-2014")
}

forval i=15(1)18{
	generate treated_20`i'_within10 = 0
	replace treated_20`i'_within10 = 1 if (min_dist_20`i'_sim <= 10000) & (year == "2015-2019")
}

generate fire_within_10km = 0

forval i=5(1)9{
	replace fire_within_10km = 1 if treated_200`i'_within10 == 1 
}

forval i=10(1)18{
	replace fire_within_10km = 1 if treated_20`i'_within10 == 1
}

eststo clear 

estpost ttest race_1 race_2 race_3 race_4 race_5 race_6 race_7 travel_1 travel_2 travel_3 travel_4 travel_5 travel_6 travel_7 travel_8 travel_9 travel_10 travel_11 travel_12 educ_1 educ_2 educ_3 educ_4 educ_5 educ_6 educ_7 educ_8 educ_9 educ_10 educ_11 educ_12 educ_13 educ_14 educ_15 educ_16 built_1 built_2 built_3 built_4 built_5 built_6 built_7 built_8 nobedroom bdrm_1 bdrm_2 bdrm_3 bdrm_4 bdrm_5 mortag_1 mortag_2 mortag_3 mortag_4 mortag_5, by(fire_within_10km) unequal

esttab, wide nonumber mtitle("diff.")

eststo clear

***Even within 10km as the dummy variable between treatment and control there appears to be a significant statistical difference other than the treatment effect, therefore I cannot rule out that there is a relationship between the treatment and controls other than the treatment effect ****

***F-test to see if there is joint significance in explanatory variables***

reg dmedval fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

test drace_2=drace_3=drace_4=drace_5=drace_6=drace_7=dtravel_2=dtravel_3=dtravel_4=dtravel_5=dtravel_6=dtravel_7=dtravel_8=dtravel_9=dtravel_10=dtravel_11=dtravel_12=deduc_2=deduc_3=deduc_4=deduc_5=deduc_6=deduc_7=deduc_8=deduc_9=deduc_10=deduc_11=deduc_12=deduc_13=deduc_14=deduc_15=deduc_16=dbuilt_2=dbuilt_3=dbuilt_4=dbuilt_5=dbuilt_6=dbuilt_7=dbuilt_8=dbdrm_1=dbdrm_2=dbdrm_3=dbdrm_4=dbdrm_5=dmortag_3=dmortag_4=dmortag_5=0

***F-test concludes there is joint significance across the control variables for the original regression***

***REGRESS CONTROLS ON TREATMENT DUMMY TO TEST FOR RANDOM TREATMENT --> EFFECT SHOULD BE CLOSE TO ZERO***

***Both treatments show insignificance across controls***

***Regress controls on treatment individually***

eststo clear 

tokenize `""$\Delta$ White alone" "$\Delta$ Black or African American alone" "$\Delta$ American Indian and Alaska Native alone" "$\Delta$ Asian alone" "$\Delta$ Native Hawaiian and Other Pacific Islander alone" "$\Delta$ Some other race alone" "$\Delta$ Two or more races""'

forvalues i=1(1)7{
	label variable drace_`i' "``i''"
}

tokenize `""$\Delta$ Less than 5 minutes" "$\Delta$ 5 to 9 minutes" "$\Delta$ 10 to 14 minutes" "$\Delta$ 15 to 19 minutes" "$\Delta$ 20 to 24 minutes" "$\Delta$ 25 to 29 minutes" "$\Delta$ 30 to 34 minutes" "$\Delta$ 35 to 39 minutes" "$\Delta$ 40 to 44 minutes" "$\Delta$ 45 to 59 minutes" "$\Delta$ 60 to 89 minutes" "$\Delta$ 90 or more minutes""'

forvalues i=1/12{
    label variable dtravel_`i' "``i''"
}

tokenize `""$\Delta$ No schooling completed" "$\Delta$ Nursery to 4th grade" "$\Delta$ 5th and 6th grade" "$\Delta$ 7th and 8th grade" "$\Delta$ 9th grade" "$\Delta$ 10th grade" "$\Delta$ 11th grade" "$\Delta$ 12th grade no diploma" "$\Delta$ High school graduate, GED, or alternative" "$\Delta$ Some college less than 1 year" "$\Delta$ Some college 1 or more years no degree" "$\Delta$ Associates degree" "$\Delta$ Bachelors degree" "$\Delta$ Masters degree" "$\Delta$ Professional school degree" "$\Delta$ Doctorate degree""'

forvalues i=1/16{
    label variable deduc_`i' "``i''"
}

tokenize `""$\Delta$ Built 2000 or later" "$\Delta$  Built 1990 to 1999" "$\Delta$  Built 1980 to 1989" "$\Delta$  Built 1970 to 1979" "$\Delta$  Built 1960 to 1969" "$\Delta$  Built 1950 to 1959" "$\Delta$  Built 1940 to 1949" "$\Delta$  Built 1939 or earlier""'

forvalues i=1/8{
    label variable dbuilt_`i' "``i''"
}

tokenize `""$\Delta$ 1 bedroom" "$\Delta$ 2 bedrooms" "$\Delta$ 3 bedrooms" "$\Delta$ 4 bedrooms" "$\Delta$ 5 or more bedrooms""'

forvalues i=1/5{
    label variable dbdrm_`i' "``i''"
}

tokenize `""$\Delta$ Housing units with a mortgage contract to purchase or similar debt" "$\Delta$ Housing units with a mortgage contract to purchase or similar debt With either a second mortgage or home equity loan but not both""$\Delta$ Housing units with a mortgage contract to purchase or similar debt Both second mortgage and home equity loan" "$\Delta$ Housing units with a mortgage contract to purchase or similar debt No second mortgage and no home equity loan" "$\Delta$ Housing units without a mortgage""'

forvalues i=1/5{
    label variable dmortag_`i' "``i''"
}

eststo clear 

foreach var in drace_2 drace_3 drace_4 drace_5 drace_6 drace_7{
	eststo: quietly reg fire_2015 `var' i.time, vce(cluster gisjoin)
}
esttab using robust_reg1.tex, label varwidth(52) modelwidth(20) title("Simple OLS Regression of Controls on Within 4km from a 2015 Wildfire Perimeter") scalars(r2) keep(drace_2 drace_3 drace_4 drace_5 drace_6 drace_7) nonotes replace

eststo clear

foreach var in dtravel_2 dtravel_3 dtravel_4 dtravel_5 dtravel_6 dtravel_7{
	eststo: quietly reg fire_2015 `var' i.time, vce(cluster gisjoin)
}

esttab using robust_reg2.tex, label varwidth(52) modelwidth(20) scalars(r2) keep(dtravel_2 dtravel_3 dtravel_4 dtravel_5 dtravel_6 dtravel_7) nonotes replace 

eststo clear 

foreach var in dtravel_8 dtravel_9 dtravel_10 dtravel_11 dtravel_12 deduc_2{
	eststo: quietly reg fire_2015 `var' i.time, vce(cluster gisjoin)
}

esttab using robust_reg3.tex, label varwidth(52) modelwidth(20) scalars(r2) keep(dtravel_8 dtravel_9 dtravel_10 dtravel_11 dtravel_12 deduc_2) nonotes replace 

eststo clear 

foreach var in deduc_3 deduc_4 deduc_5 deduc_6 deduc_7 deduc_8{
	eststo: quietly reg fire_2015 `var' i.time, vce(cluster gisjoin)
}

esttab using robust_reg4.tex, label varwidth(52) modelwidth(20) scalars(r2) keep(deduc_3 deduc_4 deduc_5 deduc_6 deduc_7 deduc_8) nonotes replace 

eststo clear 

foreach var in deduc_9 deduc_10 deduc_11 deduc_12 deduc_13 deduc_14{
    eststo: quietly reg fire_2015 `var' i.time, vce(cluster gisjoin)
}

esttab using robust_reg5.tex, label varwidth(52) modelwidth(20) scalars(r2) keep(deduc_9 deduc_10 deduc_11 deduc_12 deduc_13 deduc_14) nonotes replace 

eststo clear 

foreach var in deduc_15 deduc_16 dbuilt_2 dbuilt_3 dbuilt_4 dbuilt_5{
     eststo: quietly reg fire_2015 `var' i.time, vce(cluster gisjoin)
}

esttab using robust_reg6.tex, label varwidth(52) modelwidth(20) scalars(r2) keep(deduc_15 deduc_16 dbuilt_2 dbuilt_3 dbuilt_4 dbuilt_5) nonotes replace 

eststo clear 

foreach var in dbuilt_6 dbuilt_7 dbuilt_8 dbdrm_1 dbdrm_2 dbdrm_3{
    eststo: quietly reg fire_2015 `var' i.time, vce(cluster gisjoin)
}

esttab using robust_reg7.tex, label varwidth(52) modelwidth(20) scalars(r2) keep(dbuilt_6 dbuilt_7 dbuilt_8 dbdrm_1 dbdrm_2 dbdrm_3) nonotes replace 

eststo clear

foreach var in dbdrm_4 dbdrm_5 dmortag_3 dmortag_4 dmortag_5{
    eststo: quietly reg fire_2015 `var' i.time, vce(cluster gisjoin)
}

esttab using robust_reg8.tex, label varwidth(52) modelwidth(20) scalars(r2) keep(dbdrm_4 dbdrm_5 dmortag_3 dmortag_4 dmortag_5) addnotes("Time fixed effects used") replace 

eststo clear

***Most variables appear to be statistically insignificant --> good as it shows that the controls and treatment are not related***


***reg fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***REG (1) Table 8 ---Controls on treated dummy fire_2015
eststo clear 
eststo: quietly reg fire_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***REG (2) Table 8 --- Controls on treated dummy treated_2015_sim (same as fire_2015)

eststo: quietly reg treated_2015_sim $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***REG (3) Table 8 --_ Controls on treated dummy treated_2015_sim with pre-fire control

eststo: quietly reg treated_2015_sim fire_4km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)

***REG (4) Table 8 --- OLS Controls on treated dummy treated_2015_sim with pre-fire control and WHP 

***eststo: quietly reg treated_2015_sim fire_4km_2005_2010 $race $travel $educ $built $bdrm $mortag i.median_whp i.time, robust  

esttab, label varwidth(52) modelwidth(30) title("First Difference Regression of Controls on Within 4km from a 2015 Wildfire Perimeter") scalars(r2) order(fire_4km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag) keep(fire_4km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag) addnotes("Models (1)-(3) use time fixed effects and standard errors clustered on block groups.")

esttab using fd_reg_on_treatment_table8.tex, label varwidth(52) modelwidth(30) title("First Difference Regression of Controls on Within 4km from a 2015 Wildfire Perimeter") scalars(r2) order(fire_4km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag) keep(fire_4km_2005_2010 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag) addnotes("Models (1)-(3) use time fixed effects and standard errors clustered on block groups.") replace 

eststo clear 

***REG (1) Table 9 -- Controls on treated dummy fire_2015

eststo: quietly reg fire_2015 $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)

***REG (2) Table 9 -- Controls on treated_2015_sim

eststo: quietly reg treated_2015_sim $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)

***REG (3) Table 9 -- Controls on treated_2015_sim with 4km pre fire controls

eststo: quietly reg treated_2015_sim fire_4km_2005 fire_4km_2010 $race $travel $educ $built $bdrm $mortag i.time i.statea, vce(robust)

***REG (4) Table 9 -- Controls on treated_2015_sim with 4km pre fire controls and WHP 2020 control 

eststo: quietly reg treated_2015_sim fire_4km_2005 fire_4km_2010 $race $travel $educ $built $bdrm $mortag i.median_whp i.time i.statea, vce(robust)

esttab, label varwidth(52) modelwidth(30) title("OLS Regression of Controls on Within 4km from a 2015 Wildfire Perimeter") scalars(r2) order(fire_4km_2005 fire_4km_2010 $race $travel $educ $built $bdrm $mortag 1.median_whp 2.median_whp 3.median_whp 4.median_whp 5.median_whp) keep(fire_4km_2005 fire_4km_2010 $race $travel $educ $built $bdrm $mortag 1.median_whp 2.median_whp 3.median_whp 4.median_whp 5.median_whp) addnotes("Models (1)-(4) use state and time fixed effects with robust standard errors." "Model (3) and (4) have pre-fire controls for wildfires within 4km from a block group in 2005-2009 and 2010-2014 periods." "Model (4) includes the 2020 Wildfire Hazard Potential (WHP) control.") 

esttab using ols_reg_on_treatment_table9.tex, label varwidth(52) modelwidth(30) title("OLS Regression of Controls on Within 4km from a 2015 Wildfire Perimeter") scalars(r2) order(fire_4km_2005 fire_4km_2010 $race $travel $educ $built $bdrm $mortag 1.median_whp 2.median_whp 3.median_whp 4.median_whp 5.median_whp) keep(fire_4km_2005 fire_4km_2010 $race $travel $educ $built $bdrm $mortag 1.median_whp 2.median_whp 3.median_whp 4.median_whp 5.median_whp) addnotes("Models (1)-(4) use state and time fixed effects with robust standard errors." "Model (3) and (4) have pre-fire controls for wildfires within 4km from a block group in 2005-2009 and 2010-2014 periods." "Model (4) includes the 2020 Wildfire Hazard Potential (WHP) control.") replace 

eststo clear 


******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

***WILDFIRE HAZARD POTENTIAL CONTROL (may not have time to do)***

***Got WHP data for 2020, as from the USDA Forest Service Fire Modelling Institute: https://arc-gis-hub-home-arcgishub.hub.arcgis.com/datasets/ce92e9a37f27439082476c369e2f4254_5?geometry=-175.670%2C23.316%2C-8.414%2C47.926***

eststo clear 



***OLS with WHP control which is time invariant as it is an estimate over many years and I did not get previous year estimates****

***REG (1) - Table 7 -  Baseline ols with no pre-fire controls on treated_2015_sim only (i.e. treated in 2015 and last period 2015-2019) + median_whp***

eststo: quietly reg medval treated_2015_sim $race $travel $educ $built $bdrm $mortag i.median_whp i.time i.statea, robust

***REG (2) - Table 7 - Baseline ols with pre-fire controls 2005-2010 years within 4km on treated_2015_sim only + median_whp***

eststo: quietly reg medval treated_2015_sim fire_4km_2005 fire_4km_2010 $race $travel $educ $built $bdrm $mortag i.median_whp i.time i.statea, robust

***REG (3) - Table 7 - Baseline ols with no pre-fire controls on treated_2015_sim treated_2015_sim4 only + median_whp***

eststo: quietly reg medval treated_2015_sim treated_2015_sim4 $race $travel $educ $built $bdrm $mortag i.median_whp i.time i.statea, robust

***REG (4) - Table 7 - Baseline ols with pre-fire controls on treated_2015_sim treated_2015_sim4 only + median_whp***

eststo: quietly reg medval treated_2015_sim treated_2015_sim4 fire_4km_2005 fire_4km_2010 fire_4_20km_2005 fire_4_20km_2010 $race $travel $educ $built $bdrm $mortag i.median_whp i.time i.statea, robust

***REG(5) - Table 7*** - within 4, 4-10, 10-15, 15-20, no pre fire controls + median_whp***

eststo: quietly reg medval treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 $race $travel $educ $built $bdrm $mortag i.median_whp i.time i.statea, robust	

***With pre fire controls 

***REG(6) - Table 7 - within 4, 4-10, 10-15, 15-20, with pre fire controls + median_whp

eststo: quietly reg medval treated_2015_sim treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005 fire_4km_2010 fire_4_10km_2005 fire_4_10km_2010 fire_10_15km_2005 fire_10_15km_2010 fire_15_20km_2005 fire_15_20km_2010 $race $travel $educ $built $bdrm $mortag i.median_whp i.time i.statea, robust



label variable fire_4_10km_2005 "Pre-Fire 4km-10km 2005-2009" 
label variable fire_4_10km_2010 "Pre-Fire 4km-10km 2010-2014"
label variable fire_10_15km_2005 "Pre-Fire 10km-15km 2005-2009"
label variable fire_10_15km_2010 "Pre-Fire 10km-15km 2010-2014"
label variable fire_15_20km_2005 "Pre-Fire 15km-20km 2005-2009"
label variable fire_15_20km_2010 "Pre-Fire 15km-20km 2010-2014"
	
esttab, label varwidth(30) modelwidth(20) addnotes("Models (1)-(6) use state and time fixed effects with robust standard errors." "Model (2) controls for previous wilfires in 2005-2009 and 2010-2014 within 4km." "Model (4) controls for previous wilfires in 2005-2009 and 2010-2014 within 4km and 4km-20km." "Model (6) controls for previous wildfires in the 2005-2009 and 2010-2014 periods within 4km, 4km-10km, 10km-15km, and 15km-20km from block group." "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("OLS Within 4km, 4km-10km, 10km-15km, and 15km-20km from a 2015 Wildfire Perimeter on Block Group Median Property Values With WHP Controls") scalars(r2) order(treated_2015_sim  treated_2015_sim4 treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005 fire_4km_2010 fire_4_20km_2005 fire_4_20km_2010 fire_4_10km_2005 fire_4_10km_2010 fire_10_15km_2005 fire_10_15km_2010 fire_15_20km_2005 fire_15_20km_2010 1.median_whp 2.median_whp 3.median_whp 4.median_whp 5.median_whp) keep(treated_2015_sim  treated_2015_sim4 treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005 fire_4km_2010 fire_4_20km_2005 fire_4_20km_2010 fire_4_10km_2005 fire_4_10km_2010 fire_10_15km_2005 fire_10_15km_2010 fire_15_20km_2005 fire_15_20km_2010 1.median_whp 2.median_whp 3.median_whp 4.median_whp 5.median_whp)

esttab using regression_thesis_table7.tex, label varwidth(30) modelwidth(20) addnotes("Models (1)-(6) use state and time fixed effects with robust standard errors." "Model (2) controls for previous wilfires in 2005-2009 and 2010-2014 within 4km." "Model (4) controls for previous wilfires in 2005-2009 and 2010-2014 within 4km and 4km-20km." "Model (6) controls for previous wildfires in the 2005-2009 and 2010-2014 periods within 4km, 4km-10km, 10km-15km, and 15km-20km from block group." "Controls: Percent Race, Percent Educated, Percent Travel Time to Work, Percent Year Built, Percent Number of Bedrooms, Percent With Mortgage.") title("OLS Within 4km, 4km-10km, 10km-15km, and 15km-20km from a 2015 Wildfire Perimeter on Block Group Median Property Values With WHP Controls") scalars(r2) order(treated_2015_sim  treated_2015_sim4 treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005 fire_4km_2010 fire_4_20km_2005 fire_4_20km_2010 fire_4_10km_2005 fire_4_10km_2010 fire_10_15km_2005 fire_10_15km_2010 fire_15_20km_2005 fire_15_20km_2010 1.median_whp 2.median_whp 3.median_whp 4.median_whp 5.median_whp) keep(treated_2015_sim  treated_2015_sim4 treated_2015_sim4_10 treated_2015_sim10_15 treated_2015_sim15_20 fire_4km_2005 fire_4km_2010 fire_4_20km_2005 fire_4_20km_2010 fire_4_10km_2005 fire_4_10km_2010 fire_10_15km_2005 fire_10_15km_2010 fire_15_20km_2005 fire_15_20km_2010 1.median_whp 2.median_whp 3.median_whp 4.median_whp 5.median_whp) replace 

******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
***BOX COX TRANSFORMATION****
***ref: https://data.princeton.edu/wws509/stata/c2s10***
***box cox on dependent variable

***Run on original model***

boxcox medval fire_2015 $race $travel $educ $built $bdrm $mortag, vce(robust) model(lhs) nolog

ereturn list

***Save maximum log liklihood as a scalar***

scalar maxlogL = e(ll)

***generate variables to store exponents (p) and log liklihood (logL)***
// drop p 
// drop logL

gen p = .

gen logL = .

local I = 1

forvalues p = -1(0.5)2	{
	quietly boxcox medval fire_2015 $race $travel $educ $built $bdrm $mortag, vce(robust) model(lhs) from(`p',copy) iterate(0)
	quietly replace p = `p' in `I'
	quietly replace logL = e(ll) in `I'
	local I = `I'+ 1
}

**drop cb
**gen cb =  maxlogL - 3.84/2  if p > -1 & p < 1.5
**Upper bound on chi-square with 100 df os 124.342
gen cb =  maxlogL - 124.342/2  if p > -1 & p < 1

graph twoway (mspline logL p, bands(7)) (line cb p) ,   ///
        title("Figure: Box-Cox Profile Log-Likelihood")  ///
        xtitle("lambda") ytitle("log-likelihood") legend(off)
		
***suggests the transform doesn't really matter but the log liklihood shows that the ln transform on the dependent is a close approximation to be correct for the distribution in median property values***


*****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************	
// ***Run regresssions on dummy categories within 4km and 4km-20km
// ***Dummy for within 4-20km for 2015 and years before. 1,1 and 0,1. 
// generate fire_2015_4_20km = 0
// replace fire_2015_4_20km = 1 if (treated_2005_sim4 == 1 | treated_2006_sim4 == 1 | treated_2007_sim4 == 1 | treated_2008_sim4 == 1 | treated_2009_sim4 == 1 | treated_2010_sim4 == 1 | treated_2011_sim4 == 1 | treated_2012_sim4 == 1 | treated_2013_sim4 == 1 | treated_2014_sim4 == 1) & (treated_2015_sim4 == 1)
// replace fire_2015_4_20km = 1 if treated_2015_sim4 == 1 
//
// **eststo: reg dmedval fire_2015 fire_2015_4_20km $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
//
//
// **eststo: reg dlnmedval fire_2015 fire_2015_4_20km $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
//
// esttab using regresssions_olsfirstdiff.tex, label title("OLS & First Difference Regression For Within 4 km of 2015 Wildfire Perimeter") scalars(r2) keep(fire_2015) replace
//
// eststo clear
//
//
// ***excluded category is greater than 20km
//
// ***Question: Do I include the time fixed effect in the first difference regression?
//
// ***Make a Pre-Trend Graph***
//
// // collapse (mean) medval, by(fire_2015 time)
// // separate medval, by(fire_2015)
// // graph twoway line medval0 medval1 time, sort
//
// ***Quick Robustnesss Checks***
//
// ***Control for block groups which have wildfires in the pre-periods 2005-2009 and 2010-2014
// ***Control for block groups only with fire in pre-period. 
//
// gen fire_pre_2015_4km = 0 
// replace fire_pre_2015_4km = 1 if (treated_2005_sim == 1 | treated_2006_sim == 1 | treated_2007_sim == 1 | treated_2008_sim == 1 | treated_2009_sim == 1 | treated_2010_sim == 1 | treated_2011_sim == 1 | treated_2012_sim == 1 | treated_2013_sim == 1 | treated_2014_sim == 1) & (treated_2015_sim == 0)
// **block groups which had fires within 4km in the pre-period and no fire within 4 km in the after period.
//
// count if fire_pre_2015_4km == 1
// ***11,871 observations treated in pre - not treated post
//
// gen fire_pre_2015_4_20km = 0
// replace fire_pre_2015_4_20km = 1 if (treated_2005_sim4 == 1 | treated_2006_sim4 == 1 | treated_2007_sim4 == 1 | treated_2008_sim4 == 1 | treated_2009_sim4 == 1 | treated_2010_sim4 == 1 | treated_2011_sim4 == 1 | treated_2012_sim4 == 1 | treated_2013_sim4 == 1 | treated_2014_sim4 == 1) & (treated_2015_sim4 == 0)
// **block groups which had fires between 4km  and 20km in the pre-period and no fire between 4km and 20km in the after period.
//
// count if fire_pre_2015_4_20km == 1
// ***61,702 treated in pre 4 to 20km not treated in post 4 to 20km 
//
// gen only_treat_2015 = 0
// replace only_treat_2015 = 1 if (treated_2005_sim == 0 | treated_2006_sim == 0 | treated_2007_sim == 0 | treated_2008_sim == 0 | treated_2009_sim == 0 | treated_2010_sim == 0 | treated_2011_sim == 0 | treated_2012_sim == 0 | treated_2013_sim == 0 | treated_2014_sim == 0) & (treated_2015_sim == 1)
//
// gen only_treat_2015_4_20km = 0
// replace only_treat_2015_4_20km = 1 if (treated_2005_sim4 == 0 | treated_2006_sim4 == 0 | treated_2007_sim4 == 0 | treated_2008_sim4 == 0 | treated_2009_sim4 == 0 | treated_2010_sim4 == 0 | treated_2011_sim4 == 0 | treated_2012_sim4 == 0 | treated_2013_sim4 == 0 | treated_2014_sim4 == 0) & (treated_2015_sim4 == 1)
//
//
// count if only_treat_2015 == 1
// **481 observations, not treated in pre but treated in 2015.
//
// count if only_treat_2015_4_20km == 1
// **9,742 obs, not treated within 4 and 20km in pre and treated within 4 to 20km in post. 
//
// eststo clear
//
// ***eststo: reg medval only_treat_2015 fire_pre_2015_4km $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)
// *Not significant
//
// ***eststo: reg medval only_treat_2015 only_treat_2015_4_20km fire_pre_2015_4km fire_pre_2015_4_20km $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)
// *Not significant
//
// ***eststo: reg dmedval only_treat_2015 fire_pre_2015_4km $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
//
// ***eststo: reg dmedval only_treat_2015 only_treat_2015_4_20km fire_pre_2015_4km fire_pre_2015_4_20km $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
//
// ***FD results appear to be robust controlling for block groups which had any fire in the pre period and No fire in 2015. 
//
// ***Check how many only post treatment
// gen treat_exclusive_2015 = 0 
// replace treat_exclusive_2015 = 1 if (treated_2005_sim == 0 & treated_2006_sim == 0 & treated_2007_sim == 0 & treated_2008_sim == 0 & treated_2009_sim == 0 & treated_2010_sim == 0 & treated_2011_sim == 0 & treated_2012_sim == 0 & treated_2013_sim == 0 & treated_2014_sim == 0) & (treated_2015_sim == 1)
//
// count if treat_exclusive_2015 == 1
// ***281 obs treat_exclusive_2015 ---- Very small fraction of data 
// ***REG (-) - TABLE 2***
// **eststo: reg medval treat_exclusive_2015 $race $travel $educ $built $bdrm $mortag i.statea i.time, vce(robust)
//
// ***REG(1) - TABLE 2***
//
// eststo: reg dmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
//
// ***REG (2) - TABLE 2***
//
// eststo: reg dlnmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time, vce(cluster gisjoin)
//
// ***Limit Analysis to Inner and Outer Ring***
//
// ***REG (3) - TABLE 2***
// eststo: reg dmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <=20000, vce(cluster gisjoin)
//
// ***REG (4) - TABLE 2***
// eststo: reg dlnmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <=20000, vce(cluster gisjoin)
//
// ***Generate Fire Controls***
//
// forval i = 5(1)9{
//     gen fire_200`i' = 0
// 	replace fire_200`i' = 1 if min_dist_200`i'_sim <= 4000
// }
//
// forval i = 10(1)14{
//     gen fire_20`i' = 0
// 	replace fire_20`i' = 1 if min_dist_20`i'_sim <= 4000
// }
//
// global fire_pre fire_2005 fire_2006 fire_2007 fire_2008 fire_2009 fire_2010 fire_2011 fire_2012 fire_2013 fire_2014
//
// ***REG (5) - TABLE 2***
// eststo: reg dmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag $fire_pre i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)
//
// ***REG (6) - TABLE 2 ***
// eststo: reg dlnmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag $fire_pre i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)
//
// ***REG (7) - TABLE 2- exclude observations with fire in previous period***
//
// // eststo: reg dmedval treat_exclusive_2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag $fire_pre i.time if (min_dist_2015_sim <= 20000 & min_dist_2005_sim > 4000 & min_dist_2006_sim > 4000 & min_dist_2007_sim > 4000 & min_dist_2008_sim > 4000 & min_dist_2009_sim > 4000 & min_dist_2010_sim > 4000 & min_dist_2011_sim > 4000 & min_dist_2012_sim > 4000 & min_dist_2013_sim > 4000 & min_dist_2014_sim > 4000), vce(cluster gisjoin)
//
// esttab using regresssions_robustness.tex, label title("First Difference Robustness Regressions") scalars(r2) keep(treat_exclusive_2015) replace
//
//
// generate treat_exclusive_count = 0
// replace treat_exclusive_count = 1 if (time == 2 & treat_exclusive_2015 == 1)
//
// count if treat_exclusive_count == 1 
// ***Only 89 seperate block groups which are treated within 4km from 2015 wildfire. 
//
// gen treat_exclusive_2015_4 = 0 
// replace treat_exclusive_2015_4 = 1 if (treated_2005_sim4 == 0 & treated_2006_sim4 == 0 & treated_2007_sim4 == 0 & treated_2008_sim4 == 0 & treated_2009_sim4 == 0 & treated_2010_sim4 == 0 & treated_2011_sim4 == 0 & treated_2012_sim4 == 0 & treated_2013_sim4 == 0 & treated_2014_sim4 == 0) & (treated_2015_sim4 == 1)
//
// count if treat_exclusive_2015_4 == 1
//
// gen treat_exclusive4 = 0
// replace treat_exclusive4 = 1 if (time == 2 & treat_exclusive_2015_4 == 1)
//
// count if treat_exclusive4 == 1
// ***229 block groups treated in 2015 (real) between 4km and 20km 

eststo clear

// gen min_dist_2005_km = min_dist_2005_sim/1000
// gen min_dist_2006_km = min_dist_2006_sim/1000
// gen min_dist_2007_km = min_dist_2007_sim/1000
// gen min_dist_2008_km = min_dist_2008_sim/1000
// gen min_dist_2009_km = min_dist_2009_sim/1000
// gen min_dist_2010_km = min_dist_2010_sim/1000
// gen min_dist_2011_km = min_dist_2011_sim/1000
// gen min_dist_2012_km = min_dist_2012_sim/1000
// gen min_dist_2013_km = min_dist_2013_sim/1000
// gen min_dist_2014_km = min_dist_2014_sim/1000
// gen min_dist_2015_km = min_dist_2015_sim/1000
// gen min_dist_2016_km = min_dist_2016_sim/1000
// gen min_dist_2017_km = min_dist_2017_sim/1000
// gen min_dist_2018_km = min_dist_2018_sim/1000
gen average_mind_wildfire_sim_km = average_mind_wildfire_sim/1000

***SUM STATISTICS TABLE***

// label variable built_1 "Proportion Built 2000 or later"
// label variable built_2 "Proportion Built 1990 to 1999"
// label variable built_3 "Proportion Built 1980 to 1989"
// label variable built_4 "Proportion Built 1970 to 1979"
// label variable built_5 "Proportion Built 1960 to 1969"
// label variable built_6 "Proportion Built 1950 to 1959"
// label variable built_7 "Proportion Built 1940 to 1949"
// label variable built_8 "Proportion Built 1939 or earlier"

// label variable bdrm_1 "Proportion 1 bedroom"
// label variable bdrm_2 "Proportion 2 bedrooms"
// label variable bdrm_3 "Proportion 3 bedrooms"
// label variable bdrm_4 "Proportion 4 bedrooms"
// label variable bdrm_5 "Proportion 5 bedrooms"

// label variable mortag_1 "Proportion Housing With a Mortgage"
// label variable mortag_5 "Proportion Housing With No Mortgage"

label variable medval "Median Property Value"
label variable lnmedval "Natural Log Median Property Value"
label variable dmedval "Difference in Median Property Value"
label variable dlnmedval "Natural Log Difference in Median Property Value"

label variable average_mind_wildfire_sim_km "Average Minimum Distance to a Wildfire Perimeter"

eststo clear 

***estpost summarize medval lnmedval dmedval dlnmedval average_mind_wildfire_sim_km built_1 $built $bdrm mortag_1 mortag_5 $travel $race $educ

eststo clear 

estpost summarize medval lnmedval dmedval dlnmedval median_whp average_mind_wildfire_sim_km built_1 $built $bdrm mortag_1 mortag_5

esttab, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean) fmt(2)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) addnotes("""*All variables below `Average Minimum Distance to a Wildfire Perimeter`are in proportion terms of the block group (e.g. 1 bedroom is proportion of homes in the block group with one bedroom)") label title("Summary Statistics Property Value and Block Group Housing Characteristics") nonumber

esttab using tablesummstat_new.tex, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean) fmt(2)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) addnotes("""*All variables below `Average Minimum Distance to a Wildfire Perimeter`are in proportion terms of the block group (e.g. 1 bedroom is proportion of homes in the block group with one bedroom)") label title("Summary Statistics Property Value and Block Group Housing Characteristics") nonumber replace

eststo clear

***mean medval if min_dist_2015_sim <= 20000
******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

***END OF DO FILE***



