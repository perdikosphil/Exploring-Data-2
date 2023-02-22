
## Load libraries.

library(tidyverse)
library(lubridate)


## Load data from the dates 2007-02-01 and 2007-02-02.

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") %>%
  subset(Date %in% c("1/2/2007","2/2/2007"))


## Format date to Type Date.

data$Date <- as.Date(data$Date, "%d/%m/%Y")


## Create a new variable that combines Date and Time.

data <- mutate(data, datetime = ymd_hms(paste(Date, Time)))


## Create Plot 3.

plot(Sub_metering_1~datetime, data, type = "l", ylab = "Energy sub metering", xlab = NA)
lines(Sub_metering_2~datetime, data, type = "l", col = "red")
lines(Sub_metering_3~datetime, data, type = "l", col = "blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, y.intersp = 0.7)


## Save Plot 3.

dev.copy(png, "plot3.png", width  = 480, height = 480)

dev.off()
