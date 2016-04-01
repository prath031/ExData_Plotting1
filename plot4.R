a <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subseta <- a[a$V1 %in% c("1/2/2007", "2/2/2007"), ]
adatetime <- strptime(paste(subseta$V1, subseta$V2, sep = ""), "%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow = c(2,2))

plot(adatetime, as.numeric(subseta$V3), type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
plot(adatetime, as.numeric(subseta$V5), type = "l", xlab = "datetime", ylab = "Voltage")
submeter1 <- as.numeric(subseta$V7)
submeter2 <- as.numeric(subseta$V8)
submeter3 <- as.numeric(subseta$V9)
plot(adatetime, submeter1, xlab = "", ylab = "Energy Sub Metering", type = "l")
lines(adatetime, submeter2, col = "red")
lines(adatetime, submeter3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = c(1,1), bty = "n", cex = 1)
plot(adatetime, as.numeric(subseta$V4), type = "l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()