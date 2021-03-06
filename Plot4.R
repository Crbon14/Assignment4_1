# Plot 4 PNG #

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

png(file = "Plot4.png")
par(mfrow=c(2,2),mar=c(4,4,1,1))
with(data_sub,{ 
  plot(time1,Global_active_power,type="l",ylab = "Global Active Power",xlab = "")
  plot(time1,Voltage,type="l",xlab = "datetime")
  plot(time1,Sub_metering_1,type="l",ylab = "Energy Sub metering",xlab = "")
  lines(y = data_sub$Sub_metering_2,x=data_sub$time1,col="red")
  lines(y = data_sub$Sub_metering_3,x=data_sub$time1,col="blue")
  legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(time1,Global_reactive_power,type="l",xlab = "datetime")
})
dev.off()
