###===================================================================================================###
###                                     INTRODUCTION TO R                                             ###
###                                         MODULE 7                                                  ###
###                                      Efficient way to code in R                                   ###                
###===================================================================================================###
#Introduction to Loops, Functions and Conditions
#=======================================================================================================
# for loops
for(i in 1:5) # note i is an element in the vector c(1,2,3,4,5)
{
  print("I'm the King!!")
}


x <- c(3,55,88,47,69)
#1. Here i is the index
for(i in 1:length(x))
{
  print(x[i])
}

#2. Here i is the elements of the array
for(i in x)
{
  print(i)
}

#both will give us same o/p

###===================================================================================================###
#Paste function -> for string concatenation
#=======================================================================================================
paste("All praise the King!!", "Goutham")
#if you see the above o/p has a space between the strings

a <- "apple"
b <- "Ball"
paste(a,b)
paste(a,b,sep ="") #now separator is given a null value

#for loop + paste
for(i in c("Goutham", "Cr7", "Messi"))
{
  print(paste("G.O.A.T of all time", i))
}

###===================================================================================================###
#some basic function
#=======================================================================================================

#install.packages("MASS")
library(MASS)

data("Boston") #loading boston ds
View(Boston)
?Boston


nrow(Boston) #gets u the no. of rows
ncol(Boston) #gets u the no. of columns(features)
names(Boston)  #gets u the names of the columns/features stored in a vector(containing strings as elements)

for (i in 1:ncol(Boston))
{
  print(mean(Boston[,i]))  #it's difficult to interpret 
}

for (i in 1:ncol(Boston))
{
  cat(mean(Boston[,i])) #use cat fn to print in same line
}


#lets take column names
for (i in 1:ncol(Boston))
{
  print(paste(names(Boston)[i],":",mean(Boston[,i])))
}

#better program + Readability
for (i in names(Boston))
{
 print(paste(i,":",round(mean(Boston[,i]),3))) 
}

#but one problem is everything is in string, we can't use them, 
#so let's try something else

#let's store them in a list

#empty list creation
#either way we can do it
avg <- numeric()
avg <- c()

for (i in 1:ncol(Boston))
{
  avg[i] <- mean(Boston[,i])
}

avg
#now lets add names
names(avg) <- names(Boston)

avg
#now it's a vector which has names to it,
#we can subset this vector and retrive data using subset or names

avg[3]
avg["indus"]

#we can do it this way too
mea <- c()
for(i in names(Boston))
{
  mea[i] <- mean(Boston[,i])
}

mea
typeof(mea)
class(mea) #numeric vector

#or we can store it in matrix
as.matrix(avg)  #convert the vector to matrix
View(avg)

#if we have several sts values, we can give col names to matrix

avg_mat <- as.matrix(avg) 

colnames(avg_mat) <- "Mean"
View(avg_mat)

#to subset it you have to give two values (rownames, column names)if you have more data

avg_mat["age",1]

###===================================================================================================###
#Histogram
#=======================================================================================================

hist(Boston[,9])
#gives the histogram for 9th feature in R

#lets rename the title
hist(Boston[,9], main=paste("Histogram of",names(Boston)[9]),
      xlab = names(Boston)[9],col = "Red")
#main -> title
#xlab -> xlabel

#let's generate the graphs for the entire ds
for(i in 1:ncol(Boston))
{
  hist(Boston[,i], main=paste("Histogram of",names(Boston)[i]),
       xlab = names(Boston)[i],
       ylab= "No. of Houses",
       col = "Red")
}

par(mfrow=c(1,2)) #par-> partition 
#c(1,2) -> tells one row two columns -> side by side
#once its done, all the graphs will be partitioned

par(mfrow=c(1,1)) # to revert back to normal(1 picture)

#this gives us the distribution of the feature
par(mfrow=c(2,1))
boxplot(Boston[,1])
hist(Boston[,1])

par(mfrow=c(2,1))
for(i in 1:ncol(Boston))
{
  #Boxplots
  boxplot(Boston[,i], main=paste("Distribution", names(Boston)[i]),
          col= "Orange", border = "Red", horizontal = TRUE)
  
  
  #histogram
  hist(Boston[,i], main="",
       xlab = names(Boston)[i],
       ylab= "No. of Houses",
       col = "Blue")
}


##Lets store the image

#set the wr directory
setwd("C:/Users/Goutham-ROG/Documents/1-Codes/R/I2R class codes/Images")
getwd()


for(i in 1:ncol(Boston))
{
  #giving the name for plots(image files)
  png(paste(names(Boston)[i],".png", sep=""))
  
  par(mfrow=c(2,1))
  #Boxplots
  boxplot(Boston[,i], main=paste("Distribution", names(Boston)[i]),
          col= "Orange", border = "Red", horizontal = TRUE)
  
  
  #histogram
  hist(Boston[,i], main="",
       xlab = names(Boston)[i],
       ylab= "No. of Houses",
       col = "Blue")
  #This gets the graphs
  dev.off()
  
}


###===================================================================================================###
#Functions
#=======================================================================================================


#the first line alone changes from py -> functions
#fn def
bill <- function(b)
{
  total <- b + b*0.2
  return(total)
}

#function call
bill(100)
#we can also pass vectors unlike py
bill(c(100,2200))

#fn def with default value
bill2 <- function(b, tax=10)   #tax is a default argument which holds value 10
{
  total = b + b*tax/100
  return(total)
}

