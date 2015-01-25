if(!file.exists("source.zip"))
{download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","~/Coursera Stuff/explr cp2/source.zip")
 unzip("source.zip")}
if(!exists("NEI")){NEI <- readRDS("summarySCC_PM25.rds")}
if(!exists("SCC")){SCC <- readRDS("Source_Classification_Code.rds")}
options(scipen=999)
##################################ABOVE CODE EXPLAINED IN PLOT1###################
data2<-subset(NEI,NEI$fips==24510) ##subset for baltimore
png('plot3.png',480,480)
q<-qplot(factor(year),Emissions,fill=type,data=data2,geom="bar",xlab= "Year",stat='identity', ylab= "Total PM2.5 Emission in tons", main= "PM2.5 Total Emissions by Year and Type at Baltimore")
q + facet_wrap(~type) #facet by type of pollution
dev.off()