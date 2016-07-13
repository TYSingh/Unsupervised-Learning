######Step:1 --- Read data

lastfm <- read.csv("C:/Users/User/Desktop/14 Jan/lastfm_Male.csv")
#Data Exploration Starts
lastfm[1:19,]
length(lastfm$user) #  211823 records in the file
lastfm$user <- factor(lastfm$user)
length(levels(lastfm$user))   # 11149 users
length(levels(lastfm$artist)) #1,004 artists
### Associating between artists not users.In the notes examples, we considered association between
#products, Not buyers
#Data Exploration Ends


####### Step:2 --- Load package
install.packages(c("arules"))
library(arules)
## a-rules package for association rules
# computational environment for mining association rules and frequent item sets


####### Step:3 --- Data Preprocessing
## we need to manipulate(pre-process) the data a bit for arules
playlist <- split(x=lastfm[,"artist"],f=lastfm$user) #split into a list of users
playlist <- lapply(playlist,unique)  ## remove artist duplicates
playlist[1:2] ## The first two listeners (3 and 4 users) listen to the displayed artists


playlist <- as(playlist,"transactions")
## view this as a list of "transactions"
## transactions is a data class defined in arules

itemFrequency(playlist)
## lists the support of the 1,004 artists
## number of times band is listed to on the shopping trips of 15,000 users
## computes the rel freq each artist mentioned by the 15,000 users

itemFrequencyPlot(playlist,support=0.08,cex.names=1.5)
## plots the item frequencies (only artists with > % support)
# In notes we checked "support count". Algorithm in package "arules" uses "support%"
# plot will show 13 artists as relevant. so total no of combinations of artists = (2)^13 -1.


## Finally, we build the association rules
## only rules with support > 0.01 and confidence > 0.50
## so it can't be a super rare artist
musicRules <- apriori(playlist,parameter = list(support=0.01, confidence =0.5))


inspect(musicRules)

#Out of ((2)^13 -1), 64 are unpruned associations.
