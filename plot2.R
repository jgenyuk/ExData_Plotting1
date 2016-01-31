#read data
data <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

#select date range
subdata <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

#create plot
png("plot2.png")
with(subdata, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), as.numeric(Global_active_power), 
                   type = "l", xlab = "", ylab = "Global active power (kilowatts)"))

#copy to png
dev.off()