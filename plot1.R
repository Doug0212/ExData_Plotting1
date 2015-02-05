# Set path
setwd("C:/DataScience/ExploratoryDataAnalysis/Project1")

# Read household_power_consumption.txt file into variable
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Convert date column from text to Date
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# Get subset of rows where date equals 02/01/2007 and 02/02/2007 and merge files
hpc1 <- hpc[hpc$Date == "2007-02-01",]
hpc2 <- hpc[hpc$Date == "2007-02-02",]
hpc3 <- rbind(hpc1, hpc2)

# Convert global active power column to numeric
hpc3$Global_active_power <- as.numeric(as.character(hpc3$Global_active_power))

# Open png device and set width and height
png(filename = "plot1.png",
    width = 480, height = 480)

# Generate histogram
hist(hpc3$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

# Turn graphic device off
dev.off()
