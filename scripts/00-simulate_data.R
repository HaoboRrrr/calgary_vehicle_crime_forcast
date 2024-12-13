#### Preamble ####
# Purpose: Simulates a dataset of Calgary community crime count
# Author: Haobo Ren
# Date: 20 November 2024
# Contact: haobo.ren@mail.utoronto.ca
# Pre-requisites: The `tidyverse` and 'dplyr'  package must be installed


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# Set seed for reproducibility
set.seed(123)

# Simulated data generation
# Simulate basic structure of the dataset
simulated_data <- data.frame(
  community = sample(c("01B", "02C", "03D", "04E"), size = 100, replace = TRUE),
  year = sample(2019:2022, size = 100, replace = TRUE),
  month = sample(1:12, size = 100, replace = TRUE)
)

# Assign crime categories based on community
simulated_data$category <- ifelse(simulated_data$community == "01B", 
                                  "Assault (Non-domestic)",
                                  ifelse(simulated_data$community == "02C", 
                                         "Break & Enter - Commercial",
                                         ifelse(simulated_data$community == "03D", 
                                                "Theft", 
                                                "Vandalism")))

# Assign crime counts with simple logic
simulated_data$crime_count <- with(simulated_data, 
                                   ifelse(year == 2019, 2, 
                                          ifelse(year == 2020, 3, 
                                                 ifelse(year == 2021, 4, 5))) + # Base count increases over years
                                     ifelse(month %in% c(6, 7, 8), 2, 0) +    # Summer months get a boost
                                     ifelse(category == "Theft", 2,           # Theft generally has higher counts
                                            ifelse(category == "Break & Enter - Commercial", 1, 0))
)

# Cap the crime count for realism
simulated_data$crime_count <- pmin(simulated_data$crime_count, 10)

# View the first few rows
head(simulated_data)

#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
