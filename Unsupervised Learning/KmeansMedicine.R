library(cluster)
medicine <- read.csv(file.choose(),header = T)
set.seed(1)

#to get the path of file, click on Import Dataset on work Environment.Before this, convert the file into CSV.
#check the path on console once the file is imported. copy and paste in the below command
#medicine <- read.csv("C:/SPJain/Term-3/MachineLearning-102_Unsupervised/ML-102_Day2/Medicine_Data.csv")
View(medicine)
set.seed(1)
# K-Means Clustering
grpMedicine <- kmeans(medicine[,-1],centers=2,nstart=3)
grpMedicine
# Checking in which cluster each medicine will fall[Check notes and Excel file for manual calculations done]
data.frame(medicine$Medicine,grpMedicine$cluster)
#  plot
plot(medicine$Weight,medicine$PH.index,type="n",xlim=c(0,19),xlab = "Weight",ylab="PH index")
text(x=medicine$Weight,y=medicine$PH.index,labels = medicine$Weight,col=rainbow(7)[grpMedicine$cluster])
