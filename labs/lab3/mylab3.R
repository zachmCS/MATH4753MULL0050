# task 1
getwd()

# task 2
df <- read.csv("SPRUCE.csv")
head(df)

# task 3
with(df, plot(Height~BHDiameter, bg="Blue", pch=21, cex=1.2, xlim=c(0, 1.1 * max(BHDiameter)), ylim=c(0, 1.1 * max(Height))))

library(s20x)
layout(matrix(1:3, nr = 3 , nc = 1, byrow = T,))
trendscatter(Height~BHDiameter, f = 0.5, data = df)
trendscatter(Height~BHDiameter, f = 0.6, data= df)
trendscatter(Height~BHDiameter, f = 0.7, data = df)

# smoothing 
df.lm <- lm(Height~BHDiameter, data = df)
plot(Height~BHDiameter, data = df)
abline(df.lm)


# Graphs
layout(matrix(1:4, nr = 2, nc = 2, byrow=TRUE))

# Graph 1
with(df, plot(Height~BHDiameter, bg = "Blue", pch = 21, ylim = c(0, 1.1 * max(Height)), xlim = c(0 ,1.1 * max(BHDiameter))))
abline(df.lm)

# Graph 2

with(df, plot(Height~BHDiameter, bg = "Blue", pch = 21, ylim = c(0, 1.1*max(Height)), xlim = c(0, 1.1*max(BHDiameter)))
)
abline(df.lm)

yhat = fitted(df.lm)
#residual sum of squares
RSS = with(df, sum((Height-yhat)^2))

RSS



# TSS, MSS, RSS
yhat = fitted(df.lm)
TSS = with(df, sum((Height- mean(Height))^2))
MSS = with(df, sum((yhat - mean(Height))^2))
RSS = with(df, sum((Height - yhat)^2))
MSS/TSS
RSS+MSS
TSS

# Task 5
summary(df.lm)
predict(df.lm)

# Task 6
library(ggplot2)
g = ggplot(df, aes(x = BHDiameter, y = Height, colour = BHDiameter))
g=g + geom_point() + geom_line() + geom_smooth(method = "lm")
g + ggtitle("Height vs Diameter")
