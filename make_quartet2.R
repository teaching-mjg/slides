library(quartets)
library(tidyverse)
a <- as_tibble(anscombe_quartet)
a <- a %>% mutate(dataset = paste0("DF:", parse_number(dataset)))
a <- a %>% group_by(dataset) %>% 
  summarise(
    n=n(),
    mean.x=mean(x), mean.y=mean(y),
    median.x=median(x), median.y=median(y))
(a)
