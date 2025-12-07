#' Create Descriptive Statistics Bar Graph
#'
#' This function takes an input of a dataframe, specifically
#' the output of descript_stats. This data frame is then transformed
#' and filtered accordingly to make it graphable with ggplot2. The
#' ggplot graph is then returned.
#'
#' @param x Data frame or object of the descript_stats class
#'
#' @return A ggplot graph of the descriptive statistics provided
#' by the input data frame
#'
#' @import ggplot2
#'
#' @export

# Graphing Stats Results w/ Ggplot2: Histogram
bar_plot <- function(x){
  # Ensures input is DF
  if (!is.data.frame(x)){
    stop("Expecting data frame")
  }

  # Convert DF, so everything can be graphed on hist
  newDF <- data.frame(
    method = c("mean", "median","mode", "sd", "variance"),

                              # Allows graphing of mode,
                              # Addresses multiple modes
    value = c(x$mean, x$median, mean(unlist(x$mode)), x$sd, x$variance)
  )

  # Filters values if it is NA
  newDF <- dplyr::filter(newDF, !is.na(value))

  # Plots DF as a histogram
  ggplot(newDF, aes(x = method, y = value, fill = method)) +
    geom_col() +
    labs(title = "Descriptive Statistics Results",
         x = "Method",
         y = "Value")
}
