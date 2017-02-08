
# Needed libraries
library(Hmisc)
library(dplyr)

# Get physical activity data
data <- sasxport.get('data/raw/DR1IFF_H.XPT')
demographic.data <- sasxport.get('data/raw/DEMO_H.XPT')

# Append demographic data
prepped.data <- data %>%
    inner_join(demographic.data, by = 'seqn')

# Write out prepped file
write.csv(prepped.data, file = 'data/prepped/prepped_data.csv')
