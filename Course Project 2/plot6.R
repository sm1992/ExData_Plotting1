if(!file.exists("source.zip"))
{download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","~/Coursera Stuff/explr cp2/source.zip")
 unzip("source.zip")}
if(!exists("NEI")){NEI <- readRDS("summarySCC_PM25.rds")}
if(!exists("SCC")){SCC <- readRDS("Source_Classification_Code.rds")}
options(scipen=999)
##################################ABOVE CODE EXPLAINED IN PLOT1###################
data2<-grep("vehicles", SCC$SCC.Level.Two, ignore.case=T) ##look for 'vehicles' in column
data2<-SCC[data2,1]
data2<-NEI[NEI$SCC %in% data2,]
data2<-subset(data2,data2$fips=="06037" | data2$fips=="24510")
data2[data2$fips=="06037",1]<-"Los Angeles County" ##rename fips code
data2[data2$fips=="24510",1]<-"Baltimore City"
png('plot6.png',480,480)
q<-qplot(factor(year),Emissions,data=data2,stat='identity',geom="bar",xlab="year",ylab="Vehicle exhaust related emission",main="PM2.5[Vehicle Exhaust] 1999-2008 in Baltimore VS LA County",fill=factor(year))
q+facet_wrap(~fips) 
dev.off()
