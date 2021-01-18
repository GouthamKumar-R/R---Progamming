install.packages("jpeg")
library(jpeg)

getwd()
setwd("C:/Users/Goutham-ROG/Documents/1-Codes/R/ML")
image = readJPEG("katia.jpg")
#image = readJPEG("parrot_whitebg.jpg")

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

#writeJPEG(r,"parrot_red.jpg")
#writeJPEG(g,"parrot_green.jpg")
#writeJPEG(b, "parrot_blue.jpg")

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
R = ifelse(R>1,1,R)
G = ifelse(G>1,1,G)
B = ifelse(B>1,1,B)

R = ifelse(R<0,0,R)
G = ifelse(G<0,0,G)
B = ifelse(B<0,0,B)
#if you don't do the above condition some value of the image will go negative
#if that happens for lot of pixels it will increase our file size 
#and we may get some colors in our reconstructed image which we can understand 
# to understand that try an image with white background #check parrot compressed
#now try with filters
img = array(c(R,G,B),dim=c(dim(image)[1:2],3) )

summary(img)
writeJPEG(img, "katia_compressed.jpg")

#writeJPEG(img, "Parrot_compressed.jpg")

#change the components and choose the best no. PC required to reconstruct the image with less loss of information