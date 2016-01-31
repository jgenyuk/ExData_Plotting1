#read data
data <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

#select date range
subdata <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

#create plot
png("plot1.png")
with(subdata,hist(as.numeric(Global_active_power), main="Global active power", col="red", xlab = "Global active power (kilowatts)"))

#copy to png
dev.off()