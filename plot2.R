data<-read.table("household_power_consumption.txt",header=TRUE,sep=';') #read data
png("myplot2.png",480,480) #open device
data2<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")
data2[,3]<-as.double(as.character(data2[,3]))
plot(data2$DateTime,data2$Global_active_power,pch=' ',xlab='',ylab='Global Active Power (kilowatts)')
lines(data2$DateTime,data2$Global_active_power)
dev.off()  #close and print plot as png
