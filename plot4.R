# Reading the data into R

file_url <- "G:/Data Science Project/Exploratory Data Analysis/Week 1/Course Project/household_power_consumption.txt"
install.packages("sqldf")
library("sqldf")
power_consumption <-read.csv.sql(file=file_url
                                  ,sql= "select * from file where Date in ('1/2/2007','2/2/2007')"
                                  ,header = TRUE, sep = ";")
closeAllConnections()


#Cleaning the Data and Formatting
power_consumption[power_consumption=="?"]<- NA
power_consumption$Date<- as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption$Time<- strptime(paste(power_consumption$Date,power_consumption$Time, sep=":"),
                                  "%Y-%m-%d:%H:%M:%S")


# Plot 4

par(mfcol=c(2,2))

plot(power_consumption$Time,power_consumption$Global_active_power,type="l", xlab="", ylab="Global Active Power")

plot(power_consumption$Time, power_consumption$Sub_metering_1 ,type="l", xlab=""
     ,ylab="Energy sub metering" )

lines(power_consumption$Time,power_consumption$Sub_metering_2      ,type="l", col="red")
lines(power_consumption$Time,power_consumption$Sub_metering_3      ,type="l", col="blue")
legend("topright" 
       ,lty = 1, cex=0.2
       ,col=c("black","red","blue")
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"
                 
       )
)

plot(power_consumption$Time,power_consumption$Voltage,type="l", xlab="datetime", ylab="Voltage")

plot(power_consumption$Time,power_consumption$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")


