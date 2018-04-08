power_consumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

#subset for the 2 days
power_consumption$DateTime <- strptime(paste(power_consumption$Date, power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_consumption$Date <- as.Date(power_consumption$Date,format="%d/%m/%Y")
sub_power_consumption <- subset(power_consumption, Date == "2007-02-01" | Date == "2007-02-02") # filter

sub_power_consumption$Global_active_power <- as.numeric(as.character(sub_power_consumption$Global_active_power))
sub_power_consumption$Global_reactive_power <- as.numeric(as.character(sub_power_consumption$Global_reactive_power))
sub_power_consumption$Voltage <- as.numeric(as.character(sub_power_consumption$Voltage))
sub_power_consumption$Sub_metering_1 <- as.numeric(as.character(sub_power_consumption$Sub_metering_1))
sub_power_consumption$Sub_metering_2 <- as.numeric(as.character(sub_power_consumption$Sub_metering_2))
sub_power_consumption$Sub_metering_3 <- as.numeric(as.character(sub_power_consumption$Sub_metering_3))


#plotting
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

  with(sub_power_consumption, plot(DateTime,Global_active_power,type="l", xlab="",ylab="Global Active Power"))
  with(sub_power_consumption, plot(DateTime,Voltage, type="l",xlab="datetime",ylab="Voltage"))

  with(sub_power_consumption, plot(DateTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
    with(sub_power_consumption, lines(DateTime,Sub_metering_1,col="black"))
    with(sub_power_consumption, lines(DateTime,Sub_metering_2,col="red"))
    with(sub_power_consumption, lines(DateTime,Sub_metering_3,col="blue"))
  legend("topright", lty=1, bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  
  with(sub_power_consumption, plot(DateTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()