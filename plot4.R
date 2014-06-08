mydir<-"C:/myR"
myds<-read.csv(file=paste(mydir, "/household_power_consumption.txt", sep=""), skip=66637, header=FALSE, nrow=2880, sep=";", stringsAsFactors=FALSE)
names(myds)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
myds$DateTime <- strptime(paste(myds$Date, myds$Time), "%d/%m/%Y %H:%M:%S")

png(file =paste(mydir, "/plot4.png", sep=""), width = 480, height = 480)
    
par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(myds, {
     plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
     plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
     plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
     lines(DateTime, Sub_metering_2, type="l", col="red")
     lines(DateTime, Sub_metering_3, type="l", col="blue")
     mycols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
     legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=mycols)
     plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")        
    })    
dev.off()
