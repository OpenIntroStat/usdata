#' US Crime Rates
#'
#' National data on the number of crimes committed in the US between 
#' 1960 and 2019.
#'
#' @format A data frame with 60 rows and 12 variables.
#' \describe{
#'   \item{year}{Year data was collected.}
#'   \item{population}{Population of the United States the year data was collected.}
#'   \item{total}{Total number of violent and property crimes committed.}
#'   \item{violent}{Total number of violent crimes committed.}
#'   \item{property}{Total number of property crimes committed.}
#'   \item{murder}{Number of murders committed. Counted in violent total.}
#'   \item{forcible_rape}{Number of forcible rapes committed. Counted in violent total.}
#'   \item{robbery}{Number of robberies committed. Counted in violent total.}
#'   \item{aggravated_assault}{Number of aggravated assaults committed. Counted in violent total.}
#'   \item{burglary}{Number of burglaries committed. Counted in property total.}
#'   \item{larceny_theft}{Number of larcency thefts committed. Counted in property total.}
#'   \item{vehicle_theft}{Number of vehicle thefts committed. Counted in property total.}
#' }
#'
#'@source \href{http://www.disastercenter.com/crime/uscrime.htm}{Disaster Center}
#'
#' @examples
#'
#' library(ggplot2)
#'
#' ggplot(us_crime_rates, aes(x = population, y = total))+
#'  geom_point()+
#'  labs(title = "Crimes V Population",
#'   x = "Population",
#'   y = "Total Number of Crimes")
#'
#' ggplot(us_crime_rates, aes(x = murder))+
#'  geom_boxplot()+
#'  labs(title = "US Murders",
#'   subtitle = "1960 - 2019",
#'   x = "Number of Murders")+
#'  theme(axis.text.y = element_blank())
"us_crime_rates"
