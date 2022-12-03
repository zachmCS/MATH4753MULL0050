mtbe <- read.csv("MTBE.csv")
ind = sample(1:223, 5, replace=FALSE)
mtbe[ind,]

omit_mtbe=na.omit(mtbe)

depth=omit_mtbe[omit_mtbe$Aquifier == 'Bedrock',]$Depth
sd(depth)

library(plotrix)
