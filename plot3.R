# R program for plot 3
library(datasets)

#Get the data
myData <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";")

#Format Date to Subset
myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")

#Subset data by date range
plotData <- subset(myData, myData$Date >= "2007-02-01" & myData$Date <= "2007-02-02")

#Merge the Date and Time columns to use in plot
plotData <- transform(plotData, DateTime=as.POSIXct(paste(plotData$Date, plotData$Time)))

#Make base plot
png(file = "plot3.png", bg = "transparent", width = 480, height = 480)
plot(x=plotData$DateTime, y=as.numeric(plotData$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")

#Add additional points
points(x=plotData$DateTime, y=as.numeric(plotData$Sub_metering_2), type="l", col="red")
points(x=plotData$DateTime, y=as.numeric(plotData$Sub_metering_3), type="l", col="blue")

#Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","blue","red"))

dev.off()

print("OK, plot done.")
