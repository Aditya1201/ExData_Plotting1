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


# Plot 1
  png(file="G:/Data Science Project/Exploratory Data Analysis/Week 1/Course Project/plot1.png", width = 480, height=480)
  hist(power_consumption$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
  dev.off()