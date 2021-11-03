# Load packages --------------------------------------------------------------
library(readr)
library(dplyr)
library(tidyr)
library(janitor)
library(stringr)

# Load data ------------------------------------------------------------------
raw_data <- read_csv(here::here("data-raw/gerrymander/isostat_congress_election_gerry.csv"))

# Cleaning: ------------------------------------------------------------------

clean_data <- raw_data %>% 
  clean_names() %>% 
  select(-x2) %>% 
  separate(col = member2016,
           into = c("last_name", "first_name"),
           sep = ", ") %>% 
  mutate(
    party16 = str_extract(party16, "[:alpha:]"),
    party18 = str_extract(party18, "[:alpha:]"),
    gerry = factor(gerry, levels = c("low", "mid", "high"))
  ) 
  

gerrymander <- clean_data

# Save -----------------------------------------------------------------------

usethis::use_data(gerrymander, overwrite = TRUE)
