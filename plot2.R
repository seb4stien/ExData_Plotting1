# Date source : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Downloaded on : 12/10/2014


library(data.table)
dt <- as.data.table(read.table("household_power_consumption.txt", na.strings="?", header=TRUE, sep=";"))
d <- dt[Date == "1/2/2007" | Date == "2/2/2007",]
png(filename="plot2.png", width=480, height=480)
d[,myTime:=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M	:%S"))]
plot(d$myTime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
