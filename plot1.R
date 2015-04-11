#read Data

data<-read.table('household_power_consumption.txt',header=TRUE,sep=';',colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?");

#formative Data and subsetData
data$Date<-as.Date(data$Date,'%d/%m/%Y');
sdata<-subset(data,Date==as.Date('2007-02-01')|Date==as.Date('2007-02-02'));

#draw the plot
png(file='plot1.png', width = 480, height = 480, units = "px");
hist(sdata$Global_active_power,col='red',main = 'Gloabl Active Power', xlab='Gloabl Active Power(kilwatts)');
dev.off();