# Regression Tree
install.packages("HSAUR")
library(HSAUR)
data("Forbes2000")
?Forbes2000

View(Forbes2000)
dim(Forbes2000)

summary(Forbes2000)

#remove the missing values from target
Forbes2000 <- subset(Forbes2000, !is.na(profits))

summary(Forbes2000)

#building a CART model to predict profit
#profit <- assets + market value + sales
install.packages("rpart")
library(rpart)

model1 = rpart(profits ~ assets + marketvalue + sales, data=Forbes2000 )

plot(model1)
text(model1, cex=0.75, pretty = 0)

#beautifying the plot
plot(model1, uniform = TRUE)
plot(model1, uniform = TRUE, margin = 0.05)
plot(model1, uniform = TRUE, margin = 0.1, branch =0.5)
text(model1, cex=0.8, pretty=0)

#gets the lambda value(CP- Complexity Parameter), xerror-> error of the model, nsplit is the splits
printcp(model1)

#we can see that for CP=0.020309, we have the lowest error -> 0.74(shocastic nature-it might vary)
# so the we have to prune the tree, such that it has 3 splits

model1.prune <- prune(model1, cp = 0.020309)
plot(model1.prune, uniform = TRUE, margin = 0.1, branch =0.5)
text(model1.prune, cex=0.8, pretty=0)


