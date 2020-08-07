# read data 
df <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")

# select rows corresponding to dates "1/2/2007" or "2/2/2007"
df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")

# create a blank 480x480 PNG file
png(file="plot1.png", width=480, height=480)

# create the histogram to be displayed in the PNG file
hist(df$Global_active_power, col = "red", main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# close the PNG graphic device
dev.off()