#fn call
bill2(100,20)
bill2(100)
bill2(100,30)

#let's automate the fn

setwd("C:/Users/Goutham-ROG/Documents/1-Codes/R/I2R class codes/Images/dataset img")
Graphs <-function(data)
{
  for(i in 1:ncol(data))
  {
    png(paste(names(data)[i],".png", sep=""))
    
    par(mfrow=c(2,1))  #this is imp coz it spilts the canva inside, orelse last hist plot will only be exported
    #Boxplots
    boxplot(data[,i], main=paste("Distribution", names(data)[i]),
            col= "Orange", 
            border = "Red", 
            horizontal = TRUE)
    
    
    #histogram
    hist(data[,i], main="",
         xlab = names(data)[i],
         col = "Blue")
    #This gets the graphs
    dev.off()
    
    
  }
}

Graphs(Boston)
Graphs(mtcars)

setwd("C:\Users\Goutham-ROG\Documents\1-Codes\R\I2R class codes\Images\dataset img")

###===================================================================================================###
#If and Else
#=======================================================================================================

x <- 5

if(x > 0)
{
  print("x is positive")
}
else  
{
  print("x is negative")
}

# In R statements are executed Line by line, so we should include it inside a block
#correct program
{
  if(x > 0)
  {
    print("x is positive")
  }
  else  
  {
    print("x is negative")
  }
}

#let's validate the i/p and do tax calculation

bill3 <- function(b, tax=10)   
{
  if(!is.numeric(b))
  {
    stop("the value entered must be numeric")  #stop is fn which stops the code and returns the things in value
  }
  total = b + b*tax/100
  return(total)
}

bill3(100)
bill3("ten")

#My problem R- doesn't read this backslash manually i have to change this

setwd("C:\Users\Goutham-ROG\Documents\1-Codes\R\I2R class codes\Images\dataset img")

#solution
x <-readline()  #specify the path in the console
path <- gsub("\\\\", "/", x)  #this has replaced the backslash with forward slash
getwd()
setwd(path)
getwd()

#another solution if you know the path in befrhand, we can use "here" package
install.packages("here")
library(here)
#this is a library used to specify absolute path
#hereafter we don't need to use full path

#we can set sub directory like this
here("1-codes")

#multiple sub directories like
here("1-codes", "R","I2R class codes", "Images", "dataset img")

#---------------------------------------------------------
#Now let's complete our generic Graph function

#Problem statement:
#Create a generic function, which takes a df as an argument, if we pass different datatype, stop the fn and throw a message
#check of the datatype of the feature and if it is a numeric provide the distribution of the feature and store them in a folder

#some problem with the fn
Graph_main <- function(df)
{
  if(!is.data.frame(df))
  {
    stop("Please pass a dataframe as an arugment")
  }
  for(i in 1:ncol(df))
  {
    if(is.numeric(i))
    {
      #Export the graphs with names
      png(paste(names(df)[i],".png",sep=""))
      
      par(mfrow=c(2,1))
      #Boxplots
      boxplot(df[,i], main=paste("Distribution of",names(df)[i]),
              col="Orange",
              border="Red",
              horizontal = TRUE
                )
      
      #histogram
      hist(df[,i],main="",
           col="Blue",
           xlab=names(df)[i])

      dev.off()      
    }
  }
}

Graph_main(mtcars)

getwd()
#change wd
x<-readline()
path<-gsub("\\\\","/",x)
setwd(path)
getwd()

cars <- read.csv("cars.csv")
attr <- read.csv("attrition_modified.csv")

#lets paste our o/p graphs in new folder 
x<-readline()
path<-gsub("\\\\","/",x)
setwd(path)
getwd()

Graph_main(cars)

xxx <- function(df)
{
  for(i in 1:ncol(df))
  {
    if(is.numeric(df[,i]))
    {
      png(paste(names(df)[i],".png",sep=""))
      
      par(mfrow=c(2,1))
      #Boxplots
      boxplot(df[,i], main=paste("Distribution of",names(df)[i]),
              col="Orange",
              border="Red",
              horizontal = TRUE
      )
      
      #histogram
      hist(df[,i],main="",
           col="Blue",
           xlab=names(df)[i])
      dev.off()
      
    }
    if(is.factor(df[,i]))
    {
      png(paste(names(df)[i],".png",sep=""))
      
      barplot(table(df[,i]), main=paste("Barplot for",names(df)[i]),
              col="Blue",
              border="Red")
      dev.off()
    if(is.character(df[,i]))
    {
     stop("Please convert character to factor")
    }
    }
  }
} 

xxx(mtcars)

str(cars)

cars["Origin"]<-as.factor(cars[,9])
cars["Model"]<-as.factor(cars[,8])
cars["Cylinders"]<-as.factor(cars[,3])


xxx(cars)

df <- attrition[, c('Age','Attrition','BusinessTravel','Department','MonthlyIncome','Gender','MaritalStatus','YearsAtCompany')]
View(df)


#change those datatypes
df["BusinessTravel"]<-as.factor(df[,3])
df["Department"]<-as.factor(df[,4])
df["Gender"]<-as.factor(df[,6])
df["MaritalStatus"]<-as.factor(df[,7])
df["Attrition"]<-as.factor(df[,2])

Graph_main(df)
str(df)
xxx(df)

