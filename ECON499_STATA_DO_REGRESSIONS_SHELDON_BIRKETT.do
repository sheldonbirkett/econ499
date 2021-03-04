******REGRESSIONS FOR ECON 499 THESIS: BY SHELDON BIRKETT*******

clear

import delimited "C:\Users\sheld\Documents\GitHub\econ499\ACS5_2014_2019_STATA.csv"

describe
****RELABLE ALL VARIABLES USING THE NHGIS LABELS*****

label variable aluce001 "Total_Race"
label variable aluce002 "White alone"
label variable aluce003 "Black or African American alone"
label variable aluce004 "American Indian and Alaska Native alone"
label variable aluce005 "Asian alone"
label variable aluce006 "Native Hawaiian and Other Pacific Islander alone"
label variable aluce007 "Some other race alone"
label variable aluce008 "Two or more races"
label variable alu3e001 "Total Travel Time to Work"
label variable alu3e002 "Less than 5 minutes"
label variable alu3e003 "5 to 9 minutes"
label variable alu3e004 "10 to 14 minutes"
label variable alu3e005 "15 to 19 minutes"
label variable alu3e006 "20 to 24 minutes"
label variable alu3e007 "25 to 29 minutes"
label variable alu3e008 "30 to 34 minutes"
label variable alu3e009 "35 to 39 minutes"
label variable alu3e010 "40 to 44 minutes"
label variable alu3e011 "45 to 59 minutes"
label variable alu3e012 "60 to 89 minutes"
label variable alu3e013 "90 or more minutes"
label variable alwge001 "Total Educational Attainment "
label variable alwge002 "No schooling completed"
label variable alwge003 " Nursery school"
label variable alwge004 "Kindergarten"
label variable alwge005 "1st grade"
label variable alwge006 "2nd grade"
label variable alwge007 "3rd grade"
label variable alwge008 "4th grade"
label variable alwge009 "5th grade"
label variable alwge010 "6th grade"
label variable alwge011 "7th grade"
label variable alwge012 "8th grade"
label variable alwge013 "9th grade"
label variable alwge014 "10th grade"
label variable alwge015 "11th grade"
label variable alwge016 "12th grade, no diploma"
label variable alwge017 "Regular high school diploma"
label variable alwge018 "GED or alternative credential"
label variable alwge019 "Some college, less than 1 year"
label variable alwge020 " Some college, 1 or more years, no degree"
label variable alwge021 "Associate's degree"
label variable alwge022 "Bachelor's degree"
label variable alwge023 "Master's degree"
label variable alwge024 "Professional school degree"
label variable alwge025 "Doctorate degree"
label variable al0de001 "Total Year Structure Built"
label variable al0de003_a "Built 2010 or later"
label variable al0de004 "Built 2000 to 2009"
label variable al0de005 "Built 1990 to 1999"
label variable al0de006 "Built 1980 to 1989"
label variable al0de007 "Built 1970 to 1979"
label variable al0de008 "Built 1960 to 1969"
label variable al0de009 "Built 1950 to 1959"
label variable al0de010 "Built 1940 to 1949"
label variable al0de011 "Built 1939 or earlier"
label variable al0ke001 "Total Bedrooms "
label variable al0ke002 "No bedroom"
label variable al0ke003 "1 bedroom"
label variable al0ke004 "2 bedroom"
label variable al0ke005 "3 bedroom"
label variable al0ke006 "4 bedroom"
label variable al0ke007 "5 or more bedrooms"
label variable al05e001 "Median Gross Rent (2019 Dollars)"
label variable al1ge001 "Lower Property Value Quartile (2019 Dollars)"
label variable al1he001 "Median Property Value (2019 Dollars)"
label variable al1ie001 "Upper Property Value Quartile (2019 Dollars)"
label variable al1le001 "Total Mortgage Status"
label variable al1le004 "Housing units with a mortgage, contract to purchase, or similar debt: With eithe"
label variable al1le005 "Housing units with a mortgage, contract to purchase, or similar debt: With eithe"
label variable al1le006 "Housing units with a mortgage, contract to purchase, or similar debt: Both secon"
label variable al1le007 "Housing units with a mortgage, contract to purchase, or similar debt: No second "
label variable al1le008 "Housing units without a mortgage"
label variable intptlat "House Location Latitude (Block Group Centre)"
label variable intptlon "House Location Longitude (Block Group Centre)"
label variable min_dist_2010_box "Minimum Distance to 2010 Wildfire Box Polygon"
label variable min_dist_2011_box "Minimum Distance to 2011 Wildfire Box Polygon"
label variable min_dist_2010_box "Minimum Distance to 2010 Wildfire Box Polygon (Meters)"
label variable min_dist_2011_box "Minimum Distance to 2011 Wildfire Box Polygon (Meters)"
label variable min_dist_2012_box "Minimum Distance to 2012 Wildfire Box Polygon (Meters)"
label variable min_dist_2013_box "Minimum Distance to 2013 Wildfire Box Polygon (Meters)"
label variable min_dist_2014_box "Minimum Distance to 2014 Wildfire Box Polygon (Meters)"
label variable min_dist_2015_box "Minimum Distance to 2015 Wildfire Box Polygon (Meters)"
label variable min_dist_2016_box "Minimum Distance to 2016 Wildfire Box Polygon (Meters)"
label variable min_dist_2017_box "Minimum Distance to 2017 Wildfire Box Polygon (Meters)"
label variable min_dist_2018_box "Minimum Distance to 2018 Wildfire Box Polygon (Meters)"
label variable min_dist_2010_sim "Minimum Distance to 2010 Wildfire Simplify Polygon (Meters)"
label variable min_dist_2011_sim "Minimum Distance to 2011 Wildfire Simplify Polygon (Meters)"
label variable min_dist_2012_sim "Minimum Distance to 2012 Wildfire Simplify Polygon (Meters)"
label variable min_dist_2013_sim "Minimum Distance to 2013 Wildfire Simplify Polygon (Meters)"
label variable min_dist_2014_sim "Minimum Distance to 2014 Wildfire Simplify Polygon (Meters)"
label variable min_dist_2015_sim "Minimum Distance to 2015 Wildfire Simplify Polygon (Meters)"
label variable min_dist_2016_sim "Minimum Distance to 2016 Wildfire Simplify Polygon (Meters)"
label variable min_dist_2017_sim "Minimum Distance to 2017 Wildfire Simplify Polygon (Meters)"
label variable min_dist_2018_sim "Minimum Distance to 2018 Wildfire Simplify Polygon (Meters)"
label variable index "index"

