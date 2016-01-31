#read data
data <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

#select date range
subdata <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

#get columns
sm1 <- as.numeric(subdata[,"Sub_metering_1"])
sm2 <- as.numeric(subdata[,"Sub_metering_2"])
sm3 <- as.numeric(subdata[,"Sub_metering_3"])

#get times
datetimes <- paste(subdata[,"Date"], subdata[,"Time"])
times <- strptime(datetimes, "%d/%m/%Y %H:%M:%S")

#create plot
png("plot3.png")
plot(times,sm1, type="l", xlab = "", ylab = "Energy sub metering")
points(times,sm2,type="l",col="red")
points(times,sm3,type="l",col="blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), text.col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#copy to png
dev.off()