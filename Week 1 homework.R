## R assignment 1 Exploring data

#C:\Users\mparker1\datasciencecoursera\household_power_consumption
hpc<-read.csv("C:/Users/mparker1/datasciencecoursera/household_power_consumption.txt")
str(hpc)

hpc[1,1]
names(hpc)

#evaluate results data is semicolon delimited, remove and reload
remove(hpc)
hpc<-read.csv("C:/Users/mparker1/datasciencecoursera/household_power_consumption.txt", header=T, sep=";", na.strings="?")
str(hpc)

hpc$Date[1:3]
#in day month year formate
class(hpc$Date)
newdate<- strptime(hpc$Date, "%e/%m/%Y")  ##Upper Case Y vs lower case y impact on year formatting
newdate[1:3]


#subsetting the rows
sub_hpc<- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"), ]
head(sub_hpc)
str(sub_hpc)

#plot1.png
hist(sub_hpc$Global_active_power,col="orange") #orange is not a match
colors()
hist(sub_hpc$Global_active_power,col="orangered", main = "Global Active Power", xlab="Global Active Power (kilowats)") #found it

        #save it using file devices
        png(file="C:/Users/mparker1/ExData_Plotting1/plot1.png",width=480, height=480 ) 
        hist(sub_hpc$Global_active_power,col="orangered", main = "Global Active Power", xlab="Global Active Power (kilowats)")
        dev.off()
getwd()

#plot2.png
sub_hpc$datetime <-strptime( paste( as.Date(sub_hpc$Date, "%d/%m/%Y"), sub_hpc$Time, sep=" "), "%Y-%m-%d %H:%M:%S" )
head(sub_hpc, n=100)
with(sub_hpc, plot(y=Global_active_power,x=datetime, type="l", ylab="Global Active Power (kilowatts)", xlab =""))
        
        #save it using file devices
        png(file="C:/Users/mparker1/ExData_Plotting1/plot2.png",width=480, height=480 ) 
        with(sub_hpc, plot(y=Global_active_power,x=datetime, type="l", ylab="Global Active Power (kilowatts)", xlab =""))
        dev.off()

        
#plot3.png
        str(sub_hpc)
with(sub_hpc, plot(y=Sub_metering_1, x=datetime, type="l", ylab="Energy sub metering", xlab=""))
lines(y=sub_hpc$Sub_metering_2, x=sub_hpc$datetime, col="red")        
lines(y=sub_hpc$Sub_metering_3, x=sub_hpc$datetime, col="blue")        
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black", "red", "blue"))


        #save it using file devices
        png(file="C:/Users/mparker1/ExData_Plotting1/plot3.png",width=480, height=480 ) 
        with(sub_hpc, plot(y=Sub_metering_1, x=datetime, type="l", ylab="Energy sub metering", xlab=""))
        lines(y=sub_hpc$Sub_metering_2, x=sub_hpc$datetime, col="red")        
        lines(y=sub_hpc$Sub_metering_3, x=sub_hpc$datetime, col="blue")        
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black", "red", "blue"))
        dev.off()


#plot4.png

#add voltage by datetime and global reactive power by datetime
        str(sub_hpc)
        #visualize the additional graphs
        with(sub_hpc, plot(y=Voltage,x=datetime, type="l")) 
        with(sub_hpc, plot(y=Global_reactive_power,x=datetime, type="l")) #orange is not a match
        
        #Open the file writer
        png(file="C:/Users/mparker1/ExData_Plotting1/plot4.png",width=480, height=480 ) 
        par(mfcol=c(2,2))#create the par
        with(sub_hpc, plot(y=Global_active_power,x=datetime, type="l", ylab="Global Active Power (kilowatts)", xlab =""))
        
        with(sub_hpc, plot(y=Sub_metering_1, x=datetime, type="l", ylab="Energy sub metering", xlab=""))
        lines(y=sub_hpc$Sub_metering_2, x=sub_hpc$datetime, col="red")        
        lines(y=sub_hpc$Sub_metering_3, x=sub_hpc$datetime, col="blue")        
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black", "red", "blue"))
        
        with(sub_hpc, plot(y=Voltage,x=datetime, type="l")) 
        with(sub_hpc, plot(y=Global_reactive_power,x=datetime, type="l")) #orange is not a match
                
        dev.off()
        
        
        