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

# Convert global reactive power column to numeric
hpc3$Global_reactive_power <- as.numeric(as.character(hpc3$Global_reactive_power))

# Convert voltage column to numeric
hpc3$Voltage <- as.numeric(as.character(hpc3$Voltage))

# Convert sub-metering 1, 2 and 3 columns to numeric
hpc3$Sub_metering_1 <- as.numeric(as.character(hpc3$Sub_metering_1))
hpc3$Sub_metering_2 <- as.numeric(as.character(hpc3$Sub_metering_2))
hpc3$Sub_metering_3 <- as.numeric(as.character(hpc3$Sub_metering_3))


# Open png device and set width and height
png(filename = "plot4.png",
    width = 480, height = 480)

# Define graph panel
par(mfrow=c(2,2))

# Generate graph 1 - upper left
plot(hpc3$DateTime, hpc3$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")


# Generate graph 2 - upper right
plot(hpc3$DateTime, hpc3$Voltage, type="l",
     xlab="datetime", ylab="Voltage")


# Generate graph 3 - lower left
plot(hpc3$DateTime, hpc3$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

lines(hpc3$DateTime, hpc3$Sub_metering_2, type="l", col="red")

lines(hpc3$DateTime, hpc3$Sub_metering_3, type="l", col="blue")

# Add legend
legend("topright", pch = "____", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Generate graph 4 - lower right
plot(hpc3$DateTime, hpc3$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")


# Turn graphic device off
dev.off()









#par(mfrow=c(2,2))
#plot(wt,mpg, main="Scatterplot of wt vs. mpg")
#plot(wt,disp, main="Scatterplot of wt vs disp")
#hist(wt, main="Histogram of wt")
#boxplot(wt, main="Boxplot of wt")
