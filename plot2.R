datos<-read.csv(file = "./household_power_consumption.txt", header = TRUE, na.strings="?",sep = ";")
datos$Time<-strptime(paste(datos$Date, datos$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
datos$Date<-as.Date(datos$Date, format = "%d/%m/%Y")
datos<-datos[datos$Date>=as.Date("2007-02-01") & datos$Date<=as.Date("2007-02-02"),]

#To show the days in English
Sys.setlocale("LC_ALL","C")

#2nd plot
png(filename = "plot2.png")
plot(datos$Time, datos$Global_active_power, type = "l", xlab = "", ylab = "Global reactive power (kilowatts)")
dev.off()