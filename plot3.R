library(data.table)
library(lubridate)
library(dplyr) 

setwd ("H:/Coursera/Exploratory data analysis/exdata-data-household_power_consumption")


data<-read.table("H:/Coursera/Exploratory data analysis/exdata-data-household_power_consumption/household_power_consumption.txt"
                 ,header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE, na.strings=c("NA", "-", "?"))

Subset<-dmy(data$Date)>=ymd("2007-02-01") & dmy(data$Date)<=ymd("2007-02-02")

data_subset <- data[Subset,]
data_subset2 <- mutate(data_subset, Time =dmy_hms(paste(data_subset$Date, data_subset$Time)))

png(width = 480, height = 480, file ="H:/Coursera/Exploratory data analysis/plot3.png")

plot3<-plot(data_subset2$Time,data_subset2$Sub_metering_1, xlab= "", ylab= "Energy sub metering", type="n")


lines(data_subset2$Time, data_subset2$Sub_metering_1)
lines(data_subset2$Time, data_subset2$Sub_metering_2, col="red")
lines(data_subset2$Time, data_subset2$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty = c(1,1,1))

dev.off()    
   

