library("ggplot2")

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# subset the data to just coal combustion related sources
SCC.coal <- SCC[grep("^fuel comb -(.*)- coal$", SCC$EI.Sector, ignore.case=T), ]
NEI.coal <- NEI[NEI$SCC %in% SCC.coal$SCC, ]

# aggregate emissions data by year
sumByYear <- aggregate(NEI.coal$Emissions, by = list(NEI.coal$year), FUN = sum)
colnames(sumByYear) <- c("year", "emissions")

# save to png
png(filename = "plot4.png", height = 480, width = 480)

# make the plot
g <- ggplot(sumByYear, aes(year, emissions)) + 
  geom_point() + geom_smooth(method = "lm") + ggtitle("Coal Combustion Related Emissions") +
  labs(x="Year", y = expression('Emissions PM'[2.5]))

print(g)

dev.off()