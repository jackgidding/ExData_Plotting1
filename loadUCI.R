## loadUCI.R
## Author: Jack Gidding
## 

## Purpose: Laod the UCI data from file and prep for use 
##
## Notes:   Please see the README.md for further information

library(lubridate)

## Verify that the data set file is present
if (!file.exists("./household_power_consumption.txt")) {
  stop("Dataset not present.")
}

## Read in the data from th expected file
uci <- read.table("household_power_consumption.txt", sep=";", colClasses="character", na.strings=c("?"))

## The first row contains the names. Set the names of the data table to the names 
## and remove the first row of the DT.
names(uci) <- uci[1,]
uci <- uci[-c(1),]

## Combine the data and time into one column for parsing
uci[,1] <- paste(uci[,1], uci[,2])

## Parse column 1 that has both date and time. Use lubridate's parse_date_time
uci[,1] <- parse_date_time(uci[,1],"d! m*! y*! H! M! S!")

## Set the name of column 1 to represet the data properly
names(uci)[1] <- c("Date_Time")

## Remove the time column from the DT now that it is represented in col 1
uci <- uci[-c(2)]

## Filter the columns based on dates
uci <- uci[(year(uci[,1])==2007 & month(uci[,1])==2 & day(uci[,1])<3),]

## Convert the rest of the columns to numeric
uci[,2] <- as.numeric(uci[,2])
uci[,3] <- as.numeric(uci[,3])
uci[,4] <- as.numeric(uci[,4])
uci[,5] <- as.numeric(uci[,5])
uci[,6] <- as.numeric(uci[,6])
uci[,7] <- as.numeric(uci[,7])
uci[,8] <- as.numeric(uci[,8])
