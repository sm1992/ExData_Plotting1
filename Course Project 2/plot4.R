if(!file.exists("source.zip"))
{download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","~/Coursera Stuff/explr cp2/source.zip")
 unzip("source.zip")}
if(!exists("NEI")){NEI <- readRDS("summarySCC_PM25.rds")}
if(!exists("SCC")){SCC <- readRDS("Source_Classification_Code.rds")}
options(scipen=999)
##################################ABOVE CODE EXPLAINED IN PLOT1###################
data2<-grep("comb.*(coal|lignite)", SCC$Short.Name, ignore.case=TRUE) ##look for coal or lignite with 'comb' for combustion
data2<-SCC[data2,1]
data2<-NEI[NEI$SCC %in% data2,] ##slice and dice!
png('plot4.png',480,480)
qplot(factor(year),Emissions,data=data2,stat='identity',geom="bar",xlab="year",ylab="Coal combustion related emission",main="PM2.5[coal combustion] 1999-2008")
dev.off()