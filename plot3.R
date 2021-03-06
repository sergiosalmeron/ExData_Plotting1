#load the data
datos<-read.csv(file = "./household_power_consumption.txt", header = TRUE, na.strings="?",sep = ";")
#adapt date and time fields to a more appropriate formant
datos$Time<-strptime(paste(datos$Date, datos$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
datos$Date<-as.Date(datos$Date, format = "%d/%m/%Y")
#filter the data in order to use only data from "2007-02-01" to "2007-02-02"
datos<-datos[datos$Date>=as.Date("2007-02-01") & datos$Date<=as.Date("2007-02-02"),]

#To show the days in English
Sys.setlocale("LC_ALL","C")

#3rd plot
png(filename = "plot3.png")
with(datos, plot(datos$Time, datos$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(datos, points(datos$Time, datos$Sub_metering_2, type = "l", col = "red"))
with(datos, points(datos$Time, datos$Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, lwd= 1)
dev.off()