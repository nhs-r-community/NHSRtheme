library(ggplot2)

c("blues", "neutrals", "support greens", "highlights") %>%
  map_dfr(function(s) {
    colours <- getNhsColours(section = s)
    tibble(section = s,
           name = names(colours),
           colour = unname(colours))
  }) %>%
  group_by(section) %>%
  mutate(n = 10 - row_number(),
         n = paste0(n, name)) %>%
  ggplot(aes(n, 1, fill=name, label = name)) +
  geom_tile() +
  geom_label(fill = "white") +
  scale_fill_manual(values = getNhsColours()) +
  facet_wrap(vars(section), ncol = 2, scales = "free") +
  scale_x_discrete(expand = c(0,0)) +
  scale_y_continuous(expand = c(0, 0)) +
  coord_flip() +
  #theme_void() +
  theme(legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank()) +
  labs(x = "", y = "")
