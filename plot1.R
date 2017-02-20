# run if data not loaded
if(!"Global_active_power" %in% colnames(data)) {
  source('readData.R')
}

plot1 <- function() {
  hist(data$Global_active_power, col = c("red"), 
       xlab = "Global Active Power", 
       ylab = "Frequency", main = "Global Active Power")
}

# make the plot
par(mfrow = c(1, 1))
plot1()
png('plot1.png', width = 480, height = 480)
plot1()
dev.off()