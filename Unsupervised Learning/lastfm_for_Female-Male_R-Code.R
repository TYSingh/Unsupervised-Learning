######Step:1 --- Read data

lastfm <- read.csv("C:/Users/User/Desktop/14 Jan/lastfm.csv")
#Data Exploration Starts
lastfm[1:19,]
lastfm_Fuser <- lastfm[lastfm$sex == "f",]
lastfm_Muser <- lastfm[lastfm$sex == "m",]

class(lastfm_Fuser)
class(lastfm_Muser)

View(lastfm_Fuser)
View(lastfm_Muser)

attach(lastfm_Fuser)
attach(lastfm_Muser)

length(lastfm_Fuser$user) #  78132 records in the file
lastfm_Fuser$user <- factor(lastfm_Fuser$user)
length(levels(lastfm_Fuser$user))   #3851 users
length(levels(lastfm_Fuser$artist)) #1,004 artists
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
FemalePlaylist <- split(x=lastfm_Fuser[,"artist"],f=lastfm_Fuser$user) #split into a list of users
FemalePlaylist <- lapply(FemalePlaylist,unique)  ## remove artists duplicates
FemalePlaylist[1:2] ## The first two listeners (1 and 19 users) listen to the displayed artists

MalePlaylist <- split(x=lastfm_Muser[,"artist"],f=lastfm_Muser$user) #split into a list of users
MalePlaylist <- lapply(MalePlaylist,unique)  ## remove artists duplicates
MalePlaylist[1:2] ## The first two listeners (3 and 4 users) listen to the displayed artists

FemalePlaylist <- as(FemalePlaylist,"transactions")
MalePlaylist <- as(MalePlaylist,"transactions")
## view this as a list of "transactions"
## transactions is a data class defined in arules

itemFrequency(FemalePlaylist)
itemFrequency(MalePlaylist)
## lists the support of the 1,004 artists
## number of times band is listed to on the shopping trips of 15,000 users
## computes the rel freq each artist mentioned by the 15,000 users

itemFrequencyPlot(FemalePlaylist,support=0.08,cex.names=1.5)
## plots the item frequencies (only artists with > % support)
# In notes we checked "support count". Algorithm in package "arules" uses "support%"
# plot will show 21 artists as relevant. so total no of combinations of artists = (2)^21 -1.
itemFrequencyPlot(MalePlaylist,support=0.08,cex.names=1.5)
## plots the item frequencies (only artists with > % support)
# In notes we checked "support count". Algorithm in package "arules" uses "support%"
# plot will show 13 artists as relevant. so total no of combinations of artists = (2)^13 -1.

## Finally, we build the association rules
## only rules with support > 0.01 and confidence > 0.50
## so it can't be a super rare artist
musicRulesF <- apriori(FemalePlaylist,parameter = list(support=0.01, confidence =0.5))
musicRulesM <- apriori(MalePlaylist,parameter = list(support=0.01, confidence =0.5))

inspect(musicRulesF)
#Out of ((2)^21 -1), 240 are unpruned associations.
inspect(musicRulesM)
#Out of ((2)^13 -1), 64 are unpruned associations.
