# Forecasting Vehicle-Related Crime Trends in Calgary
## Overview
This repository contains the analysis and forecasting for vehicle-related crimes in Calgary, focusing on two categories:
- Theft FROM Vehicle
- Theft OF Vehicle
The study uses a Bayesian regression model applied to crime data from January 2018 to October 2024, providing forecasts for 2025. The goal is to understand historical trends, seasonal patterns, and category-specific differences to support law enforcement and policy decisions.

## Contents

Files in this Repository:

data/: Contains the raw and cleaned datasets used for the analysis.

scripts/: Includes R scripts for data cleaning, modeling, and visualization.

model/: The Bayesian regression model file and its output summary.

visualizations/: Figures showing trends and model diagnostics.

paper/: Full analysis report (.pdf) and Quarto source file (.qmd).

## Key Findings

Overall Trends:

Vehicle-related crimes in Calgary have been declining steadily, with an annual mean reduction of 60.5 incidents.
Theft FROM Vehicle is more frequent than Theft OF Vehicle, but both are expected to decrease in 2025.

Seasonal Patterns:

Peaks occur in summer months (e.g., August shows +159.4 incidents compared to January).
Winter months show significant reductions in crime counts (e.g., December: -134.8 incidents compared to January).

Category-Specific Insights:

Theft FROM Vehicle exhibits pronounced seasonal surges but a sharper overall decline.
Theft OF Vehicle shows a steadier decline with fewer seasonal fluctuations.

## Methodology

Data Sources

Crime data was sourced from the Open Data Calgary platform, recorded and updated monthly by the Calgary Police Service.

## Analysis

Data Cleaning:

Aggregation by year, month, and category.
Introduction of a time column for time-series analysis.

Modeling:

A Bayesian regression model was employed to capture temporal trends and category-specific interactions.
Predictors include year, month, category, and their interactions.

Software:

Analysis conducted in R using packages: rstanarm, ggplot2, tidyverse, and others.
Visualizations

Key visualizations include:

Crime Trends (2018-2025): Comparison of actual and fitted trends for both crime categories.

Seasonal Patterns: Monthly variations in crime counts.

Model Diagnostics: Residuals, Q-Q plots, and posterior predictive checks.

## Future Work

Policy Analysis: Investigate the impact of specific interventions on crime trends.
Additional Predictors: Include socioeconomic and geographic variables.
Extended Timeframes: Analyze post-2024 data to validate forecasts.
