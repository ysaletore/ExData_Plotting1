# run if data not loaded
if(!"Global_active_power" %in% colnames(data)) {
  source('readData.R')
}

# copy and transform data
data2 <- data
data2$Day <- substr(weekdays(data$Date), 0, 3)
data2 <- data2[data2$Day %in% c("Thu", "Fri", "Sat"),]
data2$Day <- factor(data2$Day, levels = c("Thu", "Fri", "Sat"))
data2$Time2 <- data2$Time
data2$Time2[data2$Day == "Fri"] <- data2$Time2[data2$Day == "Fri"] + 24 * 60 * 60
data2$Time2[data2$Day == "Sat"] <- data2$Time2[data2$Day == "Sat"] + 24 * 60 * 60 * 2
data2$UnixTime <- as.numeric(as.POSIXct(data2$Time2))

plot2 <- function(label = "(kilowatts)") {
  plot(x = data2$UnixTime, y = data$Global_active_power, type = 'l',
       ylab = paste("Global Active Power", label, sep = " "),
       xaxt = 'n', xlab = '')
  
  axis(1, at = c(data2$UnixTime[1], data2$UnixTime[nrow(data2) / 2], data2$UnixTime[nrow(data2)]), 
       labels = c("Thu", "Fri", "Sat"))
}

par(mfrow = c(1, 1))
plot2()
png('plot2.png', width = 480, height = 480)
plot2()
dev.off()