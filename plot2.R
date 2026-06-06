## load in and subset data - this assumes dataset is in data subdirectory of working directory
full_data_set <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
two_days <- subset(full_data_set, Date == "1/2/2007" | Date == "2/2/2007")

## add column with formatted date_time
two_days$DateTime <- strptime(paste(two_days$Date, two_days$Time), format = "%d/%m/%Y %H:%M:%S") 

##open file device
png(filename = "plot2.png", width = 480, height = 480)
## ensure we are using 1 by 1 grid
par(mfrow = c(1, 1))
##create plot - leave of X axis labels to start
plot(two_days$DateTime, two_days$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l", xaxt = "n")
##add abrv weekday names to X axis
ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))
axis.POSIXct(1, at = ticks, format = "%a")
dev.off()