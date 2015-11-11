## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dt <- data.frame(NEI)

baltimore <- subset(dt, fips == "24510")
baltimore$year <- as.factor(baltimore$year)
baltByYear <- ddply(baltimore, ~year, summarize, sum=sum(Emissions))
png("Plot2.png", height = 480, width = 480)
plot(baltByYear, main="Total PM2.5 Emissions In Baltimore 1999-2008", xlab="Year", ylab="Total (tons)")
dev.off()



