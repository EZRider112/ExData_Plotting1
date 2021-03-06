## Assumes your working directory contains the initial file for reading

PowerData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")  ## read in file

PowerData$Date <- as.Date(PowerData$Date, "%d/%m/%Y")  ## convert date column to date

PowerDataDates <- subset(PowerData, Date >="2007/02/01" & Date <= "2007/02/02")  ## create subset of data

PowerDataDates$FullTime <- as.POSIXct(paste(PowerDataDates$Date, PowerDataDates$Time), "%d/%m/%Y %H:%M:%S")  ## combines date and time

PowerDataDates$Global_active_power2 <- as.numeric(as.character(PowerDataDates$Global_active_power)) ## convert GAP to numeric
PowerDataDates$Sub_metering_12 <- as.numeric(as.character(PowerDataDates$Sub_metering_1)) ## convert to numeric
PowerDataDates$Sub_metering_22 <- as.numeric(as.character(PowerDataDates$Sub_metering_2)) ## convert to numeric
PowerDataDates$Sub_metering_32 <- as.numeric(as.character(PowerDataDates$Sub_metering_3)) ## convert to numeric

par(mfrow = c(1, 1))  ## set up 1 X 1 window output

plot(PowerDataDates$FullTime, PowerDataDates$Sub_metering_12, type = "l", col = "black", xlab = "", ylab = "Energy sub metering") ## create initial plot
points(PowerDataDates$FullTime, PowerDataDates$Sub_metering_22, type = "l", col = "red")  ## add submetering 2
points(PowerDataDates$FullTime, PowerDataDates$Sub_metering_32, type = "l", col = "blue")  ## add submetering 3

legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'), cex=.75)  ## display legend

dev.copy(png, file = "plot3.png", width = 480, height = 480)  #create PNG file
dev.off()  ##close the PNG device