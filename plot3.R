## plot3.R

plot3 <- function() {
        pwrData <- getData()
        png(file="./plot3.png")
        plot(pwrData$MeasurementDateTime, pwrData$Sub_metering_1, type="n",
             ylab="Energy sub metering", xlab="")
        lines(pwrData$MeasurementDateTime, pwrData$Sub_metering_1, col="black")
        lines(pwrData$MeasurementDateTime, pwrData$Sub_metering_2, col="red")
        lines(pwrData$MeasurementDateTime, pwrData$Sub_metering_3, col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
               col=c("black", "red", "blue"), lty=1)
        ##dev.copy(png, filename="./plot3.png", width=480, height=480)
        dev.off()
}

## Internal function that checks for the data and downloads it if not present. You should not
## need to call this as it is called directly by the plot functions.
## Note: the download is quite large so might be slow initially.
getData <- function(forceDownload = FALSE, forceReload = FALSE) {
        dataFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        saveFile <- "./data/HouseholdPowerConsumption.zip"
        cacheFile <- "./data/HouseholdPowerConsumptionCache.txt"
        if (!file.exists("./data")) dir.create("./data")
        if (!file.exists(saveFile) | forceDownload) download.file(dataFile, destfile=saveFile, mode="wb")
        if (exists("HouseholdPowerConsumptionData") && !forceReload) HouseholdPowerConsumptionData
        else {
                if(!file.exists(cacheFile) | forceReload) {
                        dataFile <- read.table(unz(saveFile, "household_power_consumption.txt"), header=TRUE, 
                                               sep=";", na.strings=c("?"))
                        dataFile <- within(dataFile, {
                                MeasurementDateTime=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")
                        })
                        dataFile$Date <- as.Date(dataFile$Date, format="%d/%m/%Y")
                        
                        dataFile <- dataFile[(dataFile$Date == "2007-02-01") | 
                                                     (dataFile$Date == "2007-02-02"),]
                        dataFile$Global_active_power <- as.numeric(dataFile$Global_active_power)
                        dataFile$Global_reactive_power <- as.numeric(dataFile$Global_reactive_power)
                        dataFile$Voltage <- as.numeric(dataFile$Voltage)
                        dataFile$Global_intensity <- as.numeric(dataFile$Global_intensity)
                        dataFile$Sub_metering_1 <- as.numeric(dataFile$Sub_metering_1)
                        dataFile$Sub_metering_2 <- as.numeric(dataFile$Sub_metering_2)
                        dataFile$Sub_metering_3 <- as.numeric(dataFile$Sub_metering_3)
                        write.table(dataFile, file=cacheFile, row.names=FALSE, sep=",")
                        HouseholdPowerConsumptionData <<- dataFile
                        HouseholdPowerConsumptionData
                }
                else {
                        HouseholdPowerConsumptionData <<- read.table(cacheFile, header=TRUE, row.names=NULL, sep=",")
                        HouseholdPowerConsumptionData$Date <<- as.Date(HouseholdPowerConsumptionData$Date, "%Y-%m-%d")
                        HouseholdPowerConsumptionData$MeasurementDateTime <<- as.POSIXct(HouseholdPowerConsumptionData$MeasurementDateTime)
                        HouseholdPowerConsumptionData
                }
        }
}