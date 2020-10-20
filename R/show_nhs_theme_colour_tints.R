#' Show's the NHS identity colours
#'
#' This function shows the tints of a colour from the Nhs Theme
#'
#'
#' @return named vector of hexadecimal strings of colours
#'
#' @param tints a vector of numbers between 0 and 1 that represents the
#'              percentage tints required
#' @param colour the name of the colour to show tints of
#'
#' @importFrom dplyr %>% group_by mutate tibble row_number
#' @importFrom purrr map_dfr
#' @import ggplot2
#' @export
#'
#' @examples
#' show_nhs_theme_colour_tints(seq(0,1,0.1), "Blue")
show_nhs_theme_colour_tints <- function(tints, colour) {
  colours <- get_nhs_colour_tints(tints, colour)

  tibble(name = names(colours)) %>%
    mutate(n = 100 - row_number(),
           n = sprintf("%03d%s", n, name)) %>%
    ggplot(aes(n, 1, fill = name, label = name)) +
    geom_tile() +
    geom_label(fill = "white") +
    scale_fill_manual(values = colours) +
    scale_x_discrete(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0)) +
    coord_flip() +
    #theme_void() +
    theme(legend.position = "none",
          axis.text = element_blank(),
          axis.ticks = element_blank()) +
    labs(x = "", y = "")
}