****GENERATE DUMMY VARIABLES FOR MIN DISTANCE TO WILDFIRE VARIABLES - This is the cuttoff for treatment/control. I will be usings 3.22km (3220m) (as specified by Loomis 2004)****

generate treated_2010_box = 0 
replace treated_2010_box = 1 if min_dist_2010_box <= 3220
generate treated_2011_box = 0 
replace treated_2011_box = 1 if min_dist_2011_box <= 3220
generate treated_2012_box = 0
replace treated_2012_box = 1 if min_dist_2012_box <= 3220
generate treated_2013_box = 0 
replace treated_2013_box = 1 if min_dist_2013_box <= 3220
generate treated_2014_box = 0 
replace treated_2014_box = 1 if min_dist_2014_box <= 3220
generate treated_2015_box = 0 
replace treated_2015_box = 1 if min_dist_2015_box <= 3220 
generate treated_2016_box = 0
replace treated_2016_box = 1 if min_dist_2016_box <= 3220 
generate treated_2017_box = 0
replace treated_2017_box = 1 if min_dist_2017_box <= 3220
generate treated_2018_box = 0 
replace treated_2018_box = 1 if min_dist_2018_box <= 3220 

generate treated_2010_sim = 0 
replace treated_2010_sim = 1 if min_dist_2010_sim <= 3220
generate treated_2011_sim = 0 
replace treated_2011_sim = 1 if min_dist_2011_sim <= 3220
generate treated_2012_sim = 0
replace treated_2012_sim = 1 if min_dist_2012_sim <= 3220 
generate treated_2013_sim = 0 
replace treated_2013_sim = 1 if min_dist_2013_sim <= 3220 
generate treated_2014_sim = 0
replace treated_2014_sim = 1 if min_dist_2014_sim <= 3220
generate treated_2015_sim = 0 
replace treated_2015_sim = 1 if min_dist_2015_sim <= 3220 
generate treated_2016_sim = 0 
replace treated_2016_sim = 1 if min_dist_2016_sim <= 3220 
generate treated_2017_sim = 0 
replace treated_2017_sim = 1 if min_dist_2017_sim <= 3220 
generate treated_2018_sim = 0 
replace treated_2018_sim = 1 if min_dist_2018_sim <= 3220 

generate time = 0
replace time = 1 if year == "2015-2019"

