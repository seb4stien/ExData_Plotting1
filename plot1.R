# Date source : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Downloaded on : 12/10/2014


library(data.table)

dt <- as.data.table(read.table("household_power_consumption.txt", na.strings="?", header=TRUE, sep=";"))
d <- dt[Date == "1/2/2007" | Date == "2/2/2007",]
png(filename="plot1.png", width=480, height=480)
hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()