# read in all data
data <- read.delim('household_power_consumption.txt', sep=';', header <- T, stringsAsFactors = F)
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data$Time = strptime(data$Time, format = "%H:%M:%S")
data$Global_active_power = as.numeric(data$Global_active_power)


# filter data
begin <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
filt <- apply(data, 1, function(X) {
  if(X["Date"] >= begin && X["Date"] <= end) {
    return(TRUE)
  } else {
    return(FALSE)
  }
})

data = data[filt,]
