## Read outcome data and create a subset with 2 dates, 
# download the files in the readme file, include it in the same project with the name: household_power_consumption.txt 
datos <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?", stringsAsFactors = FALSE)

## Convert Date column (chr) as dates, then obtain the subset of the 2 selected dates, and finally paste together date and time
datos$Date <- as.Date(datos$Date, format = "%d/%m/%Y")
datos <- subset(datos, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
datos$DateTime <- strptime(paste(datos$Date, datos$Time), format = "%Y-%m-%d %H:%M:%S")

## Generate basic plot with lines,  rewriting X label as examples provided, including a legend without box, and organize 4 plots using row order

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))
with(datos,{
  plot(DateTime, Global_active_power,
       xlab= "",
       ylab = "Global Active Power",
       type= "l", 
       xaxt = "n")
axis.POSIXct(1, at = seq(as.POSIXct("2007-02-01 00:00"), as.POSIXct("2007-02-03 00:00"), by = "24 hours"), format= "%a")
  plot(DateTime, Voltage,
     xlab= "datetime",
     ylab = "Voltage",
     type= "l", 
     xaxt = "n")
axis.POSIXct(1, at = seq(as.POSIXct("2007-02-01 00:00"), as.POSIXct("2007-02-03 00:00"), by = "24 hours"), format= "%a")
  plot(DateTime, Sub_metering_1, col="black",
       xlab= "",
       ylab = "Energy sub metering",
       ylim = range(Sub_metering_1, Sub_metering_2, Sub_metering_3),
       type= "l", 
       xaxt = "n")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", lty=1, col=c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
axis.POSIXct(1, at = seq(as.POSIXct("2007-02-01 00:00"), as.POSIXct("2007-02-03 00:00"), by = "24 hours"), format= "%a")
plot(DateTime, Global_reactive_power,
     xlab= "datetime",
     ylab = "Global_reactive_power",
     type= "l", 
     xaxt = "n")
axis.POSIXct(1, at = seq(as.POSIXct("2007-02-01 00:00"), as.POSIXct("2007-02-03 00:00"), by = "24 hours"), format= "%a")})
dev.off()