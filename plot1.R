library(data.table)
#load large dataset using data,table fread
setwd("C:/MyDocuments/ProfessionalDevelopment/TechnicalSkillDevelopment/DataScience/JohndHopkinsUniversity_DS_program/C04_ExploratoryDataAnalysis/project1")
data <- data.table::fread(input="./exdata_data_household_power_consumption/household_power_consumption.txt", na.string="?")
dim(data)

#get subset of dataset from the dates 2007-02-01 and 2007-02-02
feb07Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dim(feb07Data)
head(feb07Data)

hist(feb07Data$Global_active_power, xlab="Global Active Power (Kilowatts)", col="red", main="Global Active Power")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

