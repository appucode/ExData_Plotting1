library(dplyr)
library(lubridate)

df <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")


#filter only 2007-02-01 and 2007-02-02 date data

df <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]

y_val <- as.numeric(df$Global_active_power)

x_val <- strptime(paste(df$Date, df$Time, sep = ""), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)

plot(x = x_val, y = y_val, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")

dev.off()