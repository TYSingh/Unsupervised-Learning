library(cluster)
buyer <- read.csv(file.choose(),header = T)
set.seed(1)

grpbuyer <- kmeans(buyer[,-1], centers = 3, nstart = 6)    #nstart is no. of columns,random datasets
grpbuyer
o = order(grpbuyer$cluster)
o
data.frame(buyer$id, grpbuyer$cluster[o])
plot(x=buyer$Budget,y=buyer$Bhk,xlab = "Budget",ylab = "No.of bedrooms",ylim = c(0,10),type = "n")
text(x=buyer$Budget,y=buyer$Bhk,labels = buyer$Budget,col=rainbow(7)[grpbuyer$cluster])
