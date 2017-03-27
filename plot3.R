# This code generates the third plot.

library("data.table")
# Read in the data set from the file.
dat <- fread("household_power_consumption.txt",na.strings = "?")

# Convert dates and add them in a column with type Date.
dat$newDate <- as.Date(dat$Date,"%d/%m/%Y")

# Subset the dates in question.
new.dat <- subset(dat, dat$newDate >= as.Date("2007-2-1") & dat$newDate <= as.Date("2007-2-2"))

# Create a timestamp variable. 
new.dat$timestamp<-as.POSIXct(paste(new.dat$Date, new.dat$Time), tz = "GMT",format = "%d/%m/%Y %H:%M:%S")

# Open the screen device.
png("plot3.png")

# Plot function including function for additional lines and legend.
plot(new.dat$Sub_metering_1 ~ new.dat$timestamp,type = "l",xlab = "",ylab = "Energy sub metering")
lines(new.dat$Sub_metering_2 ~ new.dat$timestamp, col = "red")
lines(new.dat$Sub_metering_3 ~ new.dat$timestamp, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)

# Close the plot device.
dev.off()