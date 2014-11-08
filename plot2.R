#Read full file exdata-data-household_power_consumption.zip saved in the workdir
file=unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt")
DTOri=read.csv(file,sep=";",na.string="?")
#subset file and create full_date
DT=subset(DTOri,Date %in% c("1/2/2007","2/2/2007"))
DT$Full_Date=strptime(paste(DT$Date,DT$Time),format="%d/%m/%Y %H:%M:%S")

#open dev and set parameter
png(file="plot2.png",width=480,height=480)
par(ps=12)
#plot
plot(x=DT$Full_Date, y=DT$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#close device
dev.off()
