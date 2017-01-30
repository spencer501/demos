# Analysis

# Set up
setwd('~/Code/info498c/demos/gbd/disability-weights/')
library(dplyr)
library(tidyr)

# Load global data (disease burden in 2015, both sexes, all ages)
global.data <- read.csv('./data/prepped/global_burden.csv', stringsAsFactors = FALSE)

# Replace NA as 0 for deaths, ylls, ylds
# Thanks, SO: http://stackoverflow.com/questions/8161836/how-do-i-replace-na-values-with-zeros-in-an-r-dataframe
global.data[is.na(global.data)] <- 0

# What disease was responsible for the most burden (by each metric)?
max.daly <- global.data %>%
    filter(dalys == max(dalys)) %>%
    select(cause)

max.deaths <- global.data %>%
    filter(deaths == max(deaths)) %>%
    select(cause)

max.yld <- global.data %>%
    filter(ylds == max(ylds)) %>%
    select(cause)

max.ylls <- global.data %>%
    filter(ylls == max(ylls)) %>%
    select(cause)



# Using prevalence and YLDs, calculate inferred disability weights (not actual weights in the study)
global.data <- global.data %>%
    mutate(disability.weights = ylds / prevalence)

# See anything strange about the estimated disability weights?


# Which diseases have more YLDs than YLLs (and ylls > 0)?
more.ylds.than.ylls <- global.data %>%
    filter(ylds < ylls && ylls > 0)

# How many timesgher is the prevalence than the number of deaths for these diseases?
more.ylds.than.ylls <- more.ylds.than.ylls %>%
    mutate(ratio = prevalence / deaths)

# Which disease has the most similar burden of YLLs and YLDs (where ylls > 0)?

# For the following section, keep only the cause names and disability weights


# For each cause, compute how many cases would have to have to be avoided to equal 65 YLLs
# (the equivalent of one death of a 25 year old)
