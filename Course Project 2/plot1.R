if(!file.exists("source.zip")) # checks current directory for file
{download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","~/Coursera Stuff/explr cp2/source.zip")
 unzip("source.zip")} # zip file
if(!exists("NEI")){NEI <- readRDS("summarySCC_PM25.rds")} #checks/creates variables
if(!exists("SCC")){SCC <- readRDS("Source_Classification_Code.rds")}
options(scipen=999) #removes scientific notation
png('plot1.png',480,480)
barplot(tapply(NEI$Emissions,NEI$year,FUN=sum),col='#00a4e4',xlab="year",ylab="Total Emissions",main="Total Overall Emissions")
dev.off()