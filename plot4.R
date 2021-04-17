data <- read.table("~/R/ExData_Plotting1/household_power_consumption.txt",sep=";",na.strings="?",header = TRUE)
data <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
#data <- transform(data, Date=as.Date(Date,"%d/%m/%Y"))

data$Date <- paste(data$Date,data$Time)
data <- transform(data,Date=strptime(Date, format="%d/%m/%Y %T"))

par(mfrow=c(2,2))

with(data, plot(y=Global_active_power,x=Date,type="n",xlab="",ylab="Global active power"))
with(data, lines(Date,Global_active_power))

with(data, plot(y=Voltage,x=Date,type="n",xlab="datetime",ylab="Voltage"))
with(data, lines(Date,Voltage))

with(data, plot(y=Sub_metering_1,x=Date,type="n",xlab="",ylab="Energy sub metering"))
with(data, lines(Date,Sub_metering_1))
with(data, lines(Date,Sub_metering_2,col="red"))
with(data, lines(Date,Sub_metering_3,col="blue"))
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering 3"),bty = "n")

with(data, plot(y=Global_reactive_power,x=Date,type="n",xlab="datetime",ylab="Global reactive power"))
with(data, lines(Date,Global_reactive_power))

dev.copy(png,"Plot4.png",width=480,height=480)
dev.off()
