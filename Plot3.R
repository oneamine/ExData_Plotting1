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
data$Timestamp <-paste(data$Date, data$Time)

#Sub metering 1 data
plot(strptime(data$Timestamp, "%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

#Sub metering 2 data in red
lines(strptime(data$Timestamp, "%d/%m/%Y %H:%M:%S"), data$Sub_metering_2, type = "l", col = "red" )

#Sub metering 3 data in blue
lines(strptime(data$Timestamp, "%d/%m/%Y %H:%M:%S"), data$Sub_metering_3, type = "l", col = "blue" )

#legend
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "Plot3.png") 
dev.off()