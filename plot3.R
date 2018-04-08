power_consumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

#subset for the 2 days
power_consumption$DateTime <- strptime(paste(power_consumption$Date, power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_consumption$Date <- as.Date(power_consumption$Date,format="%d/%m/%Y")
sub_power_consumption <- subset(power_consumption, Date == "2007-02-01" | Date == "2007-02-02")


sub_power_consumption$Sub_metering_1 <- as.numeric(as.character(sub_power_consumption$Sub_metering_1))
sub_power_consumption$Sub_metering_2 <- as.numeric(as.character(sub_power_consumption$Sub_metering_2))
sub_power_consumption$Sub_metering_3 <- as.numeric(as.character(sub_power_consumption$Sub_metering_3))

#plotting
png("plot3.png", width=480, height=480)
plot(sub_power_consumption$DateTime,sub_power_consumption$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(sub_power_consumption,lines(DateTime,Sub_metering_1,col="black"))
with(sub_power_consumption,lines(DateTime,Sub_metering_2,col="red"))
with(sub_power_consumption,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()