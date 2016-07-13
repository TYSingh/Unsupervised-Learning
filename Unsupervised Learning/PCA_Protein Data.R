food <- read.csv(file.choose(),header = TRUE)
food

PCAfood <- prcomp(food[,-1],scale = TRUE)
PCAfood

# How many principal components do we need ???
plot(PCAfood,main = "")
mtext(side = 1,"European Protein Principal Components", line=3,font=2)


###### mtext() parameters
#Text is written in one of the four margins of the current figure region or one of the outer margins of the
#device region.
#side	: on which side of the plot (1=bottom, 2=left, 3=top, 4=right).
#font	: font for text. Can be a vector. NA values (the default) mean use par("font").
#line : The 'line' argument is for specifying the margin line number on which the text to be placed- starts
#from 0 and move outwards (1,2,.). If line=3, it puts text for a side depth level 2.
#0-margin adjacent to axis
#1-margin adjacent(outward) to above margin(0-margin adjacent to axis)
#2-margin adjacent(outward) to above margin(1-margin adjacent(outward) to above margin(0-margin adjacent
#to axis)).....