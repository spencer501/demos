# Calculate survey weighted estimates

# Set up
setwd('~/Code/info498c/demos/nhanes-analysis/')
# library(foreign)
library(survey)
library(dplyr)
library(Hmisc)

# Load demographic data, which includes survey weights
demographics <- sasxport.get('./data/DEMO_H.XPT')

# Load alcohol use data
alcohol <- sasxport.get('./data/ALQ_H.XPT')

# Merge alcohol and demographic data
nhanes <- left_join(alcohol, demographics, by='seqn')

# Take the sum of the weighting column `wtint2yr` - what is this number?
sum(nhanes['wtint2yr']) # This represents the population size

# Create a survey design that indicates the id, strata, and weights
nhanes.survey <- svydesign(id = ~nhanes$seqn,
                           strata = ~nhanes$sdmvstra,
                           weight = ~nhanes$wtint2yr)

# Using the codebook, find the question that asks about 12+ drinks in the last year
# alq101

# Using the `table` function get a table of 12+ drinks in the last year responses
table(nhanes$alq101)

# Using the `prop.table` function, get the proportions of each response
prop.table(table(nhanes$alq101))

# Using the `svytable` function, compute the survey weighted responses to the same question
svytable(~nhanes$alq101, design=nhanes.survey)

# Using `prop.table` in conjunction with `svytable`, compute the survey weighted proportions
prop.table(svytable(~nhanes$alq101, design=nhanes.survey))
