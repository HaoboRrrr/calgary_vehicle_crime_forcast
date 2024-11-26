#### Preamble ####
# Purpose: Cleans the raw plane data by the category and year
# Author: Haobo Ren
# Date: 20 November 2024
# Contact: haobo.ren@mail.utoronto.ca
# Pre-requisites: The `tidyverse` and 'dplyr'  package must be installed


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

cleaned_data <- raw_data %>% clean_names() %>%
  group_by(category, year, month) %>%
  summarise(crime_count = sum(crime_count), .groups = "drop") %>%
  mutate(time = as.Date(paste0(year, "-", sprintf("%02d", month), "-01"))) %>%
  select(category, crime_count, year, month, time) %>% arrange(category, year, month) %>%
  filter(category == "Theft OF Vehicle" | category == "Theft FROM Vehicle")


#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/calgory_crime.csv")
write_parquet(cleaned_data, "data/02-analysis_data/calgory_crime.parquet")
