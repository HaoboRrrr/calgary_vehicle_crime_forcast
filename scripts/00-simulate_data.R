#### Preamble ####
# Purpose: Simulates a dataset of Calgary community crime count
# Author: Haobo Ren
# Date: 20 November 2024
# Contact: haobo.ren@mail.utoronto.ca
# Pre-requisites: The `tidyverse` and 'dplyr'  package must be installed


#### Workspace setup ####
library(dplyr)

#### Simulate data ####
# Set seed for reproducibility
set.seed(123)

# Simulated data generation
simulated_data <- data.frame(
  Community = sample(c("01B", "02C", "03D", "04E"), size = 100, replace = TRUE),
  Category = sample(c("Assault (Non-domestic)", "Break & Enter - Commercial", 
                      "Break & Enter - Residential", "Theft", "Vandalism"), size = 100, replace = TRUE),
  Crime.Count = sample(1:5, size = 100, replace = TRUE),
  Year = sample(2019:2022, size = 100, replace = TRUE),
  Month = sample(1:12, size = 100, replace = TRUE)
)

#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
