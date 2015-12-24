library("ggplot2")

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

NEI.baltimore <- NEI[NEI$fips == '24510', ]

# aggregate emissions data by year
sumByYear <- aggregate(NEI.baltimore$Emissions, by = list(NEI.baltimore$year), FUN = sum)

# save to png
png(filename = "plot2.png", height = 480, width = 480)

# make the plot
plot(sumByYear, xlab="Year", ylab=expression('Emissions PM'[2.5]), main="Baltimore Emissions by Year")

# add a regression line
abline(lm(x ~ Group.1, data = sumByYear), col = 'red')

dev.off()