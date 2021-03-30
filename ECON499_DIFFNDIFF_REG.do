****2005-2019 REGRESSIONS BY SHELDON BIRKETT***

clear 

import delimited "C:\Users\sheld\Documents\Thesis_Data_Full_United_States\merged_data_with_block_groups\ACS5_2005_2019_FULL_DATAFRAME_FOR_ANALYSIS_no_geo.csv"


gen treat2015 = 0
replace treat2015 = 1 if min_dist_2015_sim <= 4000

gen time2010_2014 = 0
replace time2010_2014 = 1 if year == "2010-2014"

gen time2015_2019 = 0
replace time2015_2019 = 1 if year == "2015-2019"


reg medval time2015_2019##treat2015, robust

reg medval time2015_2019##treat2015 time2010_2014##treat2015, robust

global race race_2 race_3 race_4 race_5 race_6 race_7 
global travel travel_2 travel_3 travel_4 travel_5 travel_6 travel_7 travel_8 travel_9 travel_10 travel_11 travel_12
global educ educ_2 educ_3 educ_4 educ_5 educ_6 educ_7 educ_8 educ_9 educ_10 educ_11 educ_12 educ_13 educ_14 educ_15 educ_16
global built built_2 built_3 built_4 built_5 built_6 built_7 built_8
global bdrm bdrm_1 bdrm_2 bdrm_3 bdrm_4 bdrm_5
global mortag mortag_3 mortag_4 mortag_5

***Difference in Differences 4km comparison to 20km or greater***

reg medval time2015_2019##treat2015 time2010_2014##treat2015, robust

reg medval time2015_2019##treat2015 time2010_2014##treat2015 $race $travel $educ $built $bdrm $mortag i.statea, robust

gen lnmedval = log(medval)

reg lnmedval time2015_2019##treat2015 time2010_2014##treat2015 $race $travel $educ $built $bdrm $mortag i.statea, robust

****Only consider observations within 4km and between 4km and 20km***

gen treated2015_4_20km = 0
replace treated2015_4_20km = 1 if min_dist_2015_sim > 4000 & min_dist_2015_sim <=20000

reg medval time2015_2019##treat2015 time2010_2014##treat2015 $race $travel $educ $built $bdrm $mortag i.statea if min_dist_2015_sim <= 20000, robust

reg lnmedval time2015_2019##treat2015 time2010_2014##treat2015 $race $travel $educ $built $bdrm $mortag i.statea if min_dist_2015_sim <= 20000, robust

***Generate Fire Controls For Pre Period***

forval i = 5(1)9{
    gen fire_200`i' = 0
	replace fire_200`i' = 1 if min_dist_200`i'_sim <= 4000
}

forval i = 10(1)14{
    gen fire_20`i' = 0
	replace fire_20`i' = 1 if min_dist_20`i'_sim <= 4000
}

global fire_pre fire_2005 fire_2006 fire_2007 fire_2008 fire_2009 fire_2010 fire_2011 fire_2012 fire_2013 fire_2014

reg medval time2015_2019##treat2015 time2010_2014##treat2015 $race $travel $educ $built $bdrm $mortag $fire_pre i.statea if min_dist_2015_sim <= 20000, robust

reg lnmedval time2015_2019##treat2015 time2010_2014##treat2015 $race $travel $educ $built $bdrm $mortag $fire_pre i.statea if min_dist_2015_sim <= 20000, robust


sort gisjoin year 

by gisjoin: gen dmedval = medval-medval[_n-1]

by gisjoin: gen dlnmedval = lnmedval-lnmedval[_n-1]

by gisjoin: gen dtreat2015 = treat2015-treat2015[_n-1]

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

gen time = 0
replace time = 1 if year == "2010-2014"
replace time = 2 if year == "2015-2019"

global drace drace_2 drace_3 drace_4 drace_5 drace_6 drace_7
global dtravel dtravel_2 dtravel_3 dtravel_4 dtravel_5 dtravel_6 dtravel_7 dtravel_8 dtravel_9 dtravel_10 dtravel_11 dtravel_12
global deduc deduc_2 deduc_3 deduc_4 deduc_5 deduc_6 deduc_7 deduc_8 deduc_9 deduc_10 deduc_11 deduc_12 deduc_13 deduc_14 deduc_15 deduc_16
global dbuilt dbuilt_2 dbuilt_3 dbuilt_4 dbuilt_5 dbuilt_6 dbuilt_7 dbuilt_8
global dbdrm dbdrm_1 dbdrm_2 dbdrm_3 dbdrm_4 dbdrm_5
global dmortag dmortag_3 dmortag_4 dmortag_5

reg dmedval treat2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)

reg dlnmedval treat2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)

reg dmedval treat2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag $fire_pre i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)

reg dlnmedval treat2015 $drace $dtravel $deduc $dbuilt $dbdrm $dmortag $fire_pre i.time if min_dist_2015_sim <= 20000, vce(cluster gisjoin)
