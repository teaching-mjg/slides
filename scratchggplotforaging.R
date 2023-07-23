ggplot(data_foraging, aes(y=n_hi_consumed, x=trialCount, color=fruits))+
  facet_grid(~instructions)+
  geom_smooth()+
  scale_x_continuous(breaks=c(1,5,10))+
  ylab("Number of high fruit consumed")+
  labs(title="Mean number of high value fruit consumed per trial",subtitle = "max possible is 10")+
  theme_bw() + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())

ggplot(data_foraging, aes(y=n_hi_consumed, x=trialCount))+
  geom_smooth()+
  scale_x_continuous(breaks=c(1,5,10))+
  ylab("Number of high fruit consumed")+
  labs(title="Mean number of high value fruit consumed per trial",subtitle = "max possible is 10")+
  theme_bw() + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())

  
