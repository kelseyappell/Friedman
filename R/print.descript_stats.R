#' descript_stats method
#'
#' This function creates a formatted version of descript_stats
#' by taking in the output, concatenating, and printing the
#' data frame.
#'
#' @param x Object of descript_stats class
#' @param ... Additional arguments
#'
#' @return structured data frame of descript_stats output
#'
#' @export
#' @method print descript_stats
print.descript_stats <- function(x, ...){
  cat("Descriptive Statistics:\n")
  print(
    data.frame(
      Mean = x$mean,
      Median = x$median,
      Mode = paste(unlist(x$mode), collapse = ","),
      SD = x$sd,
      Variance = x$variance
    )
  )
  invisible(x)
}
