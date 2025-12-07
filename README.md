# Friedman
Descriptive Statistics R Package Repository

Introduction: This R package is comprised of multiple functions to provide descriptive
statistics (mean, median, mode, standard deviation, variance) on datasets and
visualizes them. 

Functions: This package is comprised of 3 functions:
1. descript_stats: Takes in a numeric vector and returns mean, median, mode, sd,
   and vairance.
2. bar_plot: Takes in the data frame returned from descript_stats and graphs its
   results on a bar plot. 
3. compare_stats: This function can take in two data frames returned from
   descript_stats, compares their values, and graphs each element's values
   as well as their differences

Libraries: This package uses 3 external libraries:
1. ggplot2: This package is used to create the visualizations in bar_plot & compare_stats
2. tidyr: This package is used in the compare_stats function to create a graphable dataframe
   with the statistical methods, values from each input dataframe, and their differences. I
   specifically used the pivot_longer() function to do so.
3. dplyr: This package was used in the bar_plot() function in order to filter out NA rows.

Metadata: The metadata of my package includes:
Package: Friedman
Title: Descriptive Statistics with Visualizations
Version: 0.0.0.9000
Authors@R: 
    person("Kelsey", "Appell", , "kelseyappell@usf.edu", role = c("aut", "cre"))
Description: Provides descriptive statistics such as mean, median, mode, standard deviation, 
and variance. Creates visualizations of the data distributions using ggplot2.
License: CC0
Encoding: UTF-8
Roxygen: list(markdown = TRUE)
RoxygenNote:7.3.3
Imports: ggplot2, tidyr, dplyr


License: This package uses a MIT license. I thought that this license type would be the most
appropriate because it allows for a very easily accessible package. This is the most desirable
circumstance for a class project. I figured nobody would be modifying my package, so I didn't 
find it necessary to make the package private.

Object Systems/Methods: This package includes an S3 class called, "descript_stats" and an S3
print method called, "print.descript_stats". This method is used in order to print the output
of the descript_stat() function in a structured manner.
