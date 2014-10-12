plot 4 graphs displaying 

setwd("~/Desktop/CourseraR/Exploratory Data Analysis/Course Project 1")


#read in the HPC data and subset to readings for 2/1 - 2/2 
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
                stringsAsFactors=FALSE)
hpc2 <- hpc[min(which(hpc$Date == "1/2/2007")):max(which(hpc$Date == "2/2/2007")),]


ccc<-paste(as.character(hpc2$Date),as.character(hpc2$Time))
DateTime<-strptime(ccc,"%d/%m/%Y %H:%M:%S")

png(file="plot4.png",width=900,height=600)

##set par(mfrow to 1 row, 3 columns to make 3 plots side by side, set margin and outside margins for each - top margin extra space for labels)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma=c(0,0,2,0))

##Plot 1st graph - usage of Global Active Power over 3 day period
plot(DateTime, y=hpc2$Global_active_power, type="h", ylab = "Global Active Power", xlab="")
*** need to undo the color of graph shading below line, & in pot #2

##Plot 2nd graph - Voltage consumtpion over same 2 day period
plot(DateTime, y=hpc2$Voltage, type="h", ylab = "Voltage")
*** need to undo the color of graph shading below line

##Plot 3rd graph - Voltage consumtpion over same 2 day period
#start with initilizing empty plot
plot(DateTime, hpc2[, 7], type = "n", xlab = "", ylab = "Energy sub metering")

## plot each of 3 sub_metering values as different color lines
lines(DateTime, hpc2[,7], col=("black"))
lines(DateTime, hpc2[,8], col=("red"))
lines(DateTime, hpc2[,9], col=("blue"))

##add legend (short cut using sprintf)
legend(x="topright", legend = sprintf("Sub_metering_%d", 1:3),
       pch = NA, lty = 1 , col = c("black", "red", "blue"))

** need to change the legend size


##Plot 4th graph - Voltage consumtpion over same 2 day period
plot(DateTime, y=hpc2$Global_reactive_power, type="h", ylab = "Global_reactive_power")

dev.off()  ## close the PNG device
