mydir<-"C:/myR"
myds<-read.csv(file=paste(mydir, "/household_power_consumption.txt", sep=""), skip=66637, header=FALSE, nrow=2880, sep=";", stringsAsFactors=FALSE)
names(myds)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
myds$DateTime <- strptime(paste(myds$Date, myds$Time), "%d/%m/%Y %H:%M:%S")
png(file =paste(mydir, "/plot3.png", sep=""), width = 480, height = 480)
plot(myds$DateTime, myds$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(myds$DateTime, myds$Sub_metering_2, type="l", col="red")
lines(myds$DateTime, myds$Sub_metering_3, type="l", col="blue")
mycols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=mycols)
dev.off()
