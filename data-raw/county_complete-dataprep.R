# Load previous version of openintro package containing previous version of data frame.
# I took the last commit on 2020-06-23:
# remotes::install_github("https://github.com/OpenIntroStat/openintro@d2bac268faf3ec566deb79baf106f274c6de38a2", force = TRUE)
library(openintro)
library(usethis)
library(dplyr)

county_complete <- openintro::county_complete

county_complete <- county_complete %>%
  mutate(
    name = as.character(name),
    name = if_else(name == "Hoonah–Angoon Census Area", "Hoonah Angoon Census Area", name)
  )

# Add to package
use_data(county_complete, overwrite = TRUE)
