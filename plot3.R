# need modifications from plot2.R
if(!"UnixTime" %in% colnames(data)) {
  source('plot2.R')
}

plot3 <- function() {
  plot(x = data2$UnixTime, y = data$Sub_metering_1, type = 'l',
       ylab = "Energy sub metering",
       xaxt = 'n', xlab = '', col = "black"
  )
  lines(x = data2$UnixTime, y = data$Sub_metering_2, col = "red")
  lines(x = data2$UnixTime, y = data$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"), lty = 1)
}

png('plot3.png', width = 480, height = 480)
plot3()
dev.off()