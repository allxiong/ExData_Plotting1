library(data.table)
#load large dataset using data,table fread
setwd("C:/MyDocuments/ProfessionalDevelopment/TechnicalSkillDevelopment/DataScience/JohndHopkinsUniversity_DS_program/C04_ExploratoryDataAnalysis/project1")
housedata <- data.table::fread(input="./exdata_data_household_power_consumption/household_power_consumption.txt", na.string="?")
#get subset of dataset from the dates 2007-02-01 and 2007-02-02
housedata <- housedata[housedata$Date %in% c("1/2/2007","2/2/2007") ,]

# Paste date and time together, and convert into a format that R can use for calculation 
#reference : https://www.cyclismo.org/tutorial/R/time.html
datetime <- strptime(paste(housedata$Date, housedata$Time), "%d/%m/%Y %H:%M:%S")
housedata<-cbind(housedata, datetime)

#handle warning message: POSIXlt column type detected and converted to POSIXct
housedata$datetime <- as.POSIXct(housedata$datetime)

#plot 3 using png device. Use lines() function to add lines to plot
png(file="plot3.png", width=480, height=480)
with(housedata,plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = ""))
with(housedata,lines(Sub_metering_2 ~ datetime, col="red"))
with(housedata,lines(Sub_metering_3 ~ datetime, col="blue"))
legend("topright", lty = 1, bty="n", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"))
dev.off()