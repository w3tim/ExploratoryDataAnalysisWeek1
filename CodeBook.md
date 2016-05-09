#Exploratory Data Analysis Week 1 Assignment Code Book

Here we are using the "Individual household electric power consumption Data Set" available from the UC Irvine Machine Learning Repository.

* Available: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip [20Mb]

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
1. Date: Date in format dd/mm/yyyy
2. Time: time in format hh:mm:ss
3. Global_active_power: household global minute-averaged active power (in kilowatt)
4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
5. Voltage: minute-averaged voltage (in volt)
6. Global_intensity: household global minute-averaged current intensity (in ampere)
7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
## Processing steps
Each plot R file is self-contained so there are common steps to each, although each plot has its own specific features.
Common steps
1.	Script checks to see if source data is available, if not, it is downloaded to `./data`
2.	Script checks to see if a cached version of the tidied data is available in the file system
  * If no cached version is available, this is created and saved as `./data/ HouseholdPowerConsumptionCache.txt`
3.	Tidied data is loaded into R for plotting
###Plot 1
1.	PNG Graphics device is created
2.	Basic histogram is created, coloured red, x axis labelled and title given
3.	Device is closed
###Plot 2
1.	PNG Graphics device is created
2.	Basic plot is created showing the Global Active Power in kilowatts against the Measurement DateTime, type=”l” and y axis labelled
3.	Device is closed
###Plot 3
1.	PNG Graphics device is created
2.	Basic plot is created showing the 3 Sub_metering datasets against the Measurement DateTime, type=”n” (so everything bar the data is plotted), axis labels specified
3.	Line drawn using lines() for Sub_metering_1, coloured black
4.	Line drawn using lines() for Sub_metering_2, coloured red
5.	Line drawn using lines() for Sub_metering_3, coloured blue
6.	Legend created in top right. (lty=1)
7.	Device is closed
###Plot 4
1.	PNG Graphics device is created
2.	Global mfrow set to 2 rows and 2 columns for panel display
3.	First plot of panel drawn as per Plot 2
4.	Second plot of the panel (top right) drawn as basic plot (type=”l”) showing Voltage against Measurement DateTime
5.	Third plot of the panel (bottom left) is drawn as per Plot 3 but the legend has had bty=”n” specified
6.	Fourth plot of the panel (bottom right) is a basic plot (type=”l”) showing Global reactive power against Measurement DateTime
7.	Device is closed