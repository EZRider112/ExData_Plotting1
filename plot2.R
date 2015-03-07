## Assumes your working directory contains the initial file for reading

PowerData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")  ## read in file

PowerData$Date <- as.Date(PowerData$Date, "%d/%m/%Y")  ## convert date column to date

PowerDataDates <- subset(PowerData, Date >="2007/02/01" & Date <= "2007/02/02")  ## create subset of data

PowerDataDates$FullTime <- as.POSIXct(paste(PowerDataDates$Date, PowerDataDates$Time), "%d/%m/%Y %H:%M:%S")  ## combines date and time

PowerDataDates$Global_active_power2 <- as.numeric(as.character(PowerDataDates$Global_active_power)) ## convert GAP to numeric

par(mfrow = c(1, 1))  ## set up 1 X 1 window output

plot(PowerDataDates$FullTime, PowerDataDates$Global_active_power2, type = "l", xlab="", ylab="Global Active Power (kilowatts)")## create plot
dev.copy(png, file = "plot2.png", width = 480, height = 480)  #create PNG file
dev.off()  ##close the PNG device
