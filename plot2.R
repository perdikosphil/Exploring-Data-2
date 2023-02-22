
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


## Create Plot 2.

plot(Global_active_power~datetime, data, type="l", ylab="Global Active Power (kilowatts)", xlab= NA)


## Save Plot 2.

dev.copy(png, "plot2.png", width  = 480, height = 480)

dev.off()
