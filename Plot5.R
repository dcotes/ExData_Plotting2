## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bmoreSources <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
sources <- SCC[coalComb,]
bmoreEmissions <- aggregate(Emissions ~ year, data=bmoreSources, FUN=sum)

png("plot5.png")
ggplot(bmoreEmissions, aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression("total PM 2.5 emissions (tons)")) +
        ggtitle("Emissions from Motor Vehicle Sources in Baltimore City")
dev.off()

