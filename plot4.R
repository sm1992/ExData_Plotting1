data<-read.table("household_power_consumption.txt",header=TRUE,sep=';') #read data
png("myplot4.png",480,480) #open device
data2<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S") #create datetime
data2[,3]<-as.double(as.character(data2[,3]))
par(mfrow=c(2,2))
plot(data2[,10],data2[,3],pch=' ',ylab='Global Active Power')
lines(data2[,10],data2[,3])
data2[,5]<-as.double(as.character(data2[,5]))
plot(data2[,10],data2[,5],pch=' ',ylab='Voltage',xlab='DateTime')
lines(data2[,10],data2[,5])
data2[,7]<-as.double(as.character(data2[,7]))
data2[,8]<-as.double(as.character(data2[,8]))
data2[,9]<-as.double(as.character(data2[,9]))
plot(data2[,10],data2[,7],pch=' ',ylab="Energy sub metering",xlab='')
lines(data2[,10],data2[,7])
lines(data2[,10],data2[,8],col="Red")
lines(data2[,10],data2[,9],col="Blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'),lty=1)
data2[,4]<-as.double(as.character(data2[,4]))
plot(data2[,10],data2[,4],pch=' ',ylab='Global_reactive_power',xlab='DateTime')
lines(data2[,10],data2[,4])
dev.off() #close and print device
