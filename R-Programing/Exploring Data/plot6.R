### load data ###
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##########################
### Q6.Compare emissions from motor vehicle sources 
## in Baltimore City with emissions from motor vehicle sources 
## in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?
### Answer: LA had an overall increasing trend over time, 
###         and Baltimore had an decreasing trend over time. Besides, visually to see, the slope in LA is steeper than Baltimore (flatter).


sum.pm2.5.bmore.la <- aggregate(x = NEI$Emissions[NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD"], by = list(NEI$year[NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD"], NEI$fips[NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD"]), FUN = sum)
names(sum.pm2.5.bmore.la) <- c("Year", "City", "Total_Emissions")

sum.pm2.5.bmore.la$City<-as.factor(sum.pm2.5.bmore.la$City)
levels(sum.pm2.5.bmore.la$City) <- list(LA="06037", Bmore="24510")

library(ggplot2)

png("plot6.png")

ggp <- ggplot(sum.pm2.5.bmore.la,aes(x = Year,y = Total_Emissions,color = City)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks=unique(sum.pm2.5.bmore.la$Year))


print(ggp)

dev.off()

