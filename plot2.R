# Create the line chart seen in plot 2.

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
png("plot2.png")

# Plot function.
plot(new.dat$Global_active_power ~ new.dat$timestamp,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

# Close plot function.
dev.off()