### load data ###
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

################
### Q4. Across the United States, how have emissions from 
### coal combustion-related sources changed from 1999–2008?
### Answer: relatively flatter from 1999-2005, but dramatically decreased from 2005 to 2008.

sectors <- grep(x = SCC$EI.Sector, pattern = "Comb.*Coal")
subsetSCC <- SCC$SCC[sectors]

# get suset of NEI
colNEI <- NEI[which(NEI$SCC %in% subsetSCC), ]

# Aggregate sums over years
sum.pm2.5.col <- aggregate(x = colNEI$Emissions, by = list(colNEI$year), FUN = sum)
names(sum.pm2.5.col) <- c("year", "total.emissions")

png("plot4.png")
par(mar=c(4.5,4.5,2,1))
plot(sum.pm2.5.col$year, sum.pm2.5.col$total.emissions, type = "l", lwd = 1, 
     main = "Sum of PM2.5 Emissions from Coal_comb Sources",
     xlab = "Year", ylab = "Sum of PM2.5 Emissions",xaxt="n")
axis(1,at=sum.pm2.5.col$year,labels=sum.pm2.5.col$year)
points(sum.pm2.5.col$year, sum.pm2.5.col$total.emissions, type = "p", pch = 19)
dev.off()
