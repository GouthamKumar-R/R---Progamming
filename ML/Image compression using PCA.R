install.packages("jpeg")
library(jpeg)

getwd()
setwd("C:/Users/Goutham-ROG/Documents/1-Codes/R/ML")
image = readJPEG("katia.jpg")

dim(image)
#393 x 522 x 3
#n< d -> so we'll get n-1 PCs

writeJPEG(image,"C:/Users/Goutham-ROG/Documents/1-Codes/R/ML/pianist.jpeg")
#why this normal write reduces the size?

r <- image[,,1]
g <- image[,,2]
b <- image[,,3]

writeJPEG(r,"katia_red.jpg")
writeJPEG(g,"katia_green.jpg")
writeJPEG(b, "katia_blue.jpg")

image.r.pca <- prcomp(r,center = FALSE)
image.g.pca <- prcomp(g,center = FALSE)
image.b.pca <- prcomp(b,center = FALSE)

#store it in a list
rgb.pca <- list(image.r.pca, image.g.pca, image.b.pca)

ncomp = 50

#X(nxd)
#P(nxd) --> P(nxk), k<d 
#A(dxd)

#X(nxd) = P(nxk)*t(A(dxk))

R <- image.r.pca$x[,1:ncomp]%*%t(image.r.pca$rotation[,1:ncomp])
G <- image.g.pca$x[,1:ncomp]%*%t(image.g.pca$rotation[,1:ncomp])
B <- image.b.pca$x[,1:ncomp]%*%t(image.b.pca$rotation[,1:ncomp])

#collating all the RGB
img = array(c(R,G,B),dim=c(dim(image)[1:2],3) )

summary(img)
writeJPEG(img, "katia_compressed.jpg")
