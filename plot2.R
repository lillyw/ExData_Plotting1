mydir<-"C:/myR"
myds<-read.csv(file=paste(mydir, "/household_power_consumption.txt", sep=""), skip=66637, header=FALSE, nrow=2880, sep=";", stringsAsFactors=FALSE)
names(myds)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
myds$DateTime <- strptime(paste(myds$Date, myds$Time), "%d/%m/%Y %H:%M:%S")
png(file=paste(mydir, "/plot.png2", sep=""), width = 480, height = 480)
plot(myds$DateTime, myds$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off
