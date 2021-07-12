library(readr)
library(dplyr)
library(tidyr)

# load data ---------------------------------------------------------------------

raw_data <- read.csv(here::here("data-raw/prez_pwr/prez_pwr.csv"))

# cleaning: r-------------------------------

prez_pwr <- raw_data %>% 
  pivot_longer(cols = c(yes, no),
               names_to = "has_pwr",
               values_to = "percentage") %>% 
  uncount(percentage)

# save --------------------------------------------------------------------------

usethis::use_data(prez_pwr, overwrite = TRUE)
