# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dt <- data.frame(NEI)

baltimore <- subset(dt, fips == "24510")
baltimore$year <- as.factor(baltimore$year)
baltimore$type <- as.factor(baltimore$type)
baltByTypeAndYear <- ddply(baltimore, .(year, type), summarize, sum=sum(Emissions))
png("Plot3.png", height = 480, width = 480)
p <- qplot(year, sum, data=baltByTypeAndYear, facets = . ~type)
p + labs(title="Baltimore Emissions by Type", x="Year", y="Emissions Total (tons)")
dev.off()
