* Encoding: UTF-8.
* ============================================.
* SPSS SYNATX
*
* Bivariate Stats.
* by Melinda Higgins, PhD
* dated 10/01/2018
* ============================================.

* REMEMBER - Change the directory to where
* the data is on your computer.

GET 
  FILE='C:\MyGithub\N736_lesson_Bivariate\helpmkh.sav'. 
DATASET NAME DataSet1 WINDOW=FRONT.

* Get summary stats by group.
* look at a few measures by gender.
* SPLIT option.

SORT CASES  BY female.
SPLIT FILE LAYERED BY female.

FREQUENCIES VARIABLES=age cesd pcs mcs
  /FORMAT=NOTABLE
  /NTILES=4
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN
  /ORDER=ANALYSIS.

SPLIT FILE OFF.

* could also use EXPLORE.

EXAMINE VARIABLES=age cesd pcs mcs BY female
  /PLOT NONE
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING PAIRWISE
  /NOTOTAL.

* look at correlations.
* look at Pearson's (parametric)
* Spearman's Rho (and even Kendall's Tau)
* for non-parametrics.

CORRELATIONS
  /VARIABLES=age cesd pcs mcs
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
NONPAR CORR
  /VARIABLES=age cesd pcs mcs
  /PRINT=BOTH TWOTAIL NOSIG
  /MISSING=PAIRWISE.

* scatterplot matrix.

GRAPH
  /SCATTERPLOT(MATRIX)=age cesd pcs mcs
  /MISSING=VARIABLEWISE.

* for 2-groups (coded 0,1)
* can look at "correlation"
* compare to t-tests (pooled).

CORRELATIONS
  /VARIABLES=female age cesd
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

* t-test of Age and cesd by gender.
* compare p-values of pooled
* tests results.

T-TEST GROUPS=female(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=age cesd
  /CRITERIA=CI(.95).

* non-parametric 2-group tests.

NPAR TESTS
  /M-W= age cesd BY female(0 1)
  /STATISTICS=DESCRIPTIVES QUARTILES
  /MISSING ANALYSIS.

* categorical-categorical.
* chi-square tests
* and Fisher's exact tests.

CROSSTABS
  /TABLES=female BY racegrp
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED COLUMN 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

* optional - add
* clustered barcharts of counts.

CROSSTABS
  /TABLES=female BY racegrp
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED COLUMN 
  /COUNT ROUND CELL
  /BARCHART
  /METHOD=EXACT TIMER(5).
