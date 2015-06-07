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
par(mfrow=c(1,1))
plot(datime,da$Sub_metering_1
     ,type="l"
     ,xlab=""
     ,ylab="Energy sub metering")
lines(datime,da$Sub_metering_2,col="red")
lines(datime,da$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_3","Sub_metering_3")
      ,lwd=1,col=c("black","red","blue"),
      y.intersp = 1,cex=1)

dev.copy(png,file="plot3.png")
dev.off()
