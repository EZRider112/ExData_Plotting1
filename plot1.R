## Assumes your working directory contains the initial file for reading

PowerData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")  ## read in file

PowerData$Date <- as.Date(PowerData$Date, "%d/%m/%Y")  ## convert date column to data

PowerDataDates <- subset(PowerData, Date >="2007/02/01" & Date <= "2007/02/02")  ## create subset of data

PowerDataDates$Global_active_power2 <- as.numeric(as.character(PowerDataDates$Global_active_power)) ## convert GAP to numeric

par(mfrow = c(1, 1))  ## set up 1 X 1 window output

hist(PowerDataDates$Global_active_power2, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")  ## create histogram

dev.copy(png, file = "plot1.png", width = 480, height = 480)  #create PNG file
dev.off()  ##close the PNG device

