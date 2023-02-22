
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


## Create Plot 4.

par(mfrow = c(2, 2))

plot(Global_active_power~datetime, data, type="l", ylab="Global Active Power", xlab= NA)
plot(Voltage~datetime, data, type="l")
plot(Sub_metering_1~datetime, data, type = "l", ylab = "Energy sub metering", xlab = NA)
lines(Sub_metering_2~datetime, data, type = "l", col = "red")
lines(Sub_metering_3~datetime, data, type = "l", col = "blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, lty = 1, bty = "n", y.intersp = 0.5)
plot(Global_reactive_power~datetime, data, type="l")


## Save Plot 4.

dev.copy(png, "plot4.png", width  = 480, height = 480)

dev.off()
