# plot3.R


## setting the working directory to the project file folder
setwd("E:/Coursera/Exploratory Data Analysis/Course Projects/Course Project 1/")

## Reading the data from the dates 2007-02-01 and 2007-02-02.
powerconsumption <- read.table("household_power_consumption.txt",
                               sep=";", na.strings="?", skip=66637, nrow=2880)

names(powerconsumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                             "Voltage", "Global_intensity", "Sub_metering_1",
                             "Sub_metering_2", "Sub_metering_3")

powerconsumption$DateTime <- strptime(paste(powerconsumption$Date, powerconsumption$Time),
                                      format="%d/%m/%Y %H:%M:%S")


## Constructing plot3.png
png(filename="plot3.png", width=480, height=480)

plot(powerconsumption$DateTime, powerconsumption$Sub_metering_1, type="n", 
     xlab="", ylab="Energy sub metering")
lines(powerconsumption$DateTime, powerconsumption$Sub_metering_1, col="black")
lines(powerconsumption$DateTime, powerconsumption$Sub_metering_2, col="red")
lines(powerconsumption$DateTime, powerconsumption$Sub_metering_3, col="blue")
legend("topright", lty = c(1,1,1), col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()