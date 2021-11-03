library(readxl)


# load data ---------------------------------------------------------------------
us_time_survey <- read_excel(here::here("data-raw/us_time_survey/AmericanTimeUseSurvey.xlsx"))

# cleaning ----------------------------------------------------------------------


# save --------------------------------------------------------------------------

usethis::use_data(us_time_survey, overwrite = TRUE)

