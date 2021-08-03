df <- read_delim("household_power_consumption.txt", ";")
df2 <- subset(df, Date ==  "1/2/2007" | Date == "2/2/2007")
df2$Datetime <- paste(df2$Date, df2$Time)
df2$Datetime <- dmy_hms(df2$Datetime)
par(mfcol = c(2,2))
plot(df2$Datetime, df2$Global_active_power, type = "l", xlab = "", ylab = "Global active power")
plot(df2$Datetime, df2$Sub_metering_1, 
     type = "n", ylab = "Energy sub metering",
     xlab = "")
legend('topright',
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, cex = 0.1)
lines(df2$Datetime, df2$Sub_metering_3, col = "blue")
lines(df2$Datetime, df2$Sub_metering_2, col = "red")
lines(df2$Datetime, df2$Sub_metering_1, col = "black")

plot(df2$Datetime, df2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(df2$Datetime, df2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
