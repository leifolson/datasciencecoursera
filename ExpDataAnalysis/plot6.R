library("ggplot2")

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# subset to baltimore and los angeles data
NEI.baltimore.la <- NEI[NEI$fips == '24510' | NEI$fips == '06037', ]

# subset the data to mobile vehicle sources
# for the purposes of this assignment, all the "Mobile" EI-Sector categories that
# mention the word "Vehicles" are included
# aircraft, locomotives, and equipment are left out as they are not typically thought
# of as "motor vehicles"
SCC.motor <- SCC[grep("^mobile -(.*) vehicles$", SCC$EI.Sector, ignore.case=T), ]
NEI.motor <- NEI.baltimore.la[NEI.baltimore.la$SCC %in% SCC.motor$SCC, ]

# aggregate emissions data by location and year
sumByYear <- aggregate(NEI.motor$Emissions, by = list(NEI.motor$year, NEI.motor$fips), FUN = sum)

# change the names of fips to locations
colnames(sumByYear) <- c("year", "fips", "emissions")
sumByYear$fips[sumByYear$fips == '24510'] <- 'Baltimore City'
sumByYear$fips[sumByYear$fips == '06037'] <- 'Los Angeles County'

# save to png
png(filename = "plot6.png", height = 480, width = 480)

# make the plot with regression line
# making a log transform on the emissions data for easier comparison since 
# Los Angeles county emissions are dramatically higher than Baltimore City
g <- ggplot(sumByYear, aes(year, log(emissions))) + 
  geom_point() + facet_grid(. ~ fips) + geom_smooth(method = "lm") + ggtitle("Motor Vehicle Related Emissions") +
  labs(x="Year", y = expression(paste('log(Emissions PM'[2.5],')')))

print(g)

dev.off()