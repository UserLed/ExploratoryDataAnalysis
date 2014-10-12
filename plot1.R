### This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which is available on the course web site
### The dataset contains measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available

#Creating Plot 1 - Global Active Power frequency bar chart

setwd("~/Desktop/CourseraR/Exploratory Data Analysis/Course Project 1")


#read in the HPC data and subset to readings for 2/1 - 2/2 
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
                stringsAsFactors=FALSE)
hpc2 <- hpc[min(which(hpc$Date == "1/2/2007")):max(which(hpc$Date == "2/2/2007")),]


hist(hpc2$Global_active_power, ylab= "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red", yaxt="n") #draw a new plot

y <- c(0,200,400,600,800,1000,1200) #set tick mark intervals to y

axis(2, at = y) #use axis to apply labels to y-axis (denoted by 2)
## alternatively can use - axis(2, at = c(0,200,400,600,800,1000 1200))

dev.copy(png, file = "plot1.png") ##copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device


