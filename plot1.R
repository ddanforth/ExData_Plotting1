# R program for plot 1
library(datasets)

#Get the data
myData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Format Date to more easily subset
myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")

#Grab subset of data by date range
plotData <- subset(myData, myData$Date >= "2007-02-01" & myData$Date <= "2007-02-02")

#Convert factors to numeric without losing data
plotData$Global_active_power <- as.numeric(levels(plotData$Global_active_power))[plotData$Global_active_power]

#Make the plot as png file
png(file = "plot1.png", width = 480, height = 480)
hist(as.numeric(plotData$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

print("OK, plot done.")

