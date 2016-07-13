lastfm <- read.csv(file.choose(),header = T)
lastfm
attach(lastfm)
lastfm[1:19,]
length(lastfm$user)
lastfm$user <- factor(lastfm$user)
lastfm$user
levels(lastfm$user)          ##15,000
levels(lastfm$artist)        ##1,004 artists
lastfm <- data.frame(lastfm)
lastfmmales <- lastfm[lastfm$sex=="m",]
levels(lastfmmales)
install.packages("arules")
library(arules)              ##arules package for association rules
## Computational environment for mining association rules and
## frequent item sets

# we need to manipulate the data for arules
playlist <- split(x=lastfm[,"artist"],f=lastfm$user)   ##split into a list of users
playlist <- lapply(playlist,unique)                    ## remove artist duplicates
playlist
playlist[1:2]                ##first two listeners( 1 & 3)listen to the following bands

playlist <- as(playlist,"transactions")         ##view this as a list of "transactions"
playlist                                        ##transactions is a data class defined in arules
itemFrequency(playlist)              
##list the support for 1004 bands
##no. of times band is listed to on the shopping trips of 15000 users
##computes the relative frequency each artist mentioned by the 15,000 users

itemFrequencyPlot(playlist,support=0.08,cex.names=1.5)
itemFrequencyPlot(playlist,support=0.2,cex.names=1.5) 
## plots the item frequencies(only bands with >% support)

##Finally we build the association rules
##only rules with support >0.01 and confidence >.50
##so it can't be a super rare brand

musicrules <- apriori(playlist,parameter = list(support=.01,confidence=.5))
inspect(musicrules)

