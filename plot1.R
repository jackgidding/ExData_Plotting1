## plot1.R
## Author: Jack Gidding
## 

## Purpose: Generate the 1st chart for the Exploratory Data Analysis course
##          Project 1.
##  
##          The chart is a histogram of the UCI data, Global Active Power,
##          minute-by-minute samples during January and February 2007. 
##          The x-label and title are set programmatically. The y-axis is
##          the default label. 
##
## Output:  plot1.png
##
## Notes:   Please see the README.md for further information

## Load and prepare the UCI data once, since it is a time expensive operation.
## If the UCI data is already in memory, it does not need to be reloaded for
## each chart.

if (!exists("uci")) {
  source("loadUCI.R")
}

## Create the histogram
hist(uci$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

## Create the PNG of the plot
dev.copy(png, file="plot1.png")
dev.off()
