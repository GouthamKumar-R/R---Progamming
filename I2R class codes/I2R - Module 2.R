###===================================================================================================###
###                                     INTRODUCTION TO R                                             ###
###                                         MODULE 2                                                  ###
###                                    [DATA AND MATRIX]                                              ###                
###===================================================================================================###
#1. INTRODUCTION TO MATRIX
#=======================================================================================================

#Consider the following two vectors

x <- c(33,45,23,67,54,48)
y <- c(108,151,164,119,135,122)


#A. The cbind() function


#B. The rbind() function



#C. The matrix() function






#=======================================================================================================
#2. MATRIX AND DATA FRAME
#=======================================================================================================

#A Limitation of Matrix and Vector is that it can store only one type of data

#Consider another vector
z <- c("P","T","M","K","H","R")
cbind(x,y)
cbind(x,y,z)


#PROBLEM
#Constructing the following data

### X1	X2	X3	Age	Gender
### 27	40	A	  23	Male
### 39	20	A	  22	Female
### 22	24	B	  50	Female
### 33	32	C	  38	Male
### 30	32	B	  22	Male
### 44	31	B	  43	Male
### 41	22	C	  37	Female
### 35	28	A	  45	Male
### 44	20	C	  20	Female
### 21	46	B	  36	Male


data.frame(x,y,z)


#=======================================================================================================
#3. MATRIX SUBSETTING
#=======================================================================================================

#PROBLEM

#Consider the following matrix: 
### 38	33	47
### 29	48	35
### 21	34	47
### 38	44	21
### 28	26	43


#a)	Generate the above matrix in R and store it in an object.
mat <- matrix(c(38,33,47,
                29,48,35,
                21,34,47,
                38,44,21,
                28,26,43), nrow=5, ncol=3, byrow=T)

mat

#b) Check the dimenison of the matrix



#c)	Print the first element of the matrix.



#d)	Print the last element of the matrix.



#e)	Print the values of the first row.



#f)	Print the values of the fourth row.



#g)	Print the values first column.



#h)	Calculate the total of the third row.



#i)	Calculate the total of the fifth row.



#j)	Calculate the total of the second column.



#k)	Calculate the average of the values of the first row.



#l)	Replace the first value of the matrix by 50.



#m)	Replace the last value of the matrix by 30.



#n)	Replace the first column of the matrix by the vector (20,30,20,30,20)



#o)	Replace the first row of the matrix by its average.




#p)	Print all the values corresponding to 4th & 5th rows and 2nd & 3rd column.




#q)	Replace the matrix obtained above by the matrix
### 38	31
### 20	20



#=======================================================================================================
#3. DATA SUBSETTING - INFORMATION RETRIEVAL
#=======================================================================================================

##A. Extracting an extract from the data

#PROBLEM (Reference: cars.csv data)

setwd("C:\\Users\\Gourab\\Desktop\\R")
cars <- read.csv("cars.csv")
View(cars)


# a) Extract the information of the first 5 rows and firt 5 columns of the data



# b) Extract the information of 20th-29th rows



# c) Extract the information of only the columns MPG, Cylinders and Weight



# d) Extract a random sample from the data (SRSWOR)





##B. Conditional Subsetting

#PROBLEM (Reference: cars.csv)

# a) Extract all the information of the cars which has MPG more than 40



# b) Extract the information of the car/s which has only 3 cylinders



# c) Extract the information of all the cars originated in Europe and has 
# Acceleration more than 20



# d) Name the cars which has MPG more than 40 and Acceleration less than 20 or
# the car has three cylinders




#=======================================================================================================
#4. MORE ON INFORMATION RETRIEVAL
#=======================================================================================================

# Using the subet() function

#PROBLEM (Reference: cars.csv)

# a) Extract all the information of the cars which has MPG more than 40


  
# b) Extract the information of the car/s which has only 3 cylinders



# c) Extract the information of all the cars originated in Europe and has Acceleration more than 20



# d) Name the cars which has MPG more than 40 and Acceleration less than 20 or the car has three cylinders






