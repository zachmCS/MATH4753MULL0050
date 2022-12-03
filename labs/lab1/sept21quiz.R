ddt <- read.csv("DDT.csv")

ddt[ddt$MILE > 1 & ddt$MILE< 100,]

mean(ddt$DDT)

var(ddt$WEIGHT)

print("Fuck you marcos")


y<- bin(n=10, p =0.5,)
