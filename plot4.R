## plot1.R
## Author: Jack Gidding
## 

## Purpose: Generate the 2nd chart for the Exploratory Data Analysis course
##          Project 1.
##  
##          The chart is a multiple x-y plot of the UCI data, Sub-metering data,
##          minute-by-minute samples during January and February 2007. 
##          The x-label, y-label and title are set programmatically. 
##
## Output:  plot3.png
##
## Notes:   Please see the README.md for further information

## Load and prepare the UCI data once, since it is a time expensive operation.
## If the UCI data is already in memory, it does not need to be reloaded for
## each chart.

if (!exists("uci")) {
  source("loadUCI.R")
}

## Set the canvas up for 2x2 charts
par(mfrow=c(2,2), mar=c(4,4,3,3), oma=c(1,1,1,1))

## Create the 1st x-y plot (topleft)
plot(uci$Date_Time, uci$Global_active_power, 
     type="l", 
     xlab="",
     ylab="Global Active Power", 
     main="")

## Create the 2nd x-y plot (topright)
plot(uci$Date_Time, uci$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

## Create the 3rd x-y plot (bottomleft)
plot(uci$Date_Time, uci$Sub_metering_1, 
     type="l", 
     xlab="",
     ylab="Energy sub metering", 
     main="")

## Add the second data set
lines(uci$Date_Time, uci$Sub_metering_2, 
      type="l",
      col="red")

## Add the third data set
lines(uci$Date_Time, uci$Sub_metering_3, 
      type="l",
      col="blue")

## Add the legend. Adjust with cex and y.intersp to make it smaller
legend("topright", 
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       y.intersp=0.25,
       cex=0.55,
       box.lwd=0,
       lty=1
       )

## Create the 4th x-y plot (bottomright)
plot(uci$Date_Time, uci$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

## Create the PNG of the plot
dev.copy(png, file="plot4.png")
dev.off()
