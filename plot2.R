data <- read.table("~/R/ExData_Plotting1/household_power_consumption.txt",sep=";",na.strings="?",header = TRUE)
data <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
#data <- transform(data, Date=as.Date(Date,"%d/%m/%Y"))

data$Date <- paste(data$Date,data$Time)
data <- transform(data,Date=strptime(Date, format="%d/%m/%Y %T"))

with(data, plot(y=Global_active_power,x=Date,type="n",xlab="",ylab="Global active power (kilowatts)"))
with(data, lines(Date,Global_active_power))

dev.copy(png,"Plot2.png",width=480,height=480)
dev.off()