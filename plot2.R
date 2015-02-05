# Set path
setwd("C:/DataScience/ExploratoryDataAnalysis/Project1")

# Read household_power_consumption.txt file into variable
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Get subset of rows where date equals 02/01/2007 and 02/02/2007 and merge files
hpc1 <- hpc[hpc$Date == "1/2/2007",]
hpc2 <- hpc[hpc$Date == "2/2/2007",]
hpc3 <- rbind(hpc1, hpc2)

# Add a new blank column - DateTime 
hpc3["DateTime"] <- ""

# Paste Date and Time column together and put in new column DateTime
hpc3$DateTime <- paste(hpc3$Date, hpc3$Time, sep=" ")

# Convert DateTime column from character to date/time
hpc3$DateTime <- strptime(hpc3$DateTime, "%d/%m/%Y %H:%M:%S")

# Convert global active power column to numeric
hpc3$Global_active_power <- as.numeric(as.character(hpc3$Global_active_power))

# Open png device and set width and height
png(filename = "plot2.png",
    width = 480, height = 480)

# Generate line graph
plot(hpc3$DateTime, hpc3$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

# Turn graphic device off
dev.off()

