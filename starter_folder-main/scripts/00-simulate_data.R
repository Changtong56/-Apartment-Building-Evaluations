#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]





#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)

###find a specific package
packages <- list_packages(200)
Building_Evaluation <- search_packages("Apartment Building Evaluation")

Building_Evaluation_resources <- Building_Evaluation %>%
  list_package_resources()

resource_selected <- Building_Evaluation_resources %>%
  filter(row_number() == 1)

Building_Evaluation_statistics <- get_resource(resource_selected)

#### Simulate data ####
set.seed(304)


start_date <- as.Date("2018-01-01")
end_date <- as.Date("2023-12-31")


number_of_buildings <- 200

data <-
  tibble(
    dates = as.Date(
      runif(
        n = number_of_buildings,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
      origin = "1970-01-01"
    ),
    total_score = sample(1:3, number_of_buildings, replace = TRUE),  
    # Random scores from 1 to 3
    property_type = sample(c("Private", "TCHC"), number_of_buildings, replace = TRUE),  
    # Random property type
    year_built = sample(1950:2020, number_of_buildings, replace = TRUE),  
    # Random year of construction
    number_of_storeys = sample(3:30, number_of_buildings, replace = TRUE)  
    # Random number of storeys
  )


#### Write_csv
write_csv(data, file = "data/raw_data/simulated_building_data.csv")



