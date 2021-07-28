library(readxl)


# load data ---------------------------------------------------------------------
airline_delay <- read_excel(here::here("data-raw/airline_delays/airline_delay_causes_Dec_2020_Dec_2019.xlsx"))

# cleaning ----------------------------------------------------------------------
 

# save --------------------------------------------------------------------------

usethis::use_data(airline_delay, overwrite = TRUE)
