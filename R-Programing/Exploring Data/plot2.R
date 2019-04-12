### load data ###
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

################
## Q2. Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering 
## this question.
## Answer: Total emissions in Baltimore City decreased from 1999 to 2002 and from 2005 to 2008, but the trend increased from 2002 to 2005.

sum.pm2.5.bmore <- aggregate(x = NEI$Emissions[NEI$fips=="24510"], by = list(NEI$year[NEI$fips=="24510"]), FUN = sum)
names(sum.pm2.5.bmore) <- c("year","total.emissions")  

png("plot2.png")
par(mar=c(4.5,4.5,2,1))
plot(sum.pm2.5.bmore$year, sum.pm2.5.bmore$total.emissions, type = "l", lwd = 1, 
     main = "Sum of PM2.5 Emissions in Baltimore, MD",
     xlab = "Year", ylab = "Sum of PM2.5 Emissions",xaxt="n")
axis(1,at=sum.pm2.5.bmore$year,labels=sum.pm2.5.bmore$year)
points(sum.pm2.5.bmore$year, sum.pm2.5.bmore$total.emissions, type = "p", pch = 19)
dev.off()
