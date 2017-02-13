# Prep data

# Set up
setwd('~/Documents/info-498c/demos/nhanes/')
library(foreign)
library(survey)
library(dplyr)
library(Hmisc)

# Load demographic data, which includes survey weights
demographics <- sasxport.get('./data/raw/DEMO_H.XPT')

# Load physical activity data
activity <- sasxport.get('./data/raw/PAQ_H.XPT')

# Load smoking data
smoking <- sasxport.get('./data/raw/SMQ_H.XPT')

# Merge data
nhanes <- left_join(activity, demographics, by='seqn')

nhanes %>% 
  select(riagendr, ridageyr, seqn, paq605, paq610, paq640) %>% 
  View()
