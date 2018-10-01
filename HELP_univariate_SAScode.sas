* ==========================================;
* N736 Lesson 07 - by Melinda Higgins, PhD
* last updated 09/26/2018
*
* Univariate Stats
* working with the HELP dataset
* ==========================================;

* create a library - change to your directory
* where you have downloaded the help.sas7bdat dataset;
LIBNAME L7 'C:\MyGithub\N736_lesson_Univariate';

* =========================================
* apply FORMATS
* =========================================;

proc format library = WORK ;
   value TREAT
      0 = 'usual care'  
      1 = 'HELP clinic' ;
   value FEMALE
      0 = 'Male'  
      1 = 'Female' ;
   value HOMELESS
      0 = 'no'  
      1 = 'yes' ;
   value G1B
      0 = 'no'  
      1 = 'yes' ;
   value F1A
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1B
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1C
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1D
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1E
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1F
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1G
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1H
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1I
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1J
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1K
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1L
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1M
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1N
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1O
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1P
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1Q
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1R
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1S
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1T
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value SATREAT
      0 = 'no'  
      1 = 'yes' ;
   value DRINKSTATUS
      0 = 'no'  
      1 = 'yes' ;
   value ANYSUBSTATUS
      0 = 'no'  
      1 = 'yes' ;
   value LINKSTATUS
      0 = 'no'  
      1 = 'yes' ;

proc datasets library = WORK;
modify helpmkh / correctencoding="WLATIN1";
   format     treat TREAT.;
   format    female FEMALE.;
   format  homeless HOMELESS.;
   format       g1b G1B.;
   format       f1a F1A.;
   format       f1b F1B.;
   format       f1c F1C.;
   format       f1d F1D.;
   format       f1e F1E.;
   format       f1f F1F.;
   format       f1g F1G.;
   format       f1h F1H.;
   format       f1i F1I.;
   format       f1j F1J.;
   format       f1k F1K.;
   format       f1l F1L.;
   format       f1m F1M.;
   format       f1n F1N.;
   format       f1o F1O.;
   format       f1p F1P.;
   format       f1q F1Q.;
   format       f1r F1R.;
   format       f1s F1S.;
   format       f1t F1T.;
   format   satreat SATREAT.;
   format drinkstatus DRINKSTATUS.;
   format anysubstatus ANYSUBSTATUS.;
   format linkstatus LINKSTATUS.;
quit;

* make a copy in the WORK library;
DATA work.help;
  SET L7.helpmkh;
  RUN;

proc contents data=help; run;

* get univariate stats;
proc univariate data=help plots;
  var age;
  run;

* OPTIONAL - pay attention to options
* can change the percentile algorithm
* default is PCTLDEF=5, but there are
* options 1,2,3,4 or 5 - see help for more details;

proc univariate data=help plots pctldef=1;
  var age;
  run;

* try algorithm 3;
  proc univariate data=help plots pctldef=3;
  var age;
  run;

* get univariate stats
* add histogram
* and overlay normal curve
* and get normal probability tests;

proc univariate data=help plots pctldef=1;
  var age;
  histogram age / normal;
  run;

* get other probability plots;

proc univariate data=help plots pctldef=1;
  var age;
  ppplot age;
  probplot age;
  qqplot age;
  run;

* some plots - boxplot;
* to get a boxplot of 1 variable
* we have to create a dummy variable
* that is a constant, x=1, then we can use
* this variable to trick SAS into making 1 boxplot;

data help2;
  set help;
  x=1;
  run;

proc boxplot data=help2;
  plot age*x;
  run;

* boxplot of age by racegrp
* using proc sgplot and VBOX option;

PROC SGPLOT DATA=help;
  VBOX age / category = racegrp;
RUN;

* can change the percentile method if you want;

PROC SGPLOT DATA=help;
  VBOX age / category = racegrp percentile=3;
RUN;

* other summaries;

proc means data=help;
  var age;
  run;

* ages by race;

proc means data=help;
  var age;
  class racegrp;
  run;

proc means data=help;
  var age;
  class treat;
  run;

* categorical data;

proc freq data=help;
  tables racegrp / plots=freqplot;
  run;

* without the formats applied;

proc freq data=help;
  tables f1a / plots=freqplot;
  run;

* get percents by treatment group;

proc freq data=help;
  tables racegrp * treat / chisq;
  run;

* apply formats;
* SKIP;
proc freq data=help;
  tables f1a / plots=freqplot;
  FORMAT f1a F1A.;
  run;

