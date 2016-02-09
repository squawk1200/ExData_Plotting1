plot1 <- function()
{
  data <- load_data()
  
  png("plot1.png", width=480, height=480)
  
  hist(data$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       ylab="Frequency",
       col="red")
  
  dev.off()
}

load_data <- function()
{
  x <- read.table("../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  x$Time <- strptime(x$Time, "%H:%M:%S")
  x$Date <- as.Date(x$Date, "%d/%m/%Y")
  
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  
  y <- subset(x, Date %in% dates)
  y
}