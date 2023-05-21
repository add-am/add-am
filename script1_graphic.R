library(tidyverse)
library(ggplot2)
library(gganimate)
library(RColorBrewer)

data <- read_csv("graphic_data.csv")

data <- data |> mutate(column = as.factor(column))

gif <- ggplot(data, aes(x=column, y=value, fill=value)) + 
    geom_bar(stat='identity', width = 1, show.legend = F) +
  scale_fill_distiller(palette = "Blues") +
  theme(panel.background = element_rect(fill = "grey15"),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        panel.border = element_rect(fill = "transparent",colour = "grey15"),
        plot.background = element_rect(fill = "grey15", colour = "grey15"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.margin = margin(t = 2, r = 2, b = 2, l = 2, unit = "pt")) + 
  transition_time(round)

anim_save("profile.gif", gif, width = 1200, height = 200)
  
