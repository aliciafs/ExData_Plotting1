library(data.table)
library(lubridate)
library(dplyr) 

setwd ("H:/Coursera/Exploratory data analysis/exdata-data-household_power_consumption")


data<-read.table("H:/Coursera/Exploratory data analysis/exdata-data-household_power_consumption/household_power_consumption.txt"
                 ,header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE, na.strings=c("NA", "-", "?"))

Subset<-dmy(data$Date)>=ymd("2007-02-01") & dmy(data$Date)<=ymd("2007-02-02")

data_subset <- data[Subset,]
data_subset2 <- mutate(data_subset, Time =dmy_hms(paste(data_subset$Date, data_subset$Time)))

plot2<-plot(data_subset2$Time,data_subset2$Global_active_power, xlab= "", ylab= "Global Active Power (kilowatts)", type="n")
lines(data_subset2$Time,data_subset2$Global_active_power)

dev.copy(png, file="H:/Coursera/Exploratory data analysis/plot2.png")
dev.off()    


