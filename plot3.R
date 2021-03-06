data<-read.table("household_power_consumption.txt",header=TRUE,sep=';') #read data
png("myplot3.png",480,480) #open device
data2<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S") #create datetime
data2[,7]<-as.double(as.character(data2[,7]))
data2[,8]<-as.double(as.character(data2[,8]))
data2[,9]<-as.double(as.character(data2[,9]))
plot(data2[,10],data2[,7],pch=' ',ylab="Energy sub metering",xlab='')
lines(data2[,10],data2[,7])
lines(data2[,10],data2[,8],col="Red")
lines(data2[,10],data2[,9],col="Blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'),lty=1)
dev.off()  #close and print device
