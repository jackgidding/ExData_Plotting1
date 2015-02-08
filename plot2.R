## plot1.R
## Author: Jack Gidding
## 

## Purpose: Generate the 2nd chart for the Exploratory Data Analysis course
##          Project 1.
##  
##          The chart is a x-y plot of the UCI data, Global Active Power,
##          minute-by-minute samples during January and February 2007. 
##          The x-label, y-label and title are set programmatically. 
##
## Output:  plot2.png
##
## Notes:   Please see the README.md for further information

## Load and prepare the UCI data once, since it is a time expensive operation.
## If the UCI data is already in memory, it does not need to be reloaded for
## each chart.

if (!exists("uci")) {
  source("loadUCI.R")
}

## Create the x-y plot
plot(uci$Date_Time, uci$Global_active_power, 
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)", 
     main="")

## Create the PNG of the plot
dev.copy(png, file="plot2.png")
dev.off()
