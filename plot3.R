### This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which is available on the course web site
### The dataset contains measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available

#Creating Plot 3 - Analyze Energy submeter readings from meters 1-3 over 3 day period in February



setwd("~/Desktop/CourseraR/Exploratory Data Analysis/Course Project 1")


#read in the HPC data and subset to readings for 2/1 - 2/2 
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
                stringsAsFactors=FALSE)
hpc2 <- hpc[min(which(hpc$Date == "1/2/2007")):max(which(hpc$Date == "2/2/2007")),]

ccc<-paste(as.character(hpc2$Date),as.character(hpc2$Time))
DateTime<-strptime(ccc,"%d/%m/%Y %H:%M:%S")

png(file="plot3.png",width=600,height=450)

#start with initilizing empty plot
plot(DateTime, hpc2[, 7], type = "n", xlab = "", ylab = "Energy sub metering")

## plot each of 3 sub_metering values as different color lines
lines(DateTime, hpc2[,7], col=("black"))
lines(DateTime, hpc2[,8], col=("red"))
lines(DateTime, hpc2[,9], col=("blue"))

##add legend (short cut using sprintf)
legend(x="topright", legend = sprintf("Sub_metering_%d", 1:3),
          pch = NA, lty = 1 , col = c("black", "red", "blue"))

##add legend (longer way)
##legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  ##     pch = NA, lty = 1 , col = c("black", "red", "blue"))

dev.off()  ## close the PNG device
