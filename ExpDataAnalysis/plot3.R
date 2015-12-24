library("ggplot2")

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# subset to baltimore data
NEI.baltimore <- NEI[NEI$fips == '24510', ]
NEI.baltimore$type = as.factor(NEI.baltimore$type)

# aggregate emissions data by year
sumByYear <- aggregate(NEI.baltimore$Emissions, by = list(NEI.baltimore$year,NEI.baltimore$type), FUN = sum)
colnames(sumByYear) <- c("year", "type", "emissions")

# save to png
png(filename = "plot3.png", width = 860)

# make the plot
g <- ggplot(sumByYear, aes(year, emissions)) + 
  geom_point() + facet_grid(. ~ type) + geom_smooth(method = "lm") + ggtitle("Baltimore Emissions by Year and Type") +
  labs(x="Year", y = expression('Emissions PM'[2.5]))

print(g)

dev.off()