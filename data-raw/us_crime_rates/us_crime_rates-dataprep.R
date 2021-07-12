library(janitor)

# load data --------------------------------------------------------------------

us_crime_rates <- read_csv(here::here("data-raw/us_crime_rates/us_crime_rates.csv"))

# cleaning: Change incorrect 0's values to NA

us_crime_rates <- us_crime_rates %>% 
  clean_names()

# save -------------------------------------------------------------------------

usethis::use_data(us_crime_rates, overwrite= TRUE)
