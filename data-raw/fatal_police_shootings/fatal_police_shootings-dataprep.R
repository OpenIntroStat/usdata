library(readr)

# load data ---------------------------------------------------------------------
raw_data <- read.csv(here::here("data-raw/fatal_police_shootings/fatal_police_shootings.csv"))

# cleaning ----------------------------------------------------------------------

# drop columns to reduce file size
raw_data <- subset(raw_data,select = -c(latitude,longitude,is_geocoding_exact,name,id))

fatal_police_shootings<- raw_data

# save --------------------------------------------------------------------------

usethis::use_data(fatal_police_shootings, overwrite = TRUE)
