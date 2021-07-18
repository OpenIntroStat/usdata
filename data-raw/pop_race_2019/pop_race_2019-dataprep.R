library(readr)

# load data ---------------------------------------------------------------------
raw_data <- read.csv(here::here("data-raw/pop_race_2019/pop_race_2019.csv"))

# cleaning ----------------------------------------------------------------------

# no cleaning required
pop_race_2019<- raw_data

# save --------------------------------------------------------------------------
usethis::use_data(pop_race_2019, overwrite = TRUE)
