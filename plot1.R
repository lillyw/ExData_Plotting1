mydir<-"C:/myR"
myds<-read.csv(file=paste(mydir, "/household_power_consumption.txt", sep=""), skip=66637, header=FALSE, nrow=2880, sep=";", stringsAsFactors=FALSE) 
names(myds)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
png(file =paste(mydir, "/plot1.png", sep=""), width = 480, height = 480)
hist(myds$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off
