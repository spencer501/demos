# Prep data

# Set up
library(tidyr)
library(dplyr)
setwd('~/Documents/info-498c/demos/gbd/hale/')

# Load data
hale <- read.csv('./data/raw/hale.csv', stringsAsFactors = FALSE) %>% rename(hale = val) %>% select(-location_name)
life.expectancy <- read.csv('./data/raw/life-expectancy.csv', stringsAsFactors = FALSE) %>% rename(le = val)
all.data <- life.expectancy %>% 
            left_join(hale, by=c('year', 'location_id')) %>% 
            select(location_name, location_id, year, hale, le)

# Load hierarchy of locations to exclude estimates at aggregate levels
location.hierarchy <- read.csv('./data/raw/location-hierarchy.csv', stringsAsFactors = FALSE) %>% 
                        filter(level == 3) %>% # only country level
                        select(location_id, location_name, location_code)

location.names <- read.csv('./data/raw/location-names.csv', stringsAsFactors = FALSE) %>% 
                rename(location_name = Location, super.region = Super.Region, region = Region) %>% 
                select(location_name, location_id, super.region, region)

locations <- left_join(location.hierarchy, location.names, by='location_id')

# Merge data, exclude missing locations
prepped <- left_join(locations, all.data, by='location_id') %>% 
           select(location_name, location_code, year, hale, le)

wide.data <- gather(prepped, metric, value, le, hale) %>% 
  unite(metric_year, metric, year, sep = '.') %>% 
  spread(metric_year, value)

# Write data
write.csv(prepped, "./data/prepped/hale-le-data.csv", row.names = FALSE)
write.csv(wide.data, "./data/prepped/hale-le-data-wide.csv", row.names = FALSE)

