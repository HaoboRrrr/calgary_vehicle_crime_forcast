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

analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")


#### Test data ####
# Test that the dataset has total of 212950 crime counts
crime_counts

