# ==================================
# Homework 3 - Code to get started
# 
# Melinda Higgins, PhD
# dated 09/12/2021
# ==================================

# ==================================
# we're be working with the SPSS formatted
# file - read in using haven package
# use helpmkh_set1_wide.sav for in class
# read in helpmkh_set2_wide.sav for the homework
# ==================================

library(tidyverse)
library(haven)

helpdat <- 
  haven::read_spss("helpmkh_set1_wide.sav")

# ============================================.
# Let's review the baseline variables
# overall and by treat group
#
# add other variables for homework
# ============================================.

h1 <- helpdat %>%
  select(treat, age, mcs, d1, 
         e2b, racegrp)

# get descriptive stats for a selection of vars
# using the summary() function
h1 %>%
  select(age, mcs, d1, e2b) %>%
  summary()

h1 %>%
  select(treat, age, mcs, d1, e2b) %>%
  filter(treat == 0) %>%
  summary()

h1 %>%
  select(treat, age, mcs, d1, e2b) %>%
  filter(treat == 1) %>%
  summary()

# get more stats with pastecs::stat.desc()
# add variables as needed for homework
library(pastecs)
h1 %>%
  select(age, mcs, d1, e2b) %>%
  pastecs::stat.desc()

# other options are these packages and functions
# Hmisc::describe()
# psych::describe()
library(Hmisc)
h1 %>%
  select(age, mcs, d1, e2b) %>%
  Hmisc::describe()

library(psych)
h1 %>%
  select(age, mcs, d1, e2b) %>%
  psych::describe()

# ==========================================
# ADD Code to check normality assumptions
# example for age
# base R code example
hist(h1$age, probability = T)
lines(density(h1$age), col=2)

# add QQ plot and reference line
qqnorm(h1$age)
qqline(h1$age)

# add shapiro-wilk normality test
shapiro.test(h1$age)

# example for the d1 (How many times hospitalized 
# for medical problems (lifetime)) question
# base R code example
hist(h1$d1, probability = T)
lines(density(h1$d1), col=2)

# add QQ plot and reference line
qqnorm(h1$d1)
qqline(h1$d1)

# add shapiro-wilk normality test
shapiro.test(h1$d1)

# ===================================

# get frequency tables for categorical vars
# add rest of variables for homework
table(h1$racegrp)

# can also use the CrossTable function
# from the gmodels package
# get frequencies and proportions
# by group and overall
# and get chi-square tests
# use the Pearson's Chi-square tests
# without the Yates continuity correction
#
# and you can also get the 
# Fisher's exact test if/as needed
library(gmodels)

gmodels::CrossTable(h1$racegrp, h1$treat,
                    expected=TRUE,
                    prop.r=FALSE,
                    prop.t=FALSE,
                    prop.chisq=FALSE,
                    chisq=TRUE,
                    fisher=TRUE)

# you can change this to SPSS format to see
# percents instead of proportions
# **NOTE: This also gives a WARNING if the 
# expected counts are too low.**
gmodels::CrossTable(h1$racegrp, h1$treat,
                    expected=TRUE,
                    prop.r=FALSE,
                    prop.t=FALSE,
                    prop.chisq=FALSE,
                    chisq=TRUE,
                    fisher=TRUE,
                    format = "SPSS")

# run homogenity of variance tests
# for the t-tests to see if you need
# pooled or unpooled t-tests
# if Barlett's not significant - run pooled t.tests
# set var.equal=TRUE
# if Barlett's is significant - run unpooled t.tests
# set var.equal=FALSE
# run for rest of variables for homework
bartlett.test(age ~ treat, data=h1)
t.test(age ~ treat, h1, var.equal=TRUE)

bartlett.test(mcs ~ treat, data=h1)
t.test(mcs ~ treat, h1, var.equal=TRUE)

# run Mann Whitney/Wilcoxon non-parametric tests
wilcox.test(d1 ~ treat, h1)
wilcox.test(e2b ~ treat, h1)