****SUMMARY STATISTICS****

****egen average_travel_time = rowmean(alu3e002 alu3e003 alu3e004 alu3e005 alu3e006 alu3e007 alu3e008 alu3e009 alu3e010 alu3e011 alu3e012 alu3e013)****

****Note removed alwge002 "No schooling completed" option not included as this is just a measure of some education completed****

****egen average_education_attain = rowmean(alwge003 alwge004 alwge005 alwge006 alwge007 alwge008 alwge009 alwge010 alwge011 alwge012 alwge013 alwge014 alwge015 alwge016 alwge017 alwge018 alwge019 alwge020 alwge021 alwge022 alwge023 alwge024 alwge025)****

*one start ===> summ stat controls 

*egen total_post_secondary = rowtotal(alwge021 alwge022 alwge023 alwge024 alwge025)

*label variable total_post_secondary "Percent Completed an Associate's, Bachelor's, Master's, or Doctoral Degree and Professional school degree"

*egen high_school_or_greater = rowtotal(alwge017 alwge018 alwge019 alwge020 alwge021 alwge022 alwge023 alwge024 alwge025)

*label variable high_school_or_greater "Percent Completed High School or Higher Education"



****egen average_year_struc_built = rowmean(al0de003_a al0de004 al0de005 al0de006 al0de007 al0de008 al0de009 al0de010 al0de011)****

****Note average_number_bedrooms does not include no bed category****

*egen total_number_bedrooms = rowtotal(al0ke003 al0ke004 al0ke005 al0ke006 al0ke007)

*label variable total_number_bedrooms "Percent of Homes with Bedrooms"


****Note this variable is average across homes with mortgage categories, al1le008 "Housing units without a mortgage" is percent of housing units without a mortgage****

*egen total_house_w_mortgage = rowtotal(al1le004 al1le005 al1le006 al1le007)

*label variable total_house_w_mortgage 

egen average_mind_wildfire_box = rowmean(min_dist_2010_box min_dist_2011_box min_dist_2012_box min_dist_2013_box min_dist_2014_box min_dist_2015_box min_dist_2016_box min_dist_2017_box min_dist_2018_box)

egen average_mind_wildfire_sim = rowmean(min_dist_2010_sim min_dist_2011_sim min_dist_2012_sim min_dist_2013_sim min_dist_2014_sim min_dist_2015_sim min_dist_2016_sim min_dist_2017_sim min_dist_2018_sim)

label variable average_mind_wildfire_box "Average Min Distance to a Wildfire (2010-2018) Box Polygons"
label variable average_mind_wildfire_sim "Average Min Distance to a Wildfire (2010-2018) Simplify Polygons"

****Descriptive Statistics Table (Main Variables)****

estpost summarize al1he001 al1ge001 al1ie001 al05e001 average_mind_wildfire_box average_mind_wildfire_sim

esttab, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) label title(Table 1. Summary Statistics) nonumber

esttab using tablesummstat.tex, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) label title(Table 1. Summary Statistics) nonumber replace


rename (aluce001 aluce002 aluce003 aluce004 aluce005 aluce006 aluce007 aluce008)(t_race white_a black_a native_a asian_a hawaiian_a other_a t_races)

rename (alu3e001 alu3e002 alu3e003 alu3e004 alu3e005 alu3e006 alu3e007 alu3e008)(t_travel travel1 travel5 travel10 travel15 travel20 travel25 travel30)

rename (alu3e009 alu3e010 alu3e011 alu3e012 alu3e013)(travel35 travel40 travel45 travel60 travel90)

rename (alwge001 alwge002 alwge003 alwge004 alwge005 alwge006 alwge007 alwge008 alwge009 alwge010 alwge011 alwge012 alwge013 alwge014)(t_educ educ1 educ2 educ3 educ4 educ5 educ6 educ7 educ8 educ9 educ10 educ11 educ12 educ13)

rename (alwge015 alwge016 alwge017 alwge018 alwge019 alwge020 alwge021 alwge022 alwge023 alwge024 alwge025)(educ14 educ15 educ16 educ17 educ18 educ19 educ20 educ21 educ22 educ23 educ24)

rename (al0de001 al0de003_a al0de004 al0de005 al0de006 al0de007 al0de008 al0de009 al0de010 al0de011)(t_built built2010 built2000 built1990 built1980 built1970 built1960 built1950 built1940 built1939)

