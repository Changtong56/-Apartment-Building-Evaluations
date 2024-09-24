#### Preamble ####
# Purpose: Prepares the data for subsequent analysis and visualization
# Author: Chang Tong
# Date: 22 September 2024
# Contact: tongchang0506@gmail.com
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(lubridate)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

print(names(raw_data))

cleaned_raw_data <- 
  raw_data |>
  janitor::clean_names() |> 
  filter(!is.na(year_built) & !is.na(current_building_eval_score) & !is.na(year_evaluated)) |> 
  mutate(
    year_evaluated = as.integer(year_evaluated),  
    total_score = as.numeric(current_building_eval_score),
    year_built = as.integer(year_built),   
    building_age = year_evaluated - year_built
  ) |>
  select(year_built, year_evaluated, current_building_eval_score, property_type,  confirmed_storeys, building_age)

#### Save data ####
write_csv(cleaned_raw_data, "data/analysis_data/analysis_data.csv")
