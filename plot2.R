#read Data

data<-read.table('household_power_consumption.txt',header=TRUE,sep=';',colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?");

#formative Data and subsetData
data$Time<-strptime(paste(data$Date,data$Time),'%d/%m/%Y %H:%M:%S');
data$Date<-as.Date(data$Date,'%d/%m/%Y');

sdata<-subset(data,Date==as.Date('2007-02-01')|Date==as.Date('2007-02-02'));

#draw the plot
png(file='plot2.png', width = 480, height = 480, units = "px");
Sys.setlocale("LC_ALL","C");
plot(sdata$Time,sdata$Global_active_power,type='l',xlab='',ylab="Global Active Power(kilowatts)")
dev.off();