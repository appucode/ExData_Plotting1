library(dplyr)
library(lubridate)

df <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")


#filter only 2007-02-01 and 2007-02-02 date data

df <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]

x_val <- strptime(paste(df$Date, df$Time, sep = ""), format = "%Y-%m-%d %H:%M:%S")

y1_val <- as.numeric(df$Sub_metering_1)
y2_val <- as.numeric(df$Sub_metering_2)
y3_val <- as.numeric(df$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480)

plot(x = x_val, y = y1_val, type = 'l', ylab = "Eneregy Sub metering", xlab ="")
lines(x = x_val, y = y2_val, col = "red")
lines(x = x_val, y = y3_val, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()
