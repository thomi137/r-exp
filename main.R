library(ggplot2)

summary(amazon)
amazon$year <- factor(amazon$year)
str(amazon)
summary(amazon)

fire.per.year <- aggregate(amazon$number, by=list(year=amazon$year, state=amazon$state), FUN=sum)

ggplot(fire.per.year, aes(year, x)) + 
  geom_boxplot()

