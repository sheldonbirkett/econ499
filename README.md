# econ499

Description of Code and Notebook Files Used in the Completion of this undergraduate thesis. All errors are my own.  

*ECON499_STATA_DO_REGRESSIONS_2005_2019_SHELDON_BIRKETT.do
  * Main .do file for creating regression tables and analysis, has OLS, FD, and OLD with WHP (Wildfire Hazard Potential) controls. 

*ECON499_STATA_DO_REGRESSIONS_SHELDON_BIRKETT.do
  *Older .do file for main analysis without 2005-2009 period data and no WHP.

*ECON499_Thesis_Presentation_Draft.pdf
  *Defence Presentation on April 20, 2021. 

*ECON_499_ACS_IPUMS_NHGIS_GeoMAC.ipynb
  *Basic Data Preparation for merging ACS dataframes and wildfire perimeters, includes CPI inflation adjustment factor for property values, and original varible codes, etc. 
  
*ECON_499_Sonoma_Napa_Zillow_Data.do
  *Code for Fall 2020 case study of Wallbridge, Hennessey, and Glass wildfires.
  *Stata .do file for OLS regressions in case study. 
  *Sonoma_Napa_Solano_County_2021_Property_Data.csv
    *Scrapped data, used the web application [Apify](https://apify.com/) for Zillow.com Sonoma, Napa, and Solano Counties California.
    *Note: Since Apify was used I did not expand on Zillow Web Scrapping .ipynb notebook.
  *Case Study Sonoma and Napa County.ipynb
    *Notebook for case study maps and distance figures, etc. 
  *Min_distances_Sonoma_Napa_Solano_Zillow.csv
    *Minimum distances to Wallbridge, Hennessey, and Glass wildfires for case study. 
  
*ECON_499_Thesis_Sheldon_Birkett_Final_Draft.zip
  *Thesis .tex files for paper, figures, and tables.
  
*Map_of_United_States_Wildfires.ipynb
  *Notebook for making map of wildfires in Western United States: Property Values by Census Block Groups. 
  
*Regression_Plots_ECON_499.ipynb
  *Sentivity Plots for 500meter distance cutoff values between 2km and 30km, 2km and 100km from Wildfire Perimeters. 
  *Also includes median block group property value trend graphs by 4km 2015 Ring (i.e. by main distance treatment). 
  
 *Test_Geo.ipynb
  *Main notebook for Great Circle Distance calculations from block groups to wildfire perimeters for all years between 2005 and 2018. 
  *Includes miscellaneous codes for original data description on February 1, 2021.
  *Note: This file is generally not as organized as the notebooks. 
  
 *Thesis_Poster_Sheldon_Birkett.pptx
  *Draft thesis poster: Last Updated on March 26, 2021. 
  
 *ECON499_DIFFNDIFF_REG.do
  *Attempt at Difference in Differences regression, did not use given data period constraints. 
  
 *ECON499_Census_Data_API.ipynb
  *Original code (outdated/didn't use) for getting ACS data through the Census API, but switched to IPUMS NHGIS to get ACS data since it was easier to extract data from. Census API had a bug which prevented me from extracting the relevant data. 
  
  
Cleaned ACS/Wildfire Perimeter dataset not posted on Github, please contact for replication inquiries. 
