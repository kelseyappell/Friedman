#' Calculate Descriptive Statistics
#'
#' This function calculates descriptive statistics of mean,
#' median, mode, standard deviation, and variance. It then uses
#' then returns a structured data frame, coming from the descript_stats
#' object
#'
#' @param x Numeric Vector
#'
#' @return An object with the class descript_stats, which prints a
#' data frame with the results
#'
#' @examples
#' descript_stats(c(1,2,3,4,5))
#'
#' @export

# Mean, Median, Mode, Standard Deviation, and Variance
descript_stats <- function(x){
  # Gives error if input is not vector
  if(!is.vector(x)){
    stop("Expecting a vector")
  }

  # Gives error if input is not numeric
  if(!is.numeric(x)) {
    stop("Input must be numeric")
  }

  # Function to calculate mode
  modeVal <- function(x){
    freq <- table(x)
    maxFreq <- max(freq)

    if(maxFreq == 1){
      return(NA)
    }

    # Returns numeric value with highest frequency
    as.numeric(names(freq[freq == maxFreq]))
  }

  # Arranges stat values into DF
  result <- data.frame(
    mean = mean(x, na.rm = TRUE),
    median = median(x, na.rm = TRUE),
    mode = I(list(modeVal(x))),  # Ensures multiple values can be listed under mode
    sd = sd(x, na.rm = TRUE),
    variance = var(x, na.rm = TRUE)
  )

  # Turns function into a class
  class(result) <- c("descript_stats", "data.frame")
  return(result)
}
