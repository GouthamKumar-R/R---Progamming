###===================================================================================================###
###                                      INTRODUCTION TO R                                            ###
###                                          MODULE 4                                                 ###
###                                    [DATA MANIPULATION]                                            ###                
###===================================================================================================###
#1. The class() function
#=======================================================================================================
x <- 5.6
class(x)

b <-c(1,2,3)
class(b)

mtcars
class(mtcars)

#=======================================================================================================
#2. Class conversion
#=======================================================================================================
setwd("C:\\Users\\Goutham-ROG\\Documents\\1-Codes\\R\\I2R class codes")
cars <- read.csv("cars.csv")

str(cars)

class(cars$Horsepower)
#convert intg to numeric
cars$Horsepower <- as.numeric(cars$Horsepower)
class(cars$Horsepower)

cars$Model <- as.factor(cars$Model)
class(cars$Model)

#=======================================================================================================
#3. Sort & Order
#=======================================================================================================

#A. Sort the variable Acceleration in ascending order
cars$Acceleration
sort(cars$Acceleration)

sort(cars$Acceleration, decreasing = T)

#sort for df
sort(cars) #this wont work, u need to specify col
#order gives index pos of the elements
x <- c(4,15,78,10)
order(x) 
x[order(x)] #we get a sorted list 
#now sort the data, based on ascending order of acceleration
cars_acc <- cars[order(cars$Acceleration),]
View(cars_acc)
#for dec order "Use '-' to reverse the process"
cars_acc2 <- cars[order(-cars$Acceleration),]
View(cars_acc2)

#B. Sort the variable Weight in Decsending Order

sort(cars$Weight, decreasing = T)

#C. Sort the data by MPG in increasing order

View(cars[order(cars$MPG),])

#D. Sort the data by MPG in increasing order and then sort by Origin

View(cars[order(cars$Origin, cars$MPG),])

#mpg in decreasing order

View(cars[order(cars$Origin, -cars$MPG),])

#E. Sort the data by Cylinders and then by MPG

View(cars[order(cars$Cylinders, cars$MPG),])

#F. Sort the data by MPG in ascending order and by cylinder in descending order

View(cars[order(-cars$Cylinders, cars$MPG),])

#=======================================================================================================
#4. Data Transformation
#=======================================================================================================

# Plot a scatter plot between MPG and weight. Comment of the linearity.

plot(cars$Weight,cars$MPG)
#It is a non-linear relationship
cor(cars$Weight,cars$MPG)
#correlation -> -0.7875

# Re-plot the scatter plot by taking the log transformation of both the variables. Does the linearity 
# Improve?

plot(log(cars$MPG), log(cars$Weight))
#now it is linear than the above plot
cor(log(cars$MPG), log(cars$Weight))
#correlation-> NAN ?

# But there is a problem! Check the summary of log(MPG). What do you observe?
summary(log(cars$MPG))
#min-> -Inf, therefore-> mean also -Inf
#MPG value is zero for some points, that is why we get -Inf when we transform

# Can you identify where we got misleaded? Probably the answer lies in the summary of MPG.
log(0)

# How can we correct this?
summary(log(cars$MPG+1)) #we are shifting the scale
#remove or impute those zero points
cor(cars$Weight[cars$MPG!=0], cars$MPG[cars$MPG!=0])
cor(log(cars$Weight[cars$MPG!=0]), log(cars$MPG[cars$MPG!=0]))
#correlation has increased after log transform

# Study the association between MPG and Horsepower.
plot(cars$MPG, cars$Horsepower)
cor(cars$MPG, cars$Horsepower)

plot(log(cars$MPG), log(cars$Horsepower))
cor(log(cars$MPG[cars$MPG!=0 & cars$Horsepower!=0]), log(cars$Horsepower[cars$MPG!=0 & cars$Horsepower!=0]))
#they are negatively correlated

#=======================================================================================================
#5. The ifelse() function
#=======================================================================================================

# PROBLEM 1:
# Create a variable HP which will take only two values:
# IF Horsepower < 100 THEN "Low HP"
# IF Horsepower >= 100 THEN "High HP"







#PROBLEM 2:
# Create a Variable MPG_Rate which will take on the values as follows:
# IF MPG < 15 THEN "Normal"
# IF MPG >= 15 AND MPG <=25 THEN "GOOD"
# IF MPG >= 25 AND MPG <=35 THEN "GREAT"
# IF MPG >= 35 THEN "AWESOME"







#=======================================================================================================
#6. SQL in R
#=======================================================================================================


require(sqldf)

sqldf('SELECT * from mtcars')
sqldf('select mpg from mtcars')
sqldf('select mpg, wt from mtcars')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg), stdev(mpg) from mtcars group by am')






