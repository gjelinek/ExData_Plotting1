library("date", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.1")
setwd("~/Documents/MOOC/Coursera/DS/ExplDataAnalysis")

hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- subset(hpc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

png(file="plot4.png",width=480,height=480,type="cairo",bg="transparent")
par(mfrow = c(2, 2))
plot(hpc$Time, hpc$Global_active_power, type='l', xlab = NA, ylab = 'Global Active Power')

plot(hpc$Time, hpc$Voltage, type='l', xlab = 'datetime', ylab = 'Voltage')

plot(hpc$Time, hpc$Sub_metering_1, type='l', xlab = NA, ylab = 'Energy sub metering')
lines(hpc$Time, hpc$Sub_metering_2, col = 'red')
lines(hpc$Time, hpc$Sub_metering_3, col = 'blue')
legend("topright", bty = 'n', lty=c(1,1,1), col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

plot(hpc$Time, hpc$Global_reactive_power, type='l', xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()