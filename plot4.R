#setwd("/media/caraya/DATA/CURSOS/02-Datascience/Exploratory Data Analysis/ExData_Plotting1")
#getwd()
#dir()
##----------------------------------------------------------------------------
## Read data from household_power_consumption.txt
data<-read.table("household_power_consumption.txt"
                 ,sep=";",header=T,dec=".")

data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
#data$Date<-as.Date(data$Date,"%d/%m/%y")

da<-data[data$Date=="1/2/2007",]
da<-rbind(da,data[data$Date=="2/2/2007",])

da$Date<-as.Date(da$Date,"%d/%m/%y")
da<-da[order(da$Date,da$Time),]
datime<-as.POSIXlt(paste(da$Date, da$Time, sep=" "))

x11()
par(mfrow=c(2,2))

plot(datime,da$Global_active_power
     ,type="l"
     ,xlab=""
     ,ylab="Global Active Powe (kilowatts)")

plot(datime,da$Voltage
     ,type="l"
     ,xlab="datetime"
     ,ylab="Voltage")

plot(datime,da$Sub_metering_1
     ,type="l"
     ,xlab=""
     ,ylab="Energy sub metering")
lines(datime,da$Sub_metering_2,col="red")
lines(datime,da$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_3","Sub_metering_3")
       ,lwd=1,col=c("black","red","blue"),cex = 0.5)

plot(datime,da$Global_active_power
     ,type="h"
     ,xlab="datetime"
     ,ylab="Global_active_power")

dev.copy(png,file="plot4.png")
dev.off()

