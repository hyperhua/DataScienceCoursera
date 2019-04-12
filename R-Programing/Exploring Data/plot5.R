### load data ###
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#####################
### Q5. How have emissions from motor vehicle 
### sources changed from 1999–2008 in Baltimore City?
### Answer: Dramatically decreased from 1999 to 2002, but relatively flatter from 2002 to 2005. Then, decreased from 2005 to 2008.

sum.pm2.5.bmore.mot <- aggregate(x = NEI$Emissions[NEI$fips=="24510" & NEI$type == "ON-ROAD"], by = list(NEI$year[NEI$fips=="24510" & NEI$type == "ON-ROAD"]), FUN = sum)
names(sum.pm2.5.bmore.mot) <- c("year","total.emissions")  

png("plot5.png")
par(mar=c(4.5,4.5,2,1))
plot(sum.pm2.5.bmore.mot$year, sum.pm2.5.bmore.mot$total.emissions, type = "l", lwd = 1, 
     main = "Sum of PM2.5 Emissions in Motor, Baltimore, MD",
     xlab = "Year", ylab = "Sum of PM2.5 Emissions",xaxt="n")
axis(1,at=sum.pm2.5.bmore.mot$year,labels=sum.pm2.5.bmore.mot$year)
points(sum.pm2.5.bmore.mot$year, sum.pm2.5.bmore.mot$total.emissions, type = "p", pch = 19)
dev.off()
