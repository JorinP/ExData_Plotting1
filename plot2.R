# Hi guys! Thank you for checking out the graph. I'm colorblind, so I'm sorry if the colors are off :). Cheers!
#opening file device
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

#reading in data
data <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)

#creating dataframe
x <- subset(data, data$Date == "1/2/2007")
y <- subset(data, data$Date == "2/2/2007")
data2 <- rbind(x,y)
data2$Date <- as.Date(data2$Date,format="%d/%m/%Y")
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")

#making plot with lines
with(data2, plot(DateTime, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab=" "))

#closing file device
dev.off()