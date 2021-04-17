data <- read.table("~/R/ExData_Plotting1/household_power_consumption.txt",sep=";",na.strings="?",header = TRUE)
data <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
#data <- transform(data, Date=as.Date(Date,"%d/%m/%Y"))

data$Date <- paste(data$Date,data$Time)
data <- transform(data,Date=strptime(Date, format="%d/%m/%Y %T"))

with(data, plot(y=Sub_metering_1,x=Date,type="n",xlab="",ylab="Energy sub metering"))
with(data, lines(Date,Sub_metering_1))
with(data, lines(Date,Sub_metering_2,col="red"))
with(data, lines(Date,Sub_metering_3,col="blue"))
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering 3"))

dev.copy(png,"Plot3.png",width=480,height=480)
dev.off()
