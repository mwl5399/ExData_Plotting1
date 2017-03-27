# This code creates the first plot
 library("data.table")
 
 # Read in dataset.
 dat <- fread("household_power_consumption.txt",na.strings = "?")
 
 # Convert dates and add them in a column with type Date.
 dat$newDate <- as.Date(dat$Date,"%d/%m/%Y")
 
 # Subset the dates in question.
 new.dat <- subset(dat, dat$newDate >= as.Date("2007-2-1") & dat$newDate <= as.Date("2007-2-2"))
 
 # Open plot device to hold our new plot.
 png("plot1.png")
 
 # Create plot specified.
 hist(new.dat$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
 
 # Save plot and close.
 dev.off()