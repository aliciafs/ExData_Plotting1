
library(data.table)
library(lubridate)


setwd ("H:/Coursera/Exploratory data analysis/exdata-data-household_power_consumption")


data<-read.table("H:/Coursera/Exploratory data analysis/exdata-data-household_power_consumption/household_power_consumption.txt"
                 ,header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE, na.strings=c("NA", "-", "?"))

Subset<-dmy(data$Date)>=ymd("2007-02-01") & dmy(data$Date)<=ymd("2007-02-02")

data_subset <- data[Subset,]
head(data_subset)

plot1<-hist (data_subset$Global_active_power, col="red", xlab= "Global Active Power (kilowatts)", main= "Global Active Power")

dev.copy(png, file="H:/Coursera/Exploratory data analysis/plot1.png")
dev.off()