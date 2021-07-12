#'  prez_pwr.
#'
#'  Data from a Pew Research Center poll about Presidential
#'  power/control over gas prices.
#'
#' @format A data frame with 365 rows and 3 variables.
#' \describe{
#'   \item{president}{Sitting President at time of the poll.}
#'   \item{party}{Political party of the respondent with levels d(emocrat)
#'   and r(epublican).}
#'   \item{has_pwr}{Respondent answer to the question: "Is
#'   the price of gasoline something the president can do
#'   alot about, or is that beyond the president's control?"}
#'   }
#' @examples
#'  library(ggplot2)
#'  ggplot(prez_pwr, aes(has_pwr, fill = party))+
#'    geom_bar()+
#'    labs(title = "Is the price of gasoline something the president can do alot about?",
#'        x = "",
#'        y = "Number of respondents",
#'        fill = "Respondent Party")+
#'    facet_wrap(~president)
#'
#' @source
#'   [Pew Research Center, May 2006 & March 2012](https://www.pewresearch.org/fact-tank/2013/07/25/can-a-president-control-gas-prices-depends-on-when-you-ask/).
#'
"prez_pwr"
