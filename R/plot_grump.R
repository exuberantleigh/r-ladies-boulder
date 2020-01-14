library(here)
library(magrittr)
library(tidyverse)
library(extrafont)
library(png)
library(ggpubr)
library(patchwork)
# font_import()
loadfonts()
dat <- read.csv("data/christmas_billboard_data.csv")
grump <- readPNG(here("inst", "media", "grump.png"))

dat %>% count(performer)
dat %>% count(song)
dat %>% count(songid)
dat %>% group_by(songid)
dat %>% count(peak_position, peak_position)



grump_p <- dat %>%
  arrange(peak_position) %>%
  ggplot(aes(peak_position)) +
  background_image(grump) +
  geom_bar(fill = "red") +
  theme(text = element_text(family = "Comic Sans MS"),
        axis.text = element_text(family = "Comic Sans MS")) +
  theme(plot.background = element_rect(fill = 'green')) +
  ggtitle("Grump Plot")

polar_p <- dat %>%
  top_n(20, peak_position)  %>%
  ggplot(aes(song)) +
  geom_bar(fill = "red") +
  coord_polar() +
  theme(text      = element_text(family = "Comic Sans MS"),
        axis.text = element_text(family = "Comic Sans MS"),
        legend.text = element_text(hjust = 0.5),
        panel.grid = element_line(color = "yellow", size = 1.5),
        panel.background = element_rect(fill = 'green'),
        plot.background = element_rect(fill = 'red'),
        axis.text.x = element_text(angle = 25, hjust = 0.5, size = 6)) +
  ggtitle("Polar Plot")

grump_p + polar_p
ggsave(here("inst", "plots", "grump_polar.png"), width = 10, height = 4,
       dpi = 500)
