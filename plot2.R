a <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subseta <- a[a$V1 %in% c("1/2/2007", "2/2/2007"), ]
adatetime <- strptime(paste(subseta$V1, subseta$V2, sep = ""), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(adatetime, as.numeric(subseta$V3), type = "l", xlab = "")
dev.off()
