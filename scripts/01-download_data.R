#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Chang Tong
# Date: 22 September 2024
# Contact: tongchang0506@gmail.com
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

###find a specific package
packages <- list_packages(100)
Building_Evaluation <- search_packages("Apartment Building Evaluation")

Building_Evaluation_resources <- Building_Evaluation %>%
  list_package_resources()

resource_selected <- Building_Evaluation_resources %>%
  filter(row_number() == 1)

data <- get_resource(resource_selected)


#### Save data ####
write.csv(data, "data/raw_data/raw_data.csv")
         
