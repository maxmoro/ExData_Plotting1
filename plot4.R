#Read full file exdata-data-household_power_consumption.zip saved in the workdir
file=unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt")
DTOri=read.csv(file,sep=";",na.string="?")
#subset file and create full_date
DT=subset(DTOri,Date %in% c("1/2/2007","2/2/2007"))
DT$Full_Date=strptime(paste(DT$Date,DT$Time),format="%d/%m/%Y %H:%M:%S")


#open dev and set parameters
png(file="plot4.png",width=480,height=480)
par(ps=12)
par(mfrow = c(2, 2))

#plot1
plot(DT$Full_Date, DT$Global_active_power, type = "l", ylab = "Global Active Power", xlab = '')
#plot2
plot(DT$Full_Date, DT$Voltage, type = "l", xlab = "datetime",ylab = "Voltage")
#plot3
plot(DT$Full_Date, DT$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
points(DT$Full_Date, DT$Sub_metering_2, type = "l", col = "red" , xlab = "", ylab = "Sub_metering_2")
points(DT$Full_Date, DT$Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "Sub_metering_3")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n",xjust = 1, yjust = 1)
#plot4
plot(DT$Full_Date, DT$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))
#close device
dev.off()


