NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

dt <- data.frame(NEI)

avgsteps <- aggregate(steps ~ interval + day, data = newacdata, mean)

p <- qplot(year, sum, data=baltByTypeAndYear, facets = . ~type)
p + labs(title="Baltimore Emissions by Type", x="Year", y="Emissions Total (tons)")