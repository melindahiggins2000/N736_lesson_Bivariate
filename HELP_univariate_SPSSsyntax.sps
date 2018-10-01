* Encoding: UTF-8.
* ========================================
* N736 - Univariate Stats
*
* Melinda Higgins, PhD
* updated 09/26/2018
* ========================================.

* Analyze/Descriptive Statistics/Frequencies
* Useful for getting manu descriptive stats
* and get frequencies and histograms.

FREQUENCIES VARIABLES=age pcs mcs cesd
  /NTILES=4
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN
  /HISTOGRAM
  /ORDER=ANALYSIS.

* Analyze/Descriptive Statistics/Descriptives
* Useful for getting basic descriptive stats  
* and compute Z-scores if needed.

DESCRIPTIVES VARIABLES=age pcs mcs cesd
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX.

* Analyze/Descriptive Statistics/Explore
* also get descriptive stats
* can get confidence intervals
* also normal probability plots
* and tests for normality.

EXAMINE VARIABLES=age pcs mcs cesd
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING PAIRWISE
  /NOTOTAL.

* easy to add a group variable to the EXPLORE
* EXAMINE procedure to get stats by group.

EXAMINE VARIABLES=age pcs mcs cesd BY treat
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING PAIRWISE
  /NOTOTAL.

* for the other SPSS procedures
* FREQUENCIES and DESCRIPTIVES
* you need to first - SPLIT the data
* then run the procedure
* and REMEMBER to turn the SPLIT off.

* SPLIT applied to run FREQUENCIES.

SORT CASES  BY treat.
SPLIT FILE LAYERED BY treat.

FREQUENCIES VARIABLES=age pcs mcs cesd
  /NTILES=4
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN
  /HISTOGRAM
  /ORDER=ANALYSIS.

SPLIT FILE OFF.

* SPLIT applied to run DESCRIPTIVES.

SORT CASES  BY treat.
SPLIT FILE LAYERED BY treat.

DESCRIPTIVES VARIABLES=age pcs mcs cesd
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX.

SPLIT FILE OFF.

* Categorical and Ordinal Data
* use CROSSTABs to get frequencies
* by Group.

* Basic counts.

CROSSTABS
  /TABLES=female racegrp homeless f1a BY treat
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

* add percentages within Columns.

CROSSTABS
  /TABLES=female racegrp homeless f1a BY treat
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

* add chi-square tests and 
* fisher's exact tests if needed (2-x-2 tables).

CROSSTABS
  /TABLES=female racegrp homeless f1a BY treat
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.
