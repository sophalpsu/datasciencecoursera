# read data 
df <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")

# select rows corresponding to dates "1/2/2007" or "2/2/2007"
df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")

df <- mutate(df, DateTime = strptime(paste(Date, " ", Time), 
                                      "%d/%m/%Y %H:%M:%S"))

# create a blank 480x480 PNG file
png(file="plot4.png", width=480, height=480)

par(mfrow = c(2, 2))
## first plot
with(df, plot(DateTime, Global_active_power, type = "l", 
              xlab = "", ylab = "Global Active Power"))

## second plot
with(df, plot(DateTime, Voltage, type = "l", 
              xlab = "datetime", ylab = "Voltage"))

## third plot 
with(df, plot(DateTime, Sub_metering_1, type = "n", 
               xlab = "", ylab = "Energy sub metering"))
with(df, points(DateTime, Sub_metering_1, type = "l"))
with(df, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(df, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", 
       lty = c(1, 1, 1),  bty = "n",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## fourth plot
with(df, plot(DateTime, Global_reactive_power, type = "l", 
              xlab = "datetime", ylab = "Global_reactive_power"))

# close the PNG graphic device
dev.off()