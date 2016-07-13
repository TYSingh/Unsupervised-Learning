USArrests
states=row.names(USArrests)
states
names(USArrests)
apply(USArrests, 2, mean)
apply(USArrests, 2, var)            ##misleading thats why we normalise it
pr.out=prcomp(USArrests,scale=TRUE) ##principal component analysis, scale=true do the normalisation
pr.out
pr.out$rotation
biplot(pr.out,scale = 0)
pr.out$rotation=-pr.out$rotation    ##will reverse the plot 
pr.out$x=-pr.out$x
biplot(pr.out,scale = 0)
pr.out$sdev                         ##standard deviation of principal components
pr.var=pr.out$sdev ^2               ##variance of principal components
pr.var
pve=pr.var/sum(pr.var)              ##percentage of variation
pve
plot(pve,xlab="Principal Component",ylab = "Proportion of Variance Explained"
     ,ylim=c(0,1),type="b")
plot(cumsum(pve),xlab="Principal Component",ylab = "Proportion of Variance Explained"
     ,ylim=c(0,1),type="b")          ##plotting cumulative sum

##second example
food <- read.csv(file.choose(),header = T)
food
pcafood<- prcomp(food[,-1],scale=TRUE)
pcafood
## we strip the first column (country labels) from the data set
##scale = TRUE variables are first standardised.DEFAULT is false

##how many principal components do we need?
plot(pcafood,main="")
mtext(side=1,"European Protien Principal Components",line=1,font=2)
biplot(pcafood,scale=0)
