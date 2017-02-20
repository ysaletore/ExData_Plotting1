# run if data not loaded
source('readData.R')

# make the plot
png('plot1.png', width = 480, height = 480)
hist(data$Global_active_power, col = c("red"), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()