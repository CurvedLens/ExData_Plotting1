df <- read_delim("household_power_consumption.txt", ";")
df2 <- subset(df, Date ==  "1/2/2007" | Date == "2/2/2007")
df2$Datetime <- paste(df2$Date, df2$Time)
df2$Datetime <- dmy_hms(df2$Datetime)
plot(df2$Datetime, df2$Sub_metering_1, 
     type = "n", ylab = "Energy sub metering",
     xlab = "")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
lines(df2$Datetime, df2$Sub_metering_3, col = "blue")
lines(df2$Datetime, df2$Sub_metering_2, col = "red")
lines(df2$Datetime, df2$Sub_metering_1, col = "black")