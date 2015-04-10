datos<-read.csv(file = "./household_power_consumption.txt", header = TRUE, na.strings="?",sep = ";")
datos$Time<-strptime(paste(datos$Date, datos$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
datos$Date<-as.Date(datos$Date, format = "%d/%m/%Y")
datos<-datos[datos$Date>=as.Date("2007-02-01") & datos$Date<=as.Date("2007-02-02"),]

#To show the days in English
Sys.setlocale("LC_ALL","C")

#4th plot
png(filename = "plot4.png")
par(mfrow = c(2, 2))
with(datos,{
  #1st subplot
  with(datos, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global reactive power (kilowatts)"))
  #2nd subplot
  with(datos, plot(Time, Voltage, type = "l", xlab = "datetime"))
  #3rd subplot
  with(datos, plot(datos$Time, datos$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
  with(datos, points(datos$Time, datos$Sub_metering_2, type = "l", col = "red"))
  with(datos, points(datos$Time, datos$Sub_metering_3, type = "l", col = "blue"))
  legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd= 1, lty=1, bty = "n")
  #4th subplot
  with(datos, plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))
})
dev.off()