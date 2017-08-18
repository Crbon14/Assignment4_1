# Plot 1 PNG #

#STEP1 : Reading data
data0 <- read.table("household_power_consumption.txt",comment.char = "#",header = TRUE,sep = ";",na.strings = "?")

#STEP2 : Data Manipulation
# Converting Date & Time data into Date & POSIXct format
date0 <- data0$Date
str(date0)
date0 <- as.Date(as.character(date0), "%d/%m/%Y")
str(date0)

time0 <- data0$Time
date1 <- data0$Date
time1 <- paste(date1,time0)

time1 <- strptime(time1,"%d/%m/%Y %H:%M:%S")

data1 <- data.frame(date0,time1,data0[,3:9])

# Data Subsetting : To be used for plotting

data_sub <- subset(data1,date0==as.Date("2007-02-01") | date0==as.Date("2007-02-02") )

# STEP3 : Plotting
# PNG Plot generation
png(file = "Plot1.png")
hist(data_sub$Global_active_power,col="red",xlab = "Global Active Power (Kilowatts)",main = "Global Active Power")
dev.off() 