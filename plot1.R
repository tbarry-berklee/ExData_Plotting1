## load in and subset data - this assumes dataset is in data subdirectory of working directory
full_data_set <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
two_days <- subset(full_data_set, Date == "1/2/2007" | Date == "2/2/2007")

##open file device
png(filename = "plot1.png", width = 480, height = 480)
## ensure we are using 1 by 1 grid
par(mfrow = c(1, 1))
##create plot
hist(two_days$Global_active_power, freq = TRUE, main = "Global Active Power", col ="red", xlab = "Global Active Power (kilowatts)")

dev.off()