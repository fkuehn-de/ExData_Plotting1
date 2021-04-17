data <- read.table("~/R/ExData_Plotting1/household_power_consumption.txt",sep=";",na.strings="?",header = TRUE)
data <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
data <- transform(data, Date=as.Date(Date,"%d/%m/%Y"))

with(data, hist(Global_active_power,col="red",main="Global active power",xlab="Global active power (kilowatts)"))

dev.copy(png,"Plot1.png",width=480,height=480)
dev.off()