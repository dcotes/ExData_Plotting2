NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

dt <- data.frame(NEI)

avgsteps <- aggregate(steps ~ interval + day, data = newacdata, mean)
