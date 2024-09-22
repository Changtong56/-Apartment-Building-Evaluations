#### Preamble ####
# Purpose: Find and Simulates data
# Author: Chang Tong
# Date: 22 September 2024
# Contact: tongchang0506@gmail.com
# License: MIT
# Pre-requisites: None
# Any other information needed? None



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



