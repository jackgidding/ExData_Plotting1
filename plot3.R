## plot3.R
## Author: Jack Gidding
## 

## Purpose: Generate the 2nd chart for the Exploratory Data Analysis course
##          Project 1.
##  
##          The chart is a multi-variable x-y plot of the UCI data, Sub-metering data,
##          minute-by-minute samples during January and February 2007. 
##          The x-label, y-label and title are set programmatically. 
##
## Output:  plot3.png
##
## Notes:   Please see the README.md for further information

## Load and prepare the UCI data once, since it is a time expensive operation.
## If the UCI data is already in memory, it does not need to be reloaded for
## each chart. Code separated to another file to avoid repeating in each chart.

if (!exists("uci")) {
  source("loadUCI.R")
}

## Create the x-y plot
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
       y.intersp=0.5,
       cex=0.6,
       lty=1)

## Create the PNG of the plot
dev.copy(png, file="plot3.png")
dev.off()
