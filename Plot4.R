## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
library(plyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalComb <- grepl(".Fuel Comb.*Coal", SCC$Short.Name)
sources <- SCC[coalComb,]
emissions <- NEI[(NEI$SCC %in% sources$SCC),]
emissionsPerYear <- aggregate(Emissions ~ year, data=emissions, FUN=sum)

png("plot4.png")
ggplot(emissionsPerYear, aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression("total PM 2.5 emissions")) +
        ggtitle("Emissions from coal combustion-related sources")
dev.off()

