library("date", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.1")
setwd("~/Documents/MOOC/Coursera/DS/ExplDataAnalysis")

hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- subset(hpc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

png(file="plot2.png",width=480,height=480,type="cairo",bg="transparent")
plot(hpc$Time, hpc$Global_active_power, type='l', xlab = NA, ylab = 'Global Active Power (kilowatts)')
dev.off()