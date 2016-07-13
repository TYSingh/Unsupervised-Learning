library(cluster)
rm(list = ls())
food <- read.csv(file.choose(),header=T)
food

windows()

# default method is Average
foodagg = agnes(food,diss = FALSE, metric = "euclidian")
plot(foodagg)

# method is Single
foodagg = agnes(food,diss = FALSE, metric = "euclidian", method = "single")
plot(foodagg)

# method is Complete
foodagg = agnes(food,diss = FALSE, metric = "euclidian", method = "complete")
plot(foodagg)


# 2 buyers data
install.packages("cluster")
library(cluster)
buyers <- read.csv(file.choose(),header=TRUE)
buyers

#Euclidean distance and average linkage
# agnes() : method for AGglomerative NESting
buyer_Agg <- agnes(buyers,diss=FALSE,metric = "euclidean")
plot(buyer_Agg)


##Euclidean distance and single linkage

buyer_Agg_single <- agnes(buyers,diss=FALSE,metric = "euclidean", method = "single")
plot(buyer_Agg_single)

##Euclidean distance and complete linkage

buyer_Agg_complete <- agnes(buyers,diss=FALSE,metric = "euclidean", method = "complete")
plot(buyer_Agg_complete)
