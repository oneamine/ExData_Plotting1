library(dplyr)
library(data.table)

#Reads in data from file then subsets data for specified dates
fh <- fread("household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
data <- filter(fh, grep("^[1,2]/2/2007", Date))

#Convert character columns to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Voltage <- as.numeric(as.character(data$Voltage))


hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "Plot1.png") 
dev.off()