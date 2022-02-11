df <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df1 <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]
df2 <- df1$Global_active_power

png(filename = "plot1.png", width = 480, height = 480)

hist(as.numeric(df2), col = "red", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main = "Gloabl Active Power")

dev.off()