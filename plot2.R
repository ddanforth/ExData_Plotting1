# R program for plot 2
library(datasets)

#Get the data
myData <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";")

#Format Date to Subset
myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")

#Subset data by date range
plotData <- subset(myData, myData$Date >= "2007-02-01" & myData$Date <= "2007-02-02")

#Merge the Date and Time columns to use in plot
plotData <- transform(plotData, DateTime=as.POSIXct(paste(plotData$Date, plotData$Time)))

#Make plot
png(file = "plot2.png", width = 480, height = 480)
plot(x=plotData$DateTime, y=as.numeric(plotData$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

print("OK, plot done.")


