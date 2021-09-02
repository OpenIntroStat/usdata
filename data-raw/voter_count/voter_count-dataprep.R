# load packages ----------------------------------------------------------------

library(readr)
library(usethis)
library(here)

# load data --------------------------------------------------------------------

voter_count <- read_csv(here::here("data-raw/voter_count", "november_voter_turnout.csv"))

# clean data: Change incorrect 0's values to NA --------------------------------

voter_count[voter_count == 0] <- NA

# save -------------------------------------------------------------------------

usethis::use_data(voter_count, overwrite = TRUE)
