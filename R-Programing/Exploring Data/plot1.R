### load data ###
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Q1.Have total emissions from PM2.5 decreased in the United States 
## from 1999 to 2008? Using the base plotting system, 
## make a plot showing the total PM2.5 emission from all sources for 
## each of the years 1999, 2002, 2005, and 2008.
## Answer: Overall, a decreasing trend of total emissions in US.

sum.pm2.5 <- aggregate(x = NEI$Emissions, by = list(NEI$year), FUN = sum)
names(sum.pm2.5) <- c("year","total.emissions")  
  
png("plot1.png")
par(mar=c(4.5,4.5,2,1))
plot(sum.pm2.5$year, sum.pm2.5$total.emissions, type = "l", lwd = 1, 
     main = "Sum of PM2.5 Emissions in USA",
     xlab = "Year", ylab = "Sum of PM2.5 Emissions",xaxt="n")
axis(1,at=sum.pm2.5$year,labels=sum.pm2.5$year)
points(sum.pm2.5$year, sum.pm2.5$total.emissions, type = "p", pch = 19)
dev.off()
