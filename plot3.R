##  QUIZ 1 - Plot 3

##Downloading data
setwd("C:/Users/ALEJANDRO/Documents/Data Science - John Hopkins/Curso 4 - Exploratory analysis/Quiz 1")
if (!file.exists("./data")){dir.create("./data")}
setwd("./data")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./data/Household_power_consumption.zip")
unzip("./data/Household_power_consumption.zip")
data <- read.table("./data/household_power_consumption.txt", sep =";", header = TRUE, dec = ".", stringsAsFactors = FALSE)

data <- subset(data, Date == c("1/2/2007","2/2/2007"))

library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

## Plot 3
plot(data$datetime,data$Sub_metering_1, xlab = "", 
     ylab = "Energy Submetering", type = "l")
lines(data$datetime, data$Sub_metering_2, col="red", type="l")
lines(data$datetime, data$Sub_metering_3, col="blue", type="l")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, col = c("black","red","blue"))
dev.copy(png, file = "plot3.png") ## Copy to a PNG file
dev.off() 
