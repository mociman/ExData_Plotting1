#read file to household_power variable. Assume household_power_consumption.txt in the working directory
household_power <- read.table("household_power_consumption.txt", sep=";", header = T, stringsAsFactors = FALSE)
household_power$Date <- as.Date(household_power$Date,"%d/%m/%Y")

#filter only 2007-02-01 ~ 2007-02-02
one_day_set <- subset(household_power, Date >= "2007-02-01" & Date <="2007-02-02")
one_day_set[, 3:9]<-sapply(one_day_set[, 3:9], as.numeric)
one_day_set$Datetime <- paste(one_day_set$Date,one_day_set$Time)
one_day_set$Datetime <- strptime(one_day_set$Datetime,"%Y-%m-%d %H:%M:%S")

#set png device graphic with 480px height and 480px width
png(filename="plot1.png", width=480, height = 480, units = "px")

#plot the graph
with(one_day_set, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power"))

#write to plot1.png file
dev.off()