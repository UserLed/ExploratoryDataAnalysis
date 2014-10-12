### This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which is available on the course web site
### The dataset contains measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available

#Creating Plot 2 - Analyze Global Active Power (kw) over 3 day period in February



setwd("~/Desktop/CourseraR/Exploratory Data Analysis/Course Project 1")


#read in the HPC data and subset to readings for 2/1 - 2/2 
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
                stringsAsFactors=FALSE)
hpc2 <- hpc[min(which(hpc$Date == "1/2/2007")):max(which(hpc$Date == "2/2/2007")),]


ccc<-paste(as.character(hpc2$Date),as.character(hpc2$Time))
DateTime<-strptime(ccc,"%d/%m/%Y %H:%M:%S")

plot(DateTime, y=hpc2$Global_active_power, type="h", ylab = "Global Active Power (kilowatts)", xlab="")

dev.copy(png, file = "plot2.png") ##copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device
