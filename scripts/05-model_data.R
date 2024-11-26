#### Preamble ####
# Purpose: Model the trend of total number of crimes for each category in Calgary
# Author: Haobo Ren
# Date: 23 November 2024
# Contact: haobo.ren@mail.utoronto.ca
# Pre-requisites: ensure data file is available in the specified directory


#### Workspace setup ####
library(rstanarm)
library(arrow)
library(ggplot2)
library(dplyr)

#### Read data ####
crime_data <- read_parquet("data/02-analysis_data/calgory_crime.parquet")

### Model data ####

# Ensure `category` is treated as a factor
crime_data$category <- as.factor(crime_data$category)
crime_data$month <- as.factor(crime_data$month)


# Fit a Bayesian regression model
crime_model <- stan_glm(
  formula = crime_count ~ year + month + category + category:month + category:year,
  data = crime_data,
  family = gaussian(),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 369
)


### Visualize Data

# Construct fitted value data
fitted_data <- expand.grid(
  year = 2018:2025,
  month = 1:12,
  category = c("Theft FROM Vehicle", "Theft OF Vehicle")
) %>%
  mutate(
    time = as.Date(paste(year, month, "01", sep = "-")), # Create time range
    month = as.factor(month),
    category = as.factor(category)
  )

# Predict crime counts using the model
fitted_data$fitted_crime_count <- predict(crime_model, newdata = fitted_data)

# Visualize trends
crime_data$source <- "Actual"
fitted_data$source <- "Fitted"
combined_data <- bind_rows(
  crime_data %>% select(time, crime_count, category, source),
  fitted_data %>% rename(crime_count = fitted_crime_count) %>% select(time, crime_count, category, source)
)

# Plot combined trends
ggplot(combined_data, aes(x = time, y = crime_count, color = category, linetype = source)) +
  geom_line() +
  labs(
    title = "Actual vs. Fitted Crime Trends (2018-2025)",
    x = "Time",
    y = "Crime Count",
    color = "Category",
    linetype = "Source"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#### Save model ####
saveRDS(
  crime_model,
  file = "models/crime_model.rds"
)


