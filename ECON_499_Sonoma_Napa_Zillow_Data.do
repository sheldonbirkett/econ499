****ZILLOW DATA CASE STUDY ON GLASS, HENNESSSEY, AND WALLBRIDGE FIRES****

clear

eststo clear
**import delimited "C:\Users\sheld\Documents\GitHub\econ499\Sonoma_Napa_County_2021_Property_Data.csv"

import delimited "C:\Users\sheld\Documents\GitHub\econ499\Sonoma_Napa_Solano_County_2021_Property_Data.csv"

generate fire_4km = 0
replace fire_4km = 1 if min_dist_per <= 4000

generate fire_4_20km = 0
replace fire_4_20km = 1 if min_dist_per > 4000 & min_dist_per<= 20000

gen min_dist_per_km = min_dist_per/1000

gen lnprice = log(price)

label variable price "Price Sold"

label variable lnprice "Natural Log of Price Sold"

label variable min_dist_per_km "Minimum Distance to Wildfire Perimeter Km"

label variable baths "Number of Bathrooms"

label variable bdrm "Number of Bedrooms"

label variable lotsize_sqft "Lotsize Square Feet"

label variable sqft "Home Square Footage"

label variable built "Year Built"

label variable fire_4km "Within 4km from a Wildfire Perimeter"

label variable fire_4_20km "Within 4km and 20km from a Wildfire Perimeter"

eststo clear

estpost summarize price lnprice min_dist_per_km baths bdrm lotsize_sqft built sqft

esttab, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean) fmt(0)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) label title(Summary Statistics Single Family Homes Sonoma, Napa, and Solano County March 2021) nonumber

esttab using napa_solano_sonoma_sum_stat.tex, varwidth(50) modelwidth(10 20 10 10) cell((mean(label(Mean) fmt(0)) sd(label(Standard Deviation)) min(label(Min)) max(label(Max)))) label title(Summary Statistics Single Family Homes Sonoma, Napa, and Solano County March 2021) nonumber replace

eststo clear 

estpost tabulate fire_4km fire_4_20km

esttab, varwidth(10) modelwidth(10 10) unstack label title("Number of Homes Within 4km and 4km-20km Rings" ) nonumber

esttab using freq_sonoma_county.tex, varwidth(10) modelwidth(10 10) unstack label title("Number of Homes Within 4km and 4km-20km Rings" ) nonumber replace

global xlist i.baths i.bdrm lotsize_sqft i.built sqft

eststo clear

eststo: reg price fire_4km $xlist if min_dist_per <= 20000, vce(robust)

eststo: reg lnprice fire_4km $xlist if min_dist_per <= 20000, vce(robust)

*reg price fire_4km $xlist, vce(robust)

eststo: reg price min_dist_per $xlist, vce(robust)

eststo: reg lnprice min_dist_per $xlist, vce(robust)

esttab using sonoma_county_reg.tex, label title("OLS Regressions Within 4km from Wildfire Perimeter for Sonoma, Napa, and Solano County") scalars(r2) keep(fire_4km min_dist_per) replace


