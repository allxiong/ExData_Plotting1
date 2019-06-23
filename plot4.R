setwd("C:/MyDocuments/ProfessionalDevelopment/TechnicalSkillDevelopment/DataScience/JohndHopkinsUniversity_DS_program/C04_ExploratoryDataAnalysis/project1")
housedata <- data.table::fread(input="./exdata_data_household_power_consumption/household_power_consumption.txt", na.string="?")
#get subset of dataset from the dates 2007-02-01 and 2007-02-02
housedata <- housedata[housedata$Date %in% c("1/2/2007","2/2/2007") ,]

# Paste date and time together, and convert into a format that R can use for calculation 
#reference : https://www.cyclismo.org/tutorial/R/time.html
datetime <- strptime(paste(housedata$Date, housedata$Time), "%d/%m/%Y %H:%M:%S")
housedata<-cbind(housedata, datetime)

#plot 4 using png device. Use lines() function to add lines to plot
png(file="plot4.png", width=480, height=480)
par(mfcol = c(2, 2))
with(housedata, {
  plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ datetime, col="red")
  lines(Sub_metering_3 ~ datetime, col="blue")
  legend("topright", lty = 1, bty = "n", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"))
  plot(Voltage ~ datetime, type = "l", ylab = "Voltage")
  plot(Global_reactive_power ~ datetime, type = "l")
})
dev.off()