#' American Time Survey 2009 - 2019
#'
#' Average Time Spent on Activities by Americans
#' 
#' @name us_time_survey
#' @docType data
#' @format A data frame with 11 rows and 8 variables.
#' \describe{
#'   \item{year}{Year data collected}
#'   \item{household_activities}{Average hours per day spent on household activities - travel included}
#'    \item{eating_and_drinking}{Average hours per day spent eating and drinking including travel.}
#'   \item{leisure_and_sports}{Average hours per day spent on leisure and sports - including travel.}
#'   \item{sleeping}{Average Hours spent sleeping.}
#'   \item{caring_children}{Average hours spent per day caring for and helping children under 18 years of age.}
#'   \item{working_employed}{Average hours spent working for those employed. (15 years and older)}
#'   \item{working_employed_days_worked}{Average hours per day spent working on days worked (15 years and older)}
#'   
#' }
#'
#' @examples
#'
#'library(ggplot2)
#'us_time_survey$year <-as.factor(us_time_survey$year)
#'ggplot(us_time_survey, aes(year, sleeping))+
#'  geom_point(alpha = 0.3) +
#'  labs( x= "Year", 
#'        y = "Average hours spent Sleeping", 
#'        title = "US Average hours spent sleeping, 2009 - 2019")
#'
#'
#'
#' @source [US Bureau of Labor Statistics](https://www.bls.gov/tus/)
#' @keywords datasets
#'
"us_time_survey"
