if(!file.exists("source.zip"))
{download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","~/Coursera Stuff/explr cp2/source.zip")
unzip("source.zip")}
if(!exists("NEI")){NEI <- readRDS("summarySCC_PM25.rds")}
if(!exists("SCC")){SCC <- readRDS("Source_Classification_Code.rds")}
options(scipen=999)
##################################ABOVE CODE EXPLAINED IN PLOT1###################
png('plot2.png',480,480)
barplot(tapply(subset(NEI,NEI$fips==24510)$Emissions,subset(NEI,NEI$fips==24510)$year,FUN=sum),col='#00a4e4',xlab="year",ylab="Total Emissions",main="Total Emisssions In Maryland")
dev.off()