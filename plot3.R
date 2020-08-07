# read data 
df <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")

# select rows corresponding to dates "1/2/2007" or "2/2/2007"
df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")

df <- mutate(df, DateTime = strptime(paste(Date, " ", Time), 
                                      "%d/%m/%Y %H:%M:%S"))

# create a blank 480x480 PNG file
png(file="plot3.png", width=480, height=480)

# create the scatterplots to be displayed in the PNG file
with(df, plot(DateTime, Sub_metering_1, type = "n", 
               xlab = "", ylab = "Energy sub metering"))
with(df, points(DateTime, Sub_metering_1, type = "l"))
with(df, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(df, points(DateTime, Sub_metering_3, type = "l", col = "blue"))

# add a legend
legend("topright", 
       lty = c(1, 1, 1), 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the PNG graphic device
dev.off()