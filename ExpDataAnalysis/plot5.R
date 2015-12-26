library("ggplot2")

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# subset to baltimore data
NEI.baltimore <- NEI[NEI$fips == '24510', ]

# subset the data to mobile vehicle sources
# for the purposes of this assignment, all the "Mobile" EI-Sector categories that
# mention the word "Vehicles" are included
# aircraft, locomotives, and equipment are left out as they are not typically thought
# of as "motor vehicles"
SCC.motor <- SCC[grep("^mobile -(.*) vehicles$", SCC$EI.Sector, ignore.case=T), ]
NEI.motor <- NEI.baltimore[NEI.baltimore$SCC %in% SCC.motor$SCC, ]

# aggregate emissions data by year
sumByYear <- aggregate(NEI.motor$Emissions, by = list(NEI.motor$year), FUN = sum)
colnames(sumByYear) <- c("year", "emissions")

# save to png
png(filename = "plot5.png", height = 480, width = 480)

# make the plot with regression line
g <- ggplot(sumByYear, aes(year, emissions)) + 
  geom_point() + geom_smooth(method = "lm") + ggtitle("Baltimore Motor Vehicle Related Emissions") +
  labs(x="Year", y = expression('Emissions PM'[2.5]))

print(g)

dev.off()