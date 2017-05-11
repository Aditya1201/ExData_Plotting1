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


# Plot 3

plot(power_consumption$Time, power_consumption$Sub_metering_1 ,type="l", xlab=""
     ,ylab="Energy sub metering" )

lines(power_consumption$Time,power_consumption$Sub_metering_2      ,type="l", col="red")
lines(power_consumption$Time,power_consumption$Sub_metering_3      ,type="l", col="blue")
legend("topright" 
       ,lty = 1, cex=0.6
       ,col=c("black","red","blue")
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
      )
dev.copy(png,file="G:/Data Science Project/Exploratory Data Analysis/Week 1/Course Project/plot3.png", width = 480, height=480)
dev.off()