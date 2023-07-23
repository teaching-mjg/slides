library(quartets)
library(tidyverse)
library(tidyr)
library(ggplot2)
library(patchwork)

# named_levels=c(
#   "(1) Linear...",
#   "(2) Nonlinear",
#   "(3) Outlier..",
#   "(4) Leverage."
# )
#
# colour_levels=c(
#   "(1) Red......",
#   "(2) Green....",
#   "(3) Blue.....",
#   "(4) Purple..."
# )


named_levels=c(
  "Linear",
  "Nonlinear",
  "Outlier",
  "Leverage"
)

colour_levels=c(
  "Red",
  "Green",
  "Blue",
  "Purple"
)

anscombe_quartet1 <- anscombe_quartet %>%
  mutate(datasetID=factor(dataset, levels=unique(dataset), labels=colour_levels))
anscombe_quartet2 <- anscombe_quartet %>%
  mutate(datasetID=factor(dataset, levels=unique(dataset), labels=named_levels))

p0=ggplot(anscombe_quartet1, aes(x=x, y=y)) + facet_wrap(~datasetID, nrow=1) +
  geom_smooth(method='lm', fullrange=TRUE, aes(colour=datasetID), alpha=0) +
  theme_bw()+theme(panel.grid = element_blank(),
                   plot.margin=unit(c(0,0,0,0), "cm"), legend.position = "none",
                   axis.title = element_blank())+
  ylim(c(3,16))+
  scale_colour_manual(values=rep("white",4))

p1=ggplot(anscombe_quartet1, aes(x=x, y=y)) + facet_wrap(~datasetID, nrow=1) +
  geom_smooth(method='lm', fullrange=TRUE, aes(colour=datasetID), alpha=0.2) +
  theme_bw()+theme(panel.grid = element_blank(),
                   plot.margin=unit(c(0,0,0,0), "cm"), legend.position = "none",
                   axis.title = element_blank())+
  ylim(c(3,16))

p2=ggplot(anscombe_quartet2, aes(x=x, y=y)) + facet_wrap(~datasetID, nrow=1) +
  geom_smooth(method='lm', fullrange=TRUE, aes(colour=datasetID), alpha=0.2) +
  geom_point(pch=21, aes(fill=datasetID), show.legend = F)+
  theme_bw()+theme(panel.grid = element_blank(),
                   plot.margin=unit(c(0,0,0,0), "cm"), legend.position = "none",
                   axis.title = element_blank())+
  ylim(c(3,16))

p3=ggplot(anscombe_quartet2, aes(x=x, y=y)) + facet_wrap(~datasetID, nrow=1) +
  geom_smooth(aes(colour=datasetID), alpha=0.2, span=3) +
  theme_bw()+theme(panel.grid = element_blank(),
                   plot.margin=unit(c(0,0,0,0), "cm"), legend.position = "none",
                   axis.title = element_blank())+
  ylim(c(3,16))

p4=ggplot(anscombe_quartet2, aes(x=x, y=y)) + facet_wrap(~datasetID, nrow=1) +
  geom_smooth(aes(colour=datasetID), alpha=0.2, span=3) +
  geom_point(pch=21, aes(fill=datasetID), show.legend = F)+
  theme_bw()+theme(panel.grid = element_blank(),
                   plot.margin=unit(c(0,0,0,0), "cm"), legend.position = "none",
                   axis.title = element_blank())+
  ylim(c(3,16))



p1/p0/p0
ggsave(file.path("img", "plot1.png"), width=8.85, height=5)

p1/p2/p0
ggsave(file.path("img", "plot2.png"), width=8.85, height=5)

p1/p2/p3
ggsave(file.path("img", "plot3.png"), width=8.85, height=5)

p1/p2/p4
ggsave(file.path("img", "plot4.png"), width=8.85, height=5)


# transform(iris, Species = c("S", "Ve", "Vi")[as.numeric(Species)])
# transform(anscombe_quartet, which_data = unique(datasetID)[as.numeric(which_data)])
