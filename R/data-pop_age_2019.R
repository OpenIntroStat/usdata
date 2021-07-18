#' Population Age 2019 Data.
#' 
#' State level data on population by age.
#'
#' @format A data frame with 2820 rows and 4 variables.
#' \describe{
#'   \item{state}{State as 2 letter abbreviation.}
#'   \item{state_name}{State name.}
#'   \item{age}{Age cohort for population.}
#'   \item{population}{Population of age cohort.}
#'   \item{state_total_population}{total estimated state population in 2019}   
#' }
#' @examples
#' library(dplyr)
#' 
#' # List age population for each state with percent of total
#' pop_age_2019 %>%
#'   group_by(state_name,age) %>%
#'   mutate(percent=population/state_total_population*100) %>%
#'   select(state_name,age,population,percent)

#' pop_age_2019 %>%
#'   select(state_name,state_total_population) %>%  
#'   distinct() %>%
#'   arrange(desc(state_total_population))  
#'
#'
#' @source [Centers for Disease Control and Prevention](https://wonder.cdc.gov/Bridged-Race-v2019.HTML)
#'
"pop_age_2019"
