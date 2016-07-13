require(graphics)
library(cluster)
install.packages("fpc")
library(fpc)
# rm(list=ls())
# food <- read.csv("D:\\Viraj\\IMP_Stuff\\BDAP_SPJ\\009_MachineLearning_102\\protein.csv", header = T)
# set.seed(1)
#
# grpProtein <- kmeans(food[,-1], centers = 7, nstart = 10)
# o = order(grpProtein$cluster)
#
# data.frame(food$Country[o],grpProtein$cluster[o])
# windows()
# plot(food$RedMeat, food$WhiteMeat, type = "n", xlim = c(3,19), xlab = "Red meat", ylab = "White Meat")
# text(x=food$RedMeat, y=food$WhiteMeat, labels = food$Country, col=rainbow(7)[grpProtein$cluster])


rm(list=ls())
food <- read.csv(file.choose(),header=T)
set.seed(1)

grpProtein <- kmeans(food[,-1], centers = 5, nstart = 10)
grpProtein
o = order(grpProtein$cluster)
o
data.frame(food$Country[o],grpProtein$cluster[o])
windows()
plot(food$RedMeat, food$WhiteMeat, type = "n", xlim = c(3,19), xlab = "Red meat", ylab = "White Meat")
text(x=food$RedMeat, y=food$WhiteMeat, labels = food$Country, col=rainbow(7)[grpProtein$cluster])

