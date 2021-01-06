###===================================================================================================###
###                                     INTRODUCTION TO R                                             ###
###                                   MODULE 5 AND MODULE 6                                           ###
###                                      [DATA CLEANING]                                              ###                
###===================================================================================================###
#1. Handling variables with missing values
#=======================================================================================================

data <- c(88, 95,	85,	NA,	76,	69,	78,	NA,	70,	68)
data

#A.Using the data given above calculate,
#a.	The mean of the data.
mean(data)

#b.	The median of the data.
median(data)

#c.	The SD of the data.
sd(data)

#B. The is.na() function
#is.na()--> [Logical] Is the value an NA? -> TRUE or FALSE
is.na(data)

#subset the data that contains only the missing values
data[is.na(data)]

#subset the data that contains the non-missing values
data[is.na(data)!= TRUE] #naive approach

data[!is.na(data)] 
#use this to learn and understand the grammer
mean(data[!is.na(data)])
sd(data[!is.na(data)])
median(data[!is.na(data)])

#alternative approach
mean(data, na.rm =T) #by removing missing value, cal mean
sd(data, na.rm= T)
medain(data, na.rm=T)

#=======================================================================================================
#2. SIMPLE IMPUTATION
#=======================================================================================================
data <- c(88, 95,	85,	NA,	76,	69,	78,	NA,	70,	68)
data[is.na(data)] = 0
data
#A.	Impute the missing value by mean.
data[is.na(data)]  = mean(data[!is.na(data)])
data

#B.	Impute the missing value by median.
data[is.na(data)] = median(data[!is.na(data)])
data

#=======================================================================================================
#3. CHOOSING BETWEEN MEAN OR MEDIAN IMPUTATION
#=======================================================================================================

#Give a Read about it.
#Depends on the dataset, if it has more outliers, the dataset will be skewed,
#so median imputation is better.


#=======================================================================================================
#4. COMPLETE CASE ANALYSIS
#=======================================================================================================
fram <- read.csv("framingham.csv")
dim(fram)
summary(fram)
?complete.cases()

comp = complete.cases(fram)
length(comp)
comp[1:30]

fram.complete = fram[complete.cases(fram),] #here in R we can use "." in variable name
View(fram.complete)
summary(fram.complete)

nrow(fram)-nrow(fram.complete) 
#we have deleted 582 rows

#=======================================================================================================
#5. WORKING ON THE FRAMINGHAM DATA
#=======================================================================================================
setwd("C:\\Users\\Goutham-ROG\\Documents\\1-Codes\\R\\I2R class codes")
fram <- read.csv("framingham.csv")

View(fram)
dim(fram)
str(fram)
summary(fram)

#=======================================================================================================
#6. IMPUTATION FOR CATEGORICAL VARIABLES
#=======================================================================================================

#A. MODE IMPUTATION
# Mode is the value with the highest frequency
# Mode imputation --> replacing the missing values by mode

#Consider the variable education
summary(fram$education)
table(fram$education)
#mode is 1 with value 1720(apperances)

fram$education[is.na(fram$education)] = 1

#B. KNN IMPUTATION
install.packages("VIM")
library(VIM)
?kNN

#change education to factor
fram_impute = kNN(fram, k=5)
summary(fram_impute)
View(fram_impute) #additional features are created which indicates which obs in that feature got imputed

#to remove those new feature, subset it
fram_impute = subset(fram_impute, select=male:TenYearCHD)
View(fram_impute)

#NOTE: KNN IMPUTATION CAN ALSO IMPUTE NUMERICAL VARIABLES


#=======================================================================================================
## Imputing Numerical variable- CigsPerDay

fram <- read.csv("framingham.csv")
View(fram)
str(fram)
summary(fram)
#there are 29 missing values in the variable "cigsPerDay"


##Statistical Imputation
#lets look at the distibution of the variable
hist(fram$cigsPerDay)
#positively(right) skewed => Mean imputation is not right


#Median Imputation
fram_median <- fram #taking a copy of fram
View(fram_median)

median(fram_median$cigsPerDay) #will return NA/ coz its nt py

fram_median$cigsPerDay[is.na(fram_median$cigsPerDay)] = median(fram_median$cigsPerDay[!is.na(fram_median$cigsPerDay)])

summary(fram_median)
hist(fram_median$cigsPerDay)
#---------------------------------------------------------------

#knn imputation for numerical missing value
install.packages("VIM")
library(VIM)
?kNN

fram_knn <- fram #copy of df

fram_knn_updated <- kNN(fram_knn, variable = "cigsPerDay", k=5)

#before imputing
summary(fram)
#after imputation
summary(fram_knn_updated)
# we can see some new variables cigsperDay_imp, this was used by knn to update the missing value
#lets drop those

fram_knn_updated <- subset(fram_knn_updated, select = male:TenYearCHD)
summary(fram_knn_updated)


