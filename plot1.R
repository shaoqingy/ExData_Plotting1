#read txt table
power_consumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

#subset for the 2 days
power_consumption$Date <- as.Date(power_consumption$Date,format="%d/%m/%Y")
sub_power_consumption <- subset(power_consumption, Date == "2007-02-01" | Date == "2007-02-02")

sub_power_consumption$Global_active_power <- as.numeric(as.character(sub_power_consumption$Global_active_power))

#plotting
png("plot1.png", width=480, height=480)
hist(sub_power_consumption$Global_active_power, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
