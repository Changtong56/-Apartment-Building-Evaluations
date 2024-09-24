#### Preamble ####
# Purpose: Find and Simulates data
# Author: Chang Tong
# Date: 22 September 2024
# Contact: tongchang0506@gmail.com
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(readr)

#### Simulate data ####
set.seed(304)


start_date <- as.Date("2018-01-01")
end_date <- as.Date("2023-12-31")


number_of_buildings <- 100

building_data <-
  tibble(
    dates = as.Date(
      runif(
        n = number_of_buildings,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
      origin = "1970-01-01"
    ),
    total_score = sample(1:100, number_of_buildings, replace = TRUE),  
    property_type = sample(c("Private", "TCHC", "Social Housing"), number_of_buildings, replace = TRUE),  
    year_built = sample(1950:2024, number_of_buildings, replace = TRUE),  
    year_evaluated = sample(1950:2024, number_of_buildings, replace = TRUE),
    building_age = year_evaluated - year_built
  )


#### Write_csv

write_csv(building_data, file = "data/raw_data/simulated_building_data.csv")

