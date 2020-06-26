# Load previous version of openintro package containing previous version
# of county data frame. I took the last commit on 2020-06-23:
# remotes::install_github("https://github.com/OpenIntroStat/openintro@d2bac268faf3ec566deb79baf106f274c6de38a2", force = TRUE)
library(openintro)
library(usethis)

# Add to package
use_data(urban_rural_pop, overwrite = TRUE)
