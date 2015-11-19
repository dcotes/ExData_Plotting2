## Compare emissions from motor vehicle sources in Baltimore City 
## with emissions from motor vehicle sources in Los Angeles County, California. 
## Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bmoreEmissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
bmoreAggEm <- aggregate(Emissions ~ year, data=bmoreEmissions, FUN=sum)

laEmissions <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
laAggEm <- aggregate(Emissions ~ year, data=laEmissions, FUN=sum)



bmoreAggEm$County <- "Baltimore City, MD"
laAggEm$County <- "Los Angeles County, CA"
totalEmissions <- rbind(bmoreAggEm, laAggEm)

png("plot6.png")
ggplot(totalEmissions, aes(x=factor(year), y=Emissions, fill=County)) +
        geom_bar(stat="identity") + 
        facet_grid(County  ~ ., scales="free") +
        ylab("total emissions (tons)") + 
        xlab("year") +
        ggtitle(expression("Motor vehicle emissions \nin Baltimore and Los Angeles"))
dev.off()
