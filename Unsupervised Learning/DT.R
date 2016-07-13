rm(list=ls())

library(C50)

purchase <-read.table("D:\\Viraj\\IMP_Stuff\\BDAP_SPJ\\009_MachineLearning_102\\PA2Data.csv", sep ="\t", header = T)
str(purchase)
ncol(purchaseR)
windows()
par(mfrow=c(2,1))

g <- runif(nrow(purchase))
purchaseR <- purchase[order(g),]
str(purchaseR)
attach(purchaseR)

model <- C5.0(purchaseR[1:14,-5], purchaseR[1:14,5])
model
summary(model)
library(tree)
plot(model)
text(model, cex=.75)

