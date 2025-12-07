# Test
#install.packages("Friedman")
#library(Friedman)

# descript_stat
myVector <- c(1,2,3,4,5,5)
myVector2 <- c(5,6,7,8,9,9,10,10)

vStats <- descript_stats(myVector)
vStats2 <- descript_stats(myVector2)

# bar_plot
bar_plot(vStats)
bar_plot(vStats2)

# compare_stats
compare_stats(vStats, vStats2)
