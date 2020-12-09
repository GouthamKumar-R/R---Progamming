###===================================================================================================###
###                                    INTRODUCTION TO R                                              ###
###                                        MODULE 3                                                   ###
###                                 [DESCRIPTIVE ANALYTICS]                                           ###                
###===================================================================================================###
#1. SUMMARIES AND STATISTICS
#=======================================================================================================

setwd("C:\\Users\\Goutham-ROG\\Documents\\1-Codes\\R\\I2R class codes")
cars <- read.csv("cars.csv")

#A. The summary() function
summary(cars$MPG) #for numerical, we get six point summary
summary(cars$Origin)  #for categ it gives freq counts
summary(cars) 


#B. The by() / tapply() function
?by
mean(cars$Weight)
#groupby analysis(contigency table)
by(cars$Weight, cars$Origin, FUN=mean)
by(cars$Weight, cars$Origin, FUN=median)
by(cars$Weight, cars$Origin, FUN=sd)
by(cars$Weight, cars$Origin, FUN=summary)

tapply(cars$Weight, cars$Origin, FUN=mean)
x = tapply(cars$Weight, cars$Origin, FUN=mean)
x[1]
#gives vector o/p; now we can easily retrive info from this vector

#=======================================================================================================
#2. TABLES
#=======================================================================================================
table(cars$Origin) #freq dist table

table(cars$Origin, cars$Cylinders) #bivariate table

prop.table(table(cars$Origin)) #realtive freq table

round(prop.table(table(cars$Origin))*100,2) #table of percentages

#table of joint probability
round(prop.table(table(cars$Origin, cars$Cylinders)),3)

#table of conditional prob(conditioned on rows)
prop.table(table(cars$Origin, cars$Cylinders),1) 
#90.4% cars have 4cylinders given that the origin was europe(w.r.t to origin(rows))

#table of conditional prob(conditioned on columns)
prop.table(table(cars$Origin, cars$Cylinders),2)
#31% cars in europe given that they have 4 cylinders (w.r.t to cylinders(cols))


#=======================================================================================================
#3. HISTOGRAMS
#=======================================================================================================
?hist

hist(cars$MPG)

hist(cars$MPG,xlab="Miles Per Gallon", 
              ylab="No.of cars",
              main= "Histogram of MPG",
              col="Blue",
              border="Gold")

hist(cars$MPG, probability = T
     ,xlab="Miles Per Gallon", 
     ylab="PDF",
     main= "Histogram of MPG",
     col="Blue",
     border="Gold")

#=======================================================================================================
#4. BOXPLOTS
#=======================================================================================================

boxplot(cars$MPG)

boxplot(cars$MPG, horizontal = T)

boxplot(cars$MPG, 
        ylab="Miles Per Gallon",
        main= "Boxplot for MPG",
        col="Green",
        border ="Red")

#=======================================================================================================
#5. BAR CHARTS
#=======================================================================================================

barplot(table(cars$Cylinders), ylab ="Count of cars") #you have to give a table

barplot(prop.table(table(cars$Cylinders)),ylab ="PDF")

barplot(table(cars$Cylinders), 
        xlab="No. of Cylinders",
        ylab ="No. of cars",
        main="Barplot for Cylinders",
        col="Magenta")


#=======================================================================================================
#6. SCATTERPLOTS AND PAIRWISE SCATTERPLOTS
#=======================================================================================================

plot(cars$Weight, cars$MPG) 

plot(cars$Weight, cars$MPG, pch=20) #change pch-> for different shapes

plot(subset(cars, select= MPG:Horsepower)) #pairwise scatter plot


