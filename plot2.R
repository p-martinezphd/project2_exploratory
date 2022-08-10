
if(!exists("NEI")){
  NEI <- readRDS("~/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("~/Source_Classification_Code.rds")
}

subset  <- NEI[NEI$fips=="24510", ]


#We need to aggregate total by year 
aggregatedTotalByYear <- aggregate(Emissions ~ year, subset, sum)



png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()