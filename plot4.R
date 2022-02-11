library(dplyr)
library(lubridate)

df <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")


#filter only 2007-02-01 and 2007-02-02 date data

df <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]

#x_val <- strptime(paste(df$Date, df$Time, sep = ""), format = "%Y-%m-%d %H:%M:%S")

y1_val <- as.numeric(df$Global_active_power)

y2_val <- as.numeric(df$Voltage)

y31_val <- as.numeric(df$Sub_metering_1)
y32_val <- as.numeric(df$Sub_metering_2)
y33_val <- as.numeric(df$Sub_metering_3)

y4_val <- as.numeric(df$Global_reactive_power)

x_val <- strptime(paste(df$Date, df$Time, sep = ""), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(x = x_val, y = y1_val, xlab = "", ylab = "Global Active Power", type = "l")

plot(x = x_val, y = y2_val, xlab = "datetime", ylab = "Voltage", type = "l")

plot(x = x_val, y = y31_val, type = 'l', ylab = "Eneregy Sub metering", xlab ="")
lines(x = x_val, y = y32_val, col = "red")
lines(x = x_val, y = y33_val, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)


plot(x = x_val, y = y4_val, xlab = "datetime", ylab = "Global_reactive_Power", type = "l")

dev.off()