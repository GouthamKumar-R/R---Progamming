###===================================================================================================###
###                                     Introduction to R                                             ###
###                                         MODULE 1                                                  ###
###                                    [DATA AND VECTORS]                                             ###                
###===================================================================================================###
#1. READING THE CARS.CSV DATA IN R
#=======================================================================================================

getwd()                                 #get the working directory
setwd("C:\\Users\\Goutham-ROG\\Documents\\1-Codes\\R\\I2R class codes")  #set the working directory
cars = read.csv("cars.csv")             #read the data
# or
# cars = read.csv("fullpath\\filename)
#========================================================================================================
#2. SOME INITIAL STEPS WITH DATA
#========================================================================================================
#A. Checking the dimension of the data
dim(cars)

#B. Number of rows of the data
nrow(cars)

#C. Number of columns of the data
ncol(cars)

#D. Studying the Structure of the data
str(cars)
#chr -> equivalent to py [object(string]

#E. Printing first and last few lines of a data
head(cars)

tail(cars)
#display only last 3 rows
tail(cars, 3)

#F. Viewing the entire data
View(cars) #capital V


#========================================================================================================
#3. INTRODUCTION TO VECTORS
#========================================================================================================

v <- 5 #assignment symbol (preferred)
v+1

#or 
v = 5  #will also work

#R is case-sensitive
#V is different from smaller case v

#A. Defining a vector

x <- c(12,34,24,45,7,18) # c stands for combine
x

#B. Generating regular sequences - The colon [:] operator
1:10 #at an interval of one

10:1
#C. Generating regular sequences - The seq() function
seq(1,10,2)

seq(0,1,length.out = 10)  
#length.out helps to divide the interval into equal parts

#D. generating simple random sample
sample(1:10, 3)  #first range #second-> no. of sample
#by default it is without replacement

sample(1:10, 3, replace = T) #with replacement

#to get help
?sample

#probability sampling
sample(0:1,10, replace =T, prob = c(0.2,0.8))
#we are giving more weight to values near 1(80%)

#========================================================================================================
#4. SOME USEFUL FUNCTIONS
#========================================================================================================
x
#A. sum()
sum(x)

#B. mean(), median(), sd(), var()
mean(x)

median(x)

sd(x)

var(x)

y<-c(1,1,1,1,1.2)
var(y)
#C. max(), min()
min(x)

max(x)

#D. quantile()
quantile(x,0.75)
quantile(x,0.25)

#E. length()
length(x)

#F. summary
summary(x)

summary(cars)

#========================================================================================================
#5. VECTOR SUBSETTING
#========================================================================================================

x
x[1]  #subset 1 element
x[c(1,3)]  #subset 1 to 3 (exclude 3)


#The conditional operators

# > is greater than
# < is less than
# == is equal to
# <= is less than or equal to
# >= is greater than or equal to

x
x > 20
x == 24


#and - &
#or - |

(x>30 | x<10)
(x<30 & x >10)


#PROBLEM:
#Consider the following two vectors

x <- c(33,45,23,67,54,48)
y <- c(108,151,164,119,135,122)

x
y

#Write a R code to find the folowing solutions
# a. Vaues of x that are less than 35
x[x < 35]


# b. The number of observations in y that are more than 150
length(y[y>150])  

#alternate way
sum(y>150)

# c. The number of observations in y that are between 120 and 165
length(y[(y >120 & y < 165)])

sum(y >120 & y < 165)

# d. The vaues in x that are less than 30 or greater than 50
x[(x <30 | x>50)]

# e. The values in x for which the values in y is less than or equal to 120
x[(y<=120)]

# f. The values in y for which the values in x is equal to 45
y[(x == 45)]

#========================================================================================================
#6. VECTORS IN DATA
#========================================================================================================

#Note that in a data set each rows or columns is nothing but a vector
#A variable in data can be extracted as follows:














#PROBLEM (Reference: cars.csv)

# a. Which car has the highest mpg?



# b. Which car is the heaviest?



# c. Which car is the lightest?



# d. Which car has the highest value of the horsepower?



# e. What is the lowest value of the horsepower?



# f. What is the highest values of the mpg?



# g. List the top 10 percentile values of mpg.



# h. List the name of cars which has mileage between 25 and 35 mpg.



# i. What is the average weight of the cars which has 8 cylinders?



# j. What is the average weight of the cars that are originated in Japan?



# k. Randomly select 20 cars from the given list of cars.













