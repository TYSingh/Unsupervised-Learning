View(USArrests)
USArrests

states <- row.names(USArrests) # Returns row labels
states
names(USArrests)

apply(USArrests,2,mean)
apply(USArrests,2,var)
#apply(X, MARGIN, FUN, ...)
#MARGIN:a vector giving the subscripts which the function will be applied over. E.g., for a matrix 1 
#indicates rows, 2 indicates columns, c(1, 2) indicates rows and columns. Where X has named dimnames, it 
#can be a character vector selecting dimension names.

pr.out <- prcomp(USArrests, scale = TRUE)
#Performs a principal components analysis on the given data matrix and returns the results as an object 
#of class prcomp.SCALE:Normalization :It is a logical value indicating whether the variables should be 
#scaled to have unit variance before the analysis takes place. The default is FALSE for consistency with 
#S, but in general scaling is advisable. Alternatively, a vector of length equal the number of columns of 
#x can be supplied. The value is passed to scale.By default, it is FALSE.

# prcomp returns a list with class "prcomp" containing the following components:
######## sdev	
#the standard deviations of the principal components (i.e., the square roots of the eigenvalues of the 
#covariance/correlation matrix, though the calculation is actually done with the singular values of the 
#data matrix).
######## rotation	
#the matrix of variable loadings (i.e., a matrix whose columns contain the eigenvectors). The function 
#princomp returns this in the element loadings.
######## x	
#if retx is true the value of the rotated data (the centred (and scaled if requested) data multiplied by 
#the rotation matrix) is returned. Hence, cov(x) is the diagonal matrix diag(sdev^2). For the formula 
#method, napredict() is applied to handle the treatment of values omitted by the na.action.

######## center, scale	
#the centering and scaling used, or FALSE.

pr.out$rotation 
# Rotation is Loading. No of PCs(PC1,PC2,PC3,PC4) < = no of variables
pr.out$center
pr.out$scale
pr.out$x

class(pr.out)

biplot(pr.out,scale = 0)
# Unscaled raw scores stored in the result can be accessed with scaling = 0.

#To get mirror image of the above plot
pr.out$rotation = - pr.out$rotation
pr.out$x = -pr.out$x
biplot(pr.out, scale = 0)

pr.out$sdev
pr.var <- (pr.out$sdev)^2
pr.var

pve = pr.var/sum(pr.var)
pve

plot(pve,xlab = "Principal Component", ylab = "Proportion of Variance Explained", ylim = c(0,1),type = "b")
plot(cumsum(pve), xlab = "Principal Component", ylab = " Cumulative Proportion of Variance Explained", ylim = c(0,1),type = "b")
