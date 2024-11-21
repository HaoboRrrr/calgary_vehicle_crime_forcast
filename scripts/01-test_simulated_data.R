#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Calgory community 
  #crime count dataset
# Author: Haobo Ren
# Date: 20 November 2024
# Contact: haobo.ren@mail.utoronto.ca
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been loaded



#### Workspace setup ####
library(tidyverse)

simulated_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("simulated_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####
# Check for NA values
any_na <- any(is.na(simulated_data))
if (any_na) {
  print("The dataset contains NA values.")
} else {
  print("The dataset does not contain any NA values.")
}

# Check column types
expected_types <- c("character", "character", "numeric", "numeric", "numeric")
actual_types <- sapply(simulated_data, class)

if (all(expected_types == actual_types)) {
  print("All columns have the expected data types.")
} else {
  print("Some columns have unexpected data types:")
  print(actual_types)
}

# Check if months are valid
if (all(simulated_data$Month >= 1 & simulated_data$Month <= 12)) {
  print("All months are within the valid range (1-12).")
} else {
  print("Some months are out of the valid range (1-12).")
}

# Check for non-negative crime counts
if (all(simulated_data$Crime.Count >= 0)) {
  print("All crime counts are non-negative.")
} else {
  print("Some crime counts are negative.")
}
