
## Load libraries.

library(tidyverse)


## Load data from the dates 2007-02-01 and 2007-02-02.

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") %>%
            subset(Date %in% c("1/2/2007","2/2/2007"))


## Create Plot 1.

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


## Save Plot 1.

dev.copy(png, "plot1.png", width  = 480, height = 480)

dev.off()