rename (al0ke001 al0ke002 al0ke003 al0ke004 al0ke005 al0ke006 al0ke007)(t_bdrm bdrmn bdrm1 bdrm2 bdrm3 bdrm4 bdrm5)

rename (al05e001 al1ge001 al1he001 al1ie001)(rentg valuelq valuem valueuq)

rename (al1le001 al1le004 al1le005 al1le006 al1le007 al1le008)(t_mortag mortag1 mortag2 mortag3 mortag4 mortagno)



****REGRESSIONS****

***To start use 2015 wildfire season only***

// reg valuem time##treated_2015_sim
//
//
// diff valuem, t(treated_2015_sim) p(time)

****For Loop To Look A Sensitivity of Betas****

*summarize min_dist_2010_sim min_dist_2011_sim min_dist_2012_sim min_dist_2013_sim min_dist_2014_sim min_dist_2015_sim min_dist_2016_sim min_dist_2017_sim min_dist_2018_sim 

*summarize min_dist_2015_sim

**118.6873   627027.1 - 2015 min/max distances in meters**

****Generate Dummies for Cutoff Values for 2015****

/*forval i = 2000(500)26000{
	generate treated_2015_`i' = 0
	replace treated_2015_`i' = 1 if min_dist_2015_sim <= `i'
	}

****Code to Generate Coefficients and 95% CI for Sensitivity Graph****

local xlsrow = 2
putexcel set betaresult, replace sheet("Betas1")
putexcel A1=("Betas")
putexcel B1=("Cutoff_Value")
putexcel C1=("Lower_Bound_CI")
putexcel D1=("Upper_Bound_CI")
forval i = 2000(500)26000{
	reg valuem time##treated_2015_`i'
	scalar b`i'= _b[1.time#1.treated_2015_`i']
	scalar lb_cons`i' = _b[1.time#1.treated_2015_`i'] - invttail(e(df_r),0.025)*_se[1.time#1.treated_2015_`i']
	scalar ub_cons`i' = _b[1.time#1.treated_2015_`i'] + invttail(e(df_r),0.025)*_se[1.time#1.treated_2015_`i']
	display b`i'
	putexcel A`xlsrow' = (b`i')
	putexcel B`xlsrow' = (`i')
	putexcel C`xlsrow' = (lb_cons`i')
	putexcel D`xlsrow' = (ub_cons`i')
	local xlsrow = `xlsrow'+1
	}*/

****MAKE DUMMIES TO IDENTIFY TREATMENT AND CONTROL GROUPS****

***Drop Observations Treated in the First Period***
// gen per1treated = 0 
// replace per1treated = 1 if min_dist_2010_sim <= 3220 | min_dist_2011_sim <= 3220 | min_dist_2012_sim <= 3220 | min_dist_2013_sim <= 3220 | min_dist_2014_sim <= 3220
//
// drop if per1treated == 1

***Generate Treated Group Dummy Variable***

// gen treated = 0 
// replace treated = 1 if min_dist_2010_sim > 3220 & min_dist_2011_sim > 3220 & min_dist_2012_sim > 3220 & min_dist_2013_sim > 3220 & min_dist_2014_sim > 3220 & min_dist_2015_sim <= 3220 & min_dist_2016_sim <= 3220 & min_dist_2017_sim <= 3220 & min_dist_2018_sim <= 3220
*This didn't work - None in treated
****CONTROL GREATER THAN 3.22KM AWAY FROM A WILDFIRE IN BOTH PERIODS****
****TREATMENT GROUP WAS NOT EFFECTED BY WILDFIRE IN PERIOD 0, BUT EFFECTED BY WILDFIRE IN PERIOD 1****

gen post_fire = 0
replace post_fire = 1 if treated_2010_sim == 1 | treated_2011_sim == 1 | treated_2012_sim == 1 | treated_2013_sim == 1 | treated_2014_sim == 1 | treated_2015_sim == 1 | treated_2016_sim == 1 | treated_2017_sim == 1 | treated_2018_sim == 1

label variable post_fire "Block Group Close to Wildfire"

***REGRESSIONS OLS***

global race white_a black_a native_a asian_a hawaiian_a other_a t_races
global travel travel1 travel5 travel10 travel15 travel20 travel25 travel30 travel35 travel40 travel45 travel60 travel90
global educ educ1 educ2 educ3 educ4 educ5 educ6 educ7 educ8 educ9 educ10 educ11 educ12 educ13 educ14 educ15 educ16 educ17 educ18 educ19 educ20 educ21 educ22 educ23 educ24 
global built built2010 built2000 built1990 built1980 built1970 built1960 built1950 built1940 built1939
global bedrom bdrmn bdrm1 bdrm2 bdrm3 bdrm4 bdrm5
global mortag mortag1 mortag2 mortag3 mortag4 mortagno

