## Read outcome data and create a subset with 2 dates, 
# download the files in the readme file, include it in the same project with the name: household_power_consumption.txt 
datos <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?", stringsAsFactors = FALSE)

## Convert Date column (chr) as dates, then obtain the subset of the 2 selected dates, and finally paste together date and time
datos$Date <- as.Date(datos$Date, format = "%d/%m/%Y")
datos <- subset(datos, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
datos$DateTime <- strptime(paste(datos$Date, datos$Time), format = "%Y-%m-%d %H:%M:%S")

## Generate histogram as example provided
with(datos, 
     hist(Global_active_power, 
          col = "red",
          main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
dev.copy(png, file = "plot1.png",
         width = 480, height = 480) 
dev.off()