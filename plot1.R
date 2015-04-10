#load the data
datos<-read.csv(file = "./household_power_consumption.txt", header = TRUE, na.strings="?",sep = ";")
#adapt date and time fields to a more appropriate formant
datos$Time<-strptime(paste(datos$Date, datos$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
datos$Date<-as.Date(datos$Date, format = "%d/%m/%Y")
#filter the data in order to use only data from "2007-02-01" to "2007-02-02"
datos<-datos[datos$Date>=as.Date("2007-02-01") & datos$Date<=as.Date("2007-02-02"),]

#1st plot
png(filename = "plot1.png")
hist(datos$Global_active_power, col = "red", xlab = "Global reactive power (kilowatts)", main = "Global Active Power")
dev.off()
