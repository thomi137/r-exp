library(ggplot2)

amazon <- read.csv('amazon.csv')

# year is a factor
amazon$year <- factor(amazon$year)

# the number contain thousand separators, need to get rid of them:
# https://stackoverflow.com/questions/15833605/remove-thousands-separator
amazon$number <- sapply(amazon$number, 
                        function(x) as.numeric(gsub('\\.','', as.character(x))))
str(amazon)
summary(amazon)

fire.per.year <- aggregate(amazon$number, by=list(year=amazon$year, state=amazon$state), FUN=sum)
str(fire.per.year)
summary(fire.per.year)


ggplot(fire.per.year, aes(year, x)) + 
  geom_boxplot()

