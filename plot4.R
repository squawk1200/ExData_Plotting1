plot4 <- function()
{
  data <- load_data()
  
  png("plot4.png", width=480, height=480)
  
  par(mfrow=c(2,2))
  
  plotGlobalActivePower(data)
  
  plotVoltage(data)
  
  plotEnergy(data)
  
  plotGlobalReactivePower(data)
  
  dev.off()
}


plotGlobalActivePower <- function(data)
{
  plot(data$Time, data$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power")
}


plotVoltage <- function(data)
{
  plot(data$Time, data$Voltage,
       type="l",
       xlab="datetime",
       ylab="Voltage")
}


plotEnergy <- function(data)
{
  plot(data$Time, data$Sub_metering_1, type="l", col="black",
       xlab="", ylab="Energy sub metering")
  lines(data$Time, data$Sub_metering_2, col="red")
  lines(data$Time, data$Sub_metering_3, col="blue")
  
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1, 
         bty="n")
}



plotGlobalReactivePower <- function(data)
{
  plot(data$Time, data$Global_reactive_power,
       type="l",
       xlab="datetime",
       ylab="Voltage")
}

load_data <- function()
{
  x <- read.table("../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
  x$Date <- as.Date(x$Date, "%d/%m/%Y")
  x$Time <- as.POSIXct(strptime(paste(x$Date, x$Time, sep = " "),
                                format = "%Y-%m-%d %H:%M:%S"))
  
  
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  
  y <- subset(x, Date %in% dates)
  y
}