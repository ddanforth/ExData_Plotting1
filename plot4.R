# R program for plot 4
library(datasets)

#Get the data
myData <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";")

#Format Date to Subset
myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")

#Subset data by date range
plotData <- subset(myData, myData$Date >= "2007-02-01" & myData$Date <= "2007-02-02")

#Merge the Date and Time columns to use in plot
plotData <- transform(plotData, DateTime=as.POSIXct(paste(plotData$Date, plotData$Time)))

#Save a png file
png(file = "plot4.png", bg = "transparent", width = 480, height = 480)

#format plot to two rows, two columns
par(mfrow=c(2,2))

#Upper left plot
plot(x=plotData$DateTime, y=as.numeric(plotData$Global_active_power), type="l", xlab="", ylab="Global Active Power")

#Upper right plot
plot(x=plotData$DateTime, y=as.numeric(plotData$Voltage), type="l", xlab="datetime", ylab="Voltage")

#Bottom left plot
plot(x=plotData$DateTime, y=as.numeric(plotData$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
points(x=plotData$DateTime, y=as.numeric(plotData$Sub_metering_2), type="l", col="red")
points(x=plotData$DateTime, y=as.numeric(plotData$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","blue","red"))

#Bottom right plot
plot(x=plotData$DateTime, y=as.numeric(plotData$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

#Close file
dev.off()

print("OK, plot done.")
