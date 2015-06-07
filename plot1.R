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
hist(da$Global_active_power,main="Global Active Power",xlim=c(0,6),col="red"
     ,xlab="Global Active Powe (kilowatts)"
     ,ylab="Frecuency")

dev.copy(png,file="plot1.png")
dev.off()
#png("plot1.png",width = 480, height = 480, units = "px")



