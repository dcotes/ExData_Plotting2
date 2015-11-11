## Have Total Emissions Decreased from 1999 to 2008?
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dt <- data.frame(NEI)
dt$year <- as.factor(dt$year)
byYear <- ddply(dt, ~year, summarize, sum=sum(Emissions))
png("Plot1.png", height = 480, width = 480)
plot(byYear, main="Total PM2.5 Emissions 1999-2008", xlab="Year", ylab="Total (tons)")
dev.off()

