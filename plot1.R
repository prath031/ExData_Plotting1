a <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subset <- a[a$V1 %in% c("1/2/2007", "2/2/2007"), ]
png(file = "plot1.png")
hist(as.numeric(subset$V3), main = "Global Active Power", xlab = "Global Active Power", ylab = "Frequency", xlim = c(0,6), ylim = c(0,1200), col = "red")
dev.off()
