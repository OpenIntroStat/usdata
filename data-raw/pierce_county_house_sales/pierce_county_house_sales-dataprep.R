library(readr)
library(dplyr)
# load data ---------------------------------------------------------------------
raw_data <- read.csv(here::here("data-raw/pierce_county_house_sales/pierce_county_house_sales.csv"))

# cleaning ----------------------------------------------------------------------

# drop parcel number column
raw_data <- subset(raw_data,select = -c(parcel_number))

# set sale_date to date type
raw_data$sale_date <- as.Date(raw_data$sale_date,format =  "%m/%d/%Y")


pierce_county_house_sales<- raw_data

# save --------------------------------------------------------------------------
usethis::use_data(pierce_county_house_sales, overwrite = TRUE)
