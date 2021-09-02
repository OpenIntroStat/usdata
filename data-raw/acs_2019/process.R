# Companion guide with this code:
# https://docs.google.com/document/d/17bL1PzosrAtVZws7wnTrsXa3ooznYYiHsRoSXdegCOo

# _____ Load Libraries _____ #
library(usdata)
# If needed, install tidyverse and dplyr:
#   install.packages(c("tidyverse", "dplyr"))
library(tidyverse)
library(dplyr)

# _____ Settings _____ #
# Choose one of the two options.
# Indicate whether to add the data into the county_complete data frame.
# If FALSE, then a data set called `a` will be generated.
add_to_county_complete <- TRUE
# Indicate whether to include the margin of error field.
# The `&& !add_to_county_complete` part is because we do not want
# to include MOE details in county_complete.
get_moe <- TRUE && !add_to_county_complete

# Load in the data sets.
# If necessary, use getwd() to learn your current working directory
# and setwd() to adjust the directory to the one containing the data sets.
d <- read.csv("acs_data_2019.csv")
d <- d[-grep("Puerto Rico", d$name), ]
h <- read.delim("acs_2019_header_key.tsv")

# Retrieve only the critical columns from h for the actual data set:
h. <- select(h, "var_name", "header_code")
# There was a discrepancy between the names in the 2019 data where an 'E'
# was added to each header_code in `h` and `h.`. If this is the case here,
# we add an `E` to each of the header codes in `d`.
n <- nrow(h.)
if (length(grep("E$", h.$header_code)) == n) {
  if (length(grep("E$", d$header_code)) == 0) {
    d$header_code <- paste0(d$header_code, "E")
  }
}
# Merge the data sets together:
d <- merge(d, h., all = TRUE, by = "header_code")
table(is.na(d$value))

# Create a version of the data set with only the required columns for
# inclusion in `county_complete`.
d. <- select(d, "fips", "name", "var_name", "value")
if (get_moe && !add_to_county_complete) {
  if (!any(names(d) == "moe")) {
    stop(
      "No margin of error field (moe) was found, despite\n",
      "the keep_moe setting being TRUE."
    )
  }
  d.moe <- select(d, "fips", "var_name", "value", "moe")
  d.moe$value <- d.moe$moe
  d.moe$moe <- NULL
  d.moe$var_name <- paste0(d.moe$var_name, "_moe")
}

# Make each variable into its own column.
d. <- tidyr::spread(d., var_name, value)
if (get_moe && !add_to_county_complete) {
  d.moe <- tidyr::spread(d.moe, var_name, value)
  na <- names(d.)[!names(d.) %in% c("fips", "name")]
  d. <- merge(d., d.moe, by = "fips")
  d. <- d.[, c("fips", "name", c(rbind(na, paste0(na, "_moe"))))]
}
d. <- subset(d., !is.na(fips))
# Extract the county and state. This is for any new counties.
d.$county_2019 <- regmatches(d.$name, regexpr("^[^,]+", d.$name))
d.$state_2019 <- gsub("^ +", "", regmatches(d.$name, regexpr("[^,]+$", d.$name)), perl = TRUE)

# Confirm the data looks okay.
# If any variables were listed in the spreadsheet but there was no data
# in the CSV, there will be a discrepancy between ncol(d.) and the number
# of variables listed in the data dictionary.
head(d.)
nrow(d.)
ncol(d.)
nrow(h)

# There are a couple of FIPS codes that required updating.
if (add_to_county_complete) {
  cc <- usdata::county_complete
  if (any(cc$fips == 46113)) {
    cc$fips[cc$fips == 46113] <- 46102
  }
  if (any(cc$fips == 2270)) {
    cc$fips[cc$fips == 2270] <- 2158
  }
  # Create a new county_complete data set.
  cc <- merge(cc, select(d., -name), by = "fips", all = TRUE)
  # May see if there are new counties not previously reported:
  # subset(cc, is.na(name))[, c(1:5, ncol(cc) - 3:0)]
  # May see any counties no longer included.
  # subset(cc, is.na(county_2019))[, c(1:5, ncol(cc) - 3:0)]
  # Get rid of the county_2019 and state_2019 columns.
  county_complete <- select(cc, -county_2019, -state_2019)

  # Confirm we have dropped no columns from county_complete:
  found <- names(usdata::county_complete) %in% names(county_complete)
  if (all(found)) {
    message("All original county_complete columns were preserved.")
  } else {
    stop(
      "Some county_complete columns were dropped:\n- ",
      paste(names(usdata::county_complete)[!found], collase = "\n- ")
    )
  }
  save(county_complete, file = "county_complete.rda")
  message("`county_complete.rda` file created.")

  fileConn <- file("county_complete.txt")
  writeLines(
    paste0("#'   \\item{", h$var_name, "}{", h$description, "}"),
    fileConn
  )
  close(fileConn)
  message("New column documentation has been written into `county_complete.txt`.")
} else {
  # Rename the `county_2019` column to be `name`.
  d.$name <- d.$county_2019
  # Remove the `county_2019` column (because it's been copied over).
  d.$county_2019 <- NULL
  # Rename the `state_2019` column to be `state`.
  d.$state <- d.$state_2019
  # Remove the `state_2019` column (because it's been copied over).
  d.$state_2019 <- NULL
  # Reorder the colums to put state, name, and fips in front.
  standard <- c("state", "name", "fips")
  a <- d.[, c(standard, names(d.)[!names(d.) %in% standard])]
  names(a) <- gsub("_2019", "", names(a), fixed = TRUE)

  # Rename `a` to the desired name and save the file.
  county_2019 <- a
  save(county_2019, file = "county_2019.rda")
  message("`county_2019.rda` file created.")
  fileConn <- file("county_2019.txt")
  h$var_name <- gsub("_2019", "", h$var_name, fixed = TRUE)
  cd1 <- paste0("#'   \\item{", h$var_name, "}{", h$description, "}")
  cd2 <- paste0("#'   \\item{", h$var_name, "_moe}{Margin of error for \\code{", h$var_name, "}.}")
  column_desc <- c(
    "#'   \\item{state}{State.}",
    "#'   \\item{name}{County name.}",
    "#'   \\item{fips}{FIPS code.}",
    rbind(cd1, cd2)
  )
  writeLines(column_desc, fileConn)
  close(fileConn)
  message("New column documentation has been written into `county_2019.txt`.")
  # Get the number of rows and columns.
  dim(county_2019)
}
