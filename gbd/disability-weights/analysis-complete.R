# Analysis

# Set up
setwd('~/Documents/info-498c/demos/gbd/disability-weights/')
library(dplyr)
library(tidyr)

# Load global data (disease burden in 2015, both sexes, all ages)
global.data <- read.csv('./data/prepped/global_burden.csv', stringsAsFactors = FALSE)

# Replace NA as 0 for deaths, ylls, ylds
# Thanks, SO: http://stackoverflow.com/questions/8161836/how-do-i-replace-na-values-with-zeros-in-an-r-dataframe
global.data[is.na(global.data)] <- 0

# What disease was responsible for the most burden (by each metric)?
most.dalys <- global.data %>% filter(dalys == max(dalys)) %>% select(cause)
most.deaths <- global.data %>% filter(deaths == max(deaths)) %>% select(cause)
most.ylls <- global.data %>% filter(ylls == max(ylls)) %>% select(cause)
most.ylds <- global.data %>% filter(ylds == max(ylds)) %>% select(cause)

# Using prevalence and YLDs, calculate inferred disability weights (not actual weights in the study)
global.data <- global.data %>% mutate(dw.computed = ylds/prevalence)

# See anything strange about the estimated disability weights?
max(global.data$dw.computed) # Qwirks about how the study manages "Other" diseases

# Which diseases have more YLDs than YLLs (and ylls > 0)?
more.disabling <- global.data %>% filter(ylds > ylls, ylls > 0)

# How many times higher is the prevalence than the number of deaths for these diseases?
more.disabling <- more.disabling %>% mutate(prev.death.ratio = prevalence/deaths)
hist(more.disabling$prev.death.ratio, breaks = 20, main='Distribution of prevalence/death ratios')

# Which disease has the most similar burden of YLLs and YLDs (where ylls > 0)?
most.similar <- global.data %>% mutate(yll.yld.diff = abs(ylls - ylds)) %>% 
                  filter(ylls>0) %>% 
                  filter(yll.yld.diff == min(yll.yld.diff))

# For the following section, keep only the cause names and disability weights
causes <- global.data %>% select(cause, dw.computed)

# For each cause, compute how many cases would have to have to be avoided to equal 65 YLLs
# (the equivalent of one death of a 25 year old)
causes <- causes %>% mutate(num.cases = 65/dw.computed)
View(causes)
