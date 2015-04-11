#read Data

data<-read.table('household_power_consumption.txt',header=TRUE,sep=';',colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?");

#formative Data and subsetData
data$Time<-strptime(paste(data$Date,data$Time),'%d/%m/%Y %H:%M:%S');
data$Date<-as.Date(data$Date,'%d/%m/%Y');

sdata<-subset(data,Date==as.Date('2007-02-01')|Date==as.Date('2007-02-02'));

#draw the plot
png(file='plot4.png', width = 480, height = 480, units = "px");
Sys.setlocale("LC_ALL","C");
par(mfrow = c(2, 2))
with(sdata,{
        plot(sdata$Time,sdata$Global_active_power,type='l',xlab='',ylab="Global Active Power(kilowatts)");
        plot(sdata$Time,sdata$Voltage,type='l',xlab='dateTime',ylab="Global Active Power(kilowatts)");
        plot(sdata$Time,sdata$Sub_metering_1,type='l', col='black',xlab='',ylab='Energy sub metering');
        with(sdata,lines(sdata$Time,sdata$Sub_metering_2,type='l',col='red'));
        with(sdata,lines(sdata$Time,sdata$Sub_metering_3,type='l',col='blue'));
        legend("topright", pch = 1, col = c('black',"red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        plot(sdata$Time,sdata$Global_reactive_power,type='l', col='black',xlab='dateTime',ylab='Global_relative_power')
})

dev.off();