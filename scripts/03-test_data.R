#### Preamble ####
# Purpose: Sanity check of the data
# Author: Chang Tong
# Date: 23 September 2024
# Contact: tongchang0506@gmail.com
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read_csv("data/raw_data/simulated_building_data.csv")


data$building_age |> min() <= 0

all(!is.na(data$year_built) & !is.na(data$total_score ) & !is.na(data$year_evaluated))

