# Hi guys! Thank you for checking out the graph. I'm colorblind, so I'm sorry if the colors are off :). Cheers!
#opening file device
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

#reading in data
data <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)

#creating dataframe
x <- subset(data, data$Date == "1/2/2007")
y <- subset(data, data$Date == "2/2/2007")
data2 <- rbind(x,y)
data2$Date <- as.Date(data2$Date,format="%d/%m/%Y")
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")

#making plot 3
with(data2, {
		plot(DateTime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab=" ")
			lines(DateTime, Sub_metering_2, data2$Sub_metering_2, type="l", col="red")
			lines(DateTime, Sub_metering_3, type="l", col="blue")
			legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
})

#closing file device
dev.off()