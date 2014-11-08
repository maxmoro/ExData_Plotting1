#Read full file exdata-data-household_power_consumption.zip saved in the workdir
file=unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt")
DTOri=read.csv(file,sep=";",na.string="?")
#subset file and create full_date
DT=subset(DTOri,Date %in% c("1/2/2007","2/2/2007"))
DT$Full_Date=strptime(paste(DT$Date,DT$Time),format="%d/%m/%Y %H:%M:%S")

#open dev and set parameter
png(file="plot3.png",width=480,height=480)
par(ps=10)
par(mfrow = c(1, 1))
#plot
plot(x=DT$Full_Date, y=DT$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(x=DT$Full_Date, y=DT$Sub_metering_2, type = "l",  ylab = "Energy sub metering", col = "red",xlab = "")
points(x=DT$Full_Date, y=DT$Sub_metering_3, type = "l",  ylab = "Energy sub metering",col = "blue",xlab = "")
#legend
legend("topright", lty = 1,  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"), xjust = 1, yjust = 1)
#close device
dev.off()


