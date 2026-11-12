## Read outcome data and create a subset with 2 dates, 
# download the files in the readme file, include it in the same project with the name: household_power_consumption.txt 
datos <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?", stringsAsFactors = FALSE)

## Convert Date column (chr) as dates, then obtain the subset of the 2 selected dates, and finally paste together date and time
datos$Date <- as.Date(datos$Date, format = "%d/%m/%Y")
datos <- subset(datos, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
datos$DateTime <- strptime(paste(datos$Date, datos$Time), format = "%Y-%m-%d %H:%M:%S")

## Generate basic plot with lines,  re-writting X labe as example provided 
with(datos, 
     plot(DateTime, Global_active_power,
          xlab= "",
          ylab = "Global Active Power (kilowatts)",
          type= "l", 
          xaxt = "n"))
axis.POSIXct(1, at = seq(as.POSIXct("2007-02-01 00:00"), as.POSIXct("2007-02-03 00:00"), by = "24 hours"), format= "%a")
dev.copy(png, file = "plot2.png",
         width = 480, height = 480) 
dev.off()