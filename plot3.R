# Date source : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Downloaded on : 12/10/2014

Sys.setlocale("LC_TIME","English United States")

library(data.table)
dt <- as.data.table(read.table("household_power_consumption.txt", na.strings="?", header=TRUE, sep=";"))
d <- dt[Date == "1/2/2007" | Date == "2/2/2007",]
d[,datetime:=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M  :%S"))]
png(filename="plot3.png", width=480, height=480)
plot(d$datetime, d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(d$datetime, d$Sub_metering_2, type="l", col="red")
points(d$datetime, d$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red", "blue"))
dev.off()
