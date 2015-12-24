library("ggplot2")

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# aggregate emissions data by year
sumByYear <- aggregate(NEI$Emissions, by = list(NEI$year), FUN = sum)

# save to png
png(filename = "plot1.png", height = 480, width = 480)

# make the plot
plot(sumByYear, xlab="Year", ylab=expression('Emissions PM'[2.5]), main="Emissions by Year")

# add a regression line
abline(lm(x ~ Group.1, data = sumByYear), col = 'red')

dev.off()

