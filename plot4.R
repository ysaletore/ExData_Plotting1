# run if data not loaded
if(!exists("plot3")) {
  source('plot3.R')
}

plot4b <- function() {
  plot(x = data2$UnixTime, y = data$Voltage, type = 'l',
       ylab = "Voltage",
       xaxt = 'n', xlab = 'datetime', col = "black"
  )
  
  axis(1, at = c(data2$UnixTime[1], data2$UnixTime[nrow(data2) / 2], data2$UnixTime[nrow(data2)]), 
       labels = c("Thu", "Fri", "Sat"))
}

plot4d <- function() {
  plot(x = data2$UnixTime, y = data$Global_reactive_power, type = 'l',
       ylab = "Global_reactive_power",
       xaxt = 'n', xlab = 'datetime', col = "black"
  )
  
  axis(1, at = c(data2$UnixTime[1], data2$UnixTime[nrow(data2) / 2], data2$UnixTime[nrow(data2)]), 
       labels = c("Thu", "Fri", "Sat"))
}

plot4 <- function() {
  par(mfrow = c(2, 2))
  plot2('')
  plot4b()
  plot3()
  plot4d()
}

plot4()
png('plot4.png', width = 480, height = 480)
plot4()
dev.off()