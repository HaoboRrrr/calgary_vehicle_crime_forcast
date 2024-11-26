#### Preamble ####
# Purpose: Tests the structure and validality of the analysis data
# Author: Haobo Ren
# Date: 20 November 2024
# Contact: haobo.ren@mail.utoronto.ca
# Pre-requisites:
# Any other information needed? 
  #The `tidyverse` and 'testthat' package must be installed


#### Workspace setup ####
library(tidyverse)

analysis_data <- read_csv("data/02-analysis_data/calgory_crime.csv")


#### Test data ####

# Test that the dataset has no na
any_na <- any(is.na(analysis_data))
if (any_na) {
  print("The dataset contains NA values.")
} else {
  print("The dataset does not contain any NA values.")
}

# Check if months are valid
if (all(analysis_data$month >= 1 & analysis_data$month <= 12)) {
  print("All months are within the valid range (1-12).")
} else {
  print("Some months are out of the valid range (1-12).")
}
