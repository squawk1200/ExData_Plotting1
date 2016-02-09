plot2 <- function(data=NULL) 
{
  
  data <- load_data()
  
  png("plot2.png", width=480, height=480)
  
  plot(data$Time, data$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  dev.off()
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