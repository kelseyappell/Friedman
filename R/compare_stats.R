#' Comparing Statistics of Multiple DFs
#'
#' This function takes in two data frames, specifically
#' those returned by descript_stats. This function then
#' compared the differences of the values, creates a new
#' graphable data frame with the methods, values, and
#' differences. This data frame is then used to create a
#' ggplot bar graph of the methods, values, and their differences.
#' This function both prints the graph and returns the data frame.
#'
#' @param x One data frame
#' @param y One data frame
#'
#' @return The ggplot graph of the comparative data
#' & prints data frame
#'
#' @import ggplot2
#'
#' @import tidyr
#'
#' @export
compare_stats <- function(x, y){
  # Ensure input is DF
  if(!is.data.frame(x) || !is.data.frame(y)) {
    stop("Both inputs must be data frame")
  }

  # Create New DFs (addresses multiple modes)
  newDFx <- data.frame(
    method = c("mean", "median","mode", "sd", "variance"),
    value = c(x$mean, x$median, mean(unlist(x$mode)), x$sd, x$variance)
  )

  newDFy <- data.frame(
    method = c("mean", "median","mode", "sd", "variance"),
    value = c(y$mean, y$median, mean(unlist(y$mode)), y$sd, y$variance)
  )

  # Calculate Differences
  differences <- abs(newDFx$value - newDFy$value)

  # Create New Table to Show Methods, Values, & Differences
  compareDF <- data.frame(
    method = newDFx$method,
    valueX = newDFx$value,
    valueY = newDFy$value,
    diff = differences
  )

  # Create Graphable compareDF
  compareDFNew <- pivot_longer(
    compareDF,
    cols = c(valueX, valueY, diff),
    names_to = "type",
    values_to = "value"
  )

  # Create Graph Showing Differences
  comparePlot <- ggplot(compareDFNew, aes(x = method, y = value, group = method,
                           fill = type)) +
    geom_col(position = "stack") +
    labs(title = "Descriptive Statistic Result Differences",
         x = "Method",
         y = "Value")

  # Return DF and Plot
  print(comparePlot)
  return(compareDF)
}