#--------------------------------
###R-Part
# http://r-statistics.co/Missing-Value-Treatment-With-R.html
#install.packages('rpart')
?rpart
library(rpart)
fram_rpart <- fram  #copy of df

#anova_mod <- rpart(ptratio ~ . - medv, data=BostonHousing[!is.na(BostonHousing$ptratio), ], method="anova", na.action=na.omit)

#work under progress
mod <- rpart(cigsPerDay ~ currentSmoker , data=fram_rpart[!is.na(fram$cigsPerDay), ], method="anova", na.action=na.omit)
predx <- predict(mod, fram_rpart[is.na(fram$cigsPerDay), ])

predx

fram_rpart$cigsPerDay[is.na(fram_rpart$cigsPerDay)] <- predx

summary(fram_rpart$cigsPerDay)

hist(fram_rpart$cigsPerDay)



#---------------------------------------------------------------
#solution by sir

View(fram)
summary(fram$cigsPerDay)
hist(fram$cigsPerDay)
#more than 50% of our obs are non smoker- 0 cigs perday

#problem we may face if we dont pay attention
#problems with global mean
#1. The people who are nonsmokers their corresponding values for cigsperdayt would be inappropriate
#
#2. The estimates missing values for the smokers will be inncorrect
##
by (fram$cigsPerDay, fram$currentSmoker, summary)
#on avg, smokers smoke 18.36 cigs per day 

#problems with global median
#the imputed values corresponding to smokers cannot be zero

#better approach- using conditional mean
#Impute the missing values of cigsperdday for non smokers as 0
#impute the Na values of smokers with mean-> 18.36 or median(20.0) which we got from grouby sumnary

fram_cp <- fram
#non smoker
fram_cp$cigsPerDay[is.na(fram_cp$cigsPerDay) & fram_cp$currentSmoker==0] = 0
#smoker
fram_cp$cigsPerDay[is.na(fram_cp$cigsPerDay) & fram_cp$currentSmoker==1] = mean(fram_cp$cigsPerDay[!is.na(fram_cp$cigsPerDay) & fram_cp$currentSmoker==1] )

summary(fram_cp$cigsPerDay)
fram_cp$cigsPerDay

#checking the results got via rpart and conditional mean are same
all(fram_cp$cigsPerDay == fram_rpart$cigsPerDay)

#linear regression model
#y = cigsperday
#x= current smoker
fram_cp2 <- fram

linRegModel = lm(cigsPerDay ~ currentSmoker, data=fram_cp2)
linRegModel

#cigsperday(y) = 0 +18.36 * currentsmoker(x)
# y = 0 +18.36x
#
#x =1, y =18.36
#x = 0, y=0
#
# y = expectation[y|x] --> Conditional expectation
#same as above conditional mean approach
predx_lm <- predict(linRegModel, fram_cp2[is.na(fram$cigsPerDay), ])

predx_lm

fram_cp2$cigsPerDay[is.na(fram_cp2$cigsPerDay)] <- predx_lm
summary(fram_cp2$cigsPerDay)

all(fram_cp2$cigsPerDay == fram_rpart$cigsPerDay)
#interesting
predx
predx_lm

#=======================================================================================================
#7. OUTLIERS - OUTLIERS IDENTIFICATION
#=======================================================================================================

p <- c(sample(60:100, 20),15,23,150,168)

#A. Through boxplots
boxplot(p)


#B. By specifying benchmarks
#most common benchmarks are (Q1 - 1.5*IQR, Q3 + 1.5*IQR) OR (mean - 2*SD, mean + 2*SD)




#NOTE: anything below LB is outlier & anything above the UB is an outlier



#=======================================================================================================
#8. OUTLIER TREATMENTS - TRIMMING
#=======================================================================================================





#=======================================================================================================
#8. WINSORIZATION
#=======================================================================================================

#Replacing the outliers by some nearby values
#We can replace the outliers by the UB or the LB (whichever is nearer)



#STEP 1 - any values above UB should be replaced by UB



#STEP 2 - any values bolow LB should be replaced by LB




#=======================================================================================================
#9. VARIABLE TRANSFORMATION
#=======================================================================================================
#SOMETIME TAKING LOG OR SQRT TRANSFORMATION HELPS







#=======================================================================================================
#10. WORKING ON THE FRAMINGHAM DATA
#=======================================================================================================

setwd("E:/Gourab Nath/R/R Session - Data")
fram <- read.csv("framingham.csv")


summary(fram$BMI)

#STEP 1 - Identify the presence of outliers



#STEP 2 - Specify the benchmarks



#STEP 3 - Count the number of outliers



#STEP 4 - Take log/sqrt tranformation & check if the number of outliers is reduced




#SQRT




#STEP 5 - Apply the winsorizing technique to correct the outliers
#if the log & sqrt transformation is not making any difference then we will use the original
#variable and winsorize the outliers








 


