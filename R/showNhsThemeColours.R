#' Show's the NHS identity colours
#'
#' This function shows the available colours in the NHS theme, as defined by the
#' [NHS Identity](https://www.england.nhs.uk/nhsidentity/identity-guidelines/colours/)
#'
#'
#' @return named vector of hexadecimal strings of colours
#' @importFrom dplyr %>% group_by mutate tibble
#' @importFrom purrr map_dfr
#' @import ggplot2
#' @export
#'
#' @examples
#' sample_plot()
showNhsThemeColours <- function() {
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
}
