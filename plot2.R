# read data 
df <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")

# select rows corresponding to dates "1/2/2007" or "2/2/2007"
df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")

df <- mutate(df, DateTime = strptime(paste(Date, " ", Time), 
                                      "%d/%m/%Y %H:%M:%S"))

# create a blank 480x480 PNG file
png(file="plot2.png", width=480, height=480)

# create the scatterplot to be displayed in the PNG file
with(df, plot(DateTime, Global_active_power, type = "l", 
               xlab = "", ylab = "Global Active Power (kilowatts)"))

# close the PNG graphic device
dev.off()