eststo: reg valuem post_fire

eststo: reg valuem post_fire $bedrom $built $travel $race $educ $mortag i.time i.statea

eststo: reg valuelq post_fire 

eststo: reg valuelq post_fire $bedrom $built $travel $race $educ $mortag i.time i.statea

eststo: reg valueuq post_fire

eststo: reg valueuq post_fire $bedrom $built $travel $race $educ $mortag i.time i.statea

// gen lnvaluem = log(valuem)
// gen lnvaluelq = log(valuelq)
// gen lnvalueuq = log(valueuq)

eststo: reg lnvaluem post_fire $bedrom $built $travel $race $educ $mortag i.time i.statea

eststo: reg lnvaluelq post_fire $bedrom $built $travel $race $educ $mortag i.time i.statea

eststo: reg lnvalueuq post_fire $bedrom $built $travel $race $educ $mortag i.time i.statea



***Cuttoff Betas For OLS Regresssion 

forval j = 0(1)8{
forval i = 2000(500)30000{
	generate treated_201`j'_`i' = 0
	replace treated_201`j'_`i' = 1 if min_dist_201`j'_sim <= `i'
	}
}

forval j = 0(1)8{
local xlsrow = 2
putexcel set betaresult`j', replace sheet("Betas1")
putexcel A1=("Betas")
putexcel B1=("Cutoff_Value")
putexcel C1=("Lower_Bound_CI")
putexcel D1=("Upper_Bound_CI")
forval i = 2000(500)30000{
	reg valuem treated_201`j'_`i' $bedrom $built $travel $race $educ $mortag i.time i.statea
	scalar b`i'= _b[treated_201`j'_`i']
	scalar lb_cons`i' = _b[treated_201`j'_`i'] - invttail(e(df_r),0.025)*_se[treated_201`j'_`i']
	scalar ub_cons`i' = _b[treated_201`j'_`i'] + invttail(e(df_r),0.025)*_se[treated_201`j'_`i']
	display b`i'
	putexcel A`xlsrow' = (b`i')
	putexcel B`xlsrow' = (`i')
	putexcel C`xlsrow' = (lb_cons`i')
	putexcel D`xlsrow' = (ub_cons`i')
	local xlsrow = `xlsrow'+1
	}
}

****Regress on Actual Distance (Meters)****

forval i = 0(1)8{
	reg valuem min_dist_201`i'_sim
}

forval i = 0(1)8{
	reg valuem min_dist_201`i'_sim $bedrom $built $travel $race $educ $mortag i.time i.statea
	}
	
reg valuem average_mind_wildfire_sim

reg valuem average_mind_wildfire_sim $bedrom $built $travel $race $educ $mortag i.time i.statea

**reg lnvaluem average_mind_wildfire_sim

**reg lnvaluem average_mind_wildfire_sim $bedrom $built $travel $race $educ $mortag i.time i.statea

****Make Regression Tables****

eststo: reg valuem post_fire $bedrom $built $travel $race $educ $mortag i.time i.statea

estadd local fe Yes

eststo: reg lnvaluem post_fire $bedrom $built $travel $race $educ $mortag i.time i.statea

eststo: reg valuem average_mind_wildfire_sim $bedrom $built $travel $race $educ $mortag i.time i.statea

eststo: reg lnvaluem average_mind_wildfire_sim $bedrom $built $travel $race $educ $mortag i.time i.statea

eststo: reg valuem post_fire $bedrom $built $travel $race $educ $mortag

eststo: reg lnvaluem post_fire $bedrom $built $travel $race $educ $mortag 

// esttab, label title(OLS Linear & Log Dependent Variable Regressions) scalars(r2) eform keep(post_fire average_mind_wildfire_sim)

esttab, label title(OLS Linear & Log Dependent Variable Regressions) scalars(r2) keep(post_fire average_mind_wildfire_sim)

*scalars(r2) eform keep(post_fire) 

esttab, label beta title(OLS Linear & Log Dependent Variable Regressions) scalars(r2) eform keep(post_fire average_mind_wildfire_sim) 

esttab using regresssions_1.tex, label title(OLS Linear & Log Dependent Variable Regressions table\label{tab2})
*esttab a b, ci ar2 eform keep(age smoke)


