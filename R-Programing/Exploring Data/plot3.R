### load data ###
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##################
## Q3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)  variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 
## for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.
## Answer: In Baltimore city, type of nonpoint, onroad, and nonroad decreased in emissions from 1999-2008.
##         Source from Point increased from 1999-2005, but decreased again from 2005-2008.

sum.pm2.5.bmore.bytype <- aggregate(x = NEI$Emissions[NEI$fips == "24510"], by = list(NEI$year[NEI$fips == "24510"], NEI$type[NEI$fips == "24510"]), FUN = sum)
names(sum.pm2.5.bmore.bytype) <- c("Year", "Type", "Total_Emissions")

library(ggplot2)

png("plot3.png")

ggp <- ggplot(sum.pm2.5.bmore.bytype,aes(x = Year,y = Total_Emissions,color = Type)) +
       geom_point() +
       geom_line() +
       scale_x_continuous(breaks=unique(sum.pm2.5.bmore.bytype$Year))
       

print(ggp)

dev.off()
