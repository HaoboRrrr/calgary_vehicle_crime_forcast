#### Preamble ####
# Purpose: Model the trend of total number of crimes for each category in Calgary
# Author: Haobo Ren
# Date: 23 November 2024
# Contact: haobo.ren@mail.utoronto.ca
# Pre-requisites: ensure data file is available in the specified directory


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
crime_data <- read_parquet("data/02-analysis_data/calgory_crime.parquet")

### Model data ####


# Fit a Bayesian regression model
crime_model <- stan_glm(
  formula = crime_count ~ time + category,
  data = crime_data,
  family = gaussian(),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 853
)

# Visualize trends
crime_data %>%
  ggplot(aes(x = time, y = crime_count, color = category)) +
  geom_line() +
  labs(
    title = "Trend of Total Crimes by Category Over Time",
    x = "Year-Month",
    y = "Total Crimes",
    color = "Category"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

summary(crime_model)
#### Save model ####
saveRDS(
  crime_model,
  file = "models/first_model.rds"
)


