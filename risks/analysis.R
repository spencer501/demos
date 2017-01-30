# Load needed libraries
library(dplyr)

# Load data
data <- read.csv("data/prepped/risk-factors.csv")

# Calculate average risk
data <- data %>%
    mutate(average.risk = rowMeans(data[,-(1:6)], na.rm=TRUE))

# Q1: Which risk-disease combination has the highest relative risk?
highest.rr <- data %>%
    filter(average.risk == max(average.risk))

# Q2: For each risk factor, which disease is it the greatest risk for?


# Q3: For each disease, what is the greatest risk factor?


# Q4: Which diseases have different risks for men and women?


