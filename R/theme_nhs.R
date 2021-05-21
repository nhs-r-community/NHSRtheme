#' Add NHS theme to ggplot chart
#'
#' This adds a theme to your chart to follow the
#' [NHS Identity](https://digital.nhs.uk/about-nhs-digital/corporate-information-and-documents/nhs-digital-style-guidelines/how-we-look/charts)
#'
#' @importFrom ggplot2 element_text margin element_blank element_line element_rect
#' @export
theme_nhs <- function() {

  # Function to help standardise the text
  nhs_element_text <- function(...) {
    element_text(family = "Frutiger",
                 color = "#231f20",
                 ...)
  }

  ggplot2::theme(

    # Set the title to be much larger and bolder than other text
    plot.title = nhs_element_text(size = 28,
                                  face = "bold"),

    # Set the subtitle to be larger than other text with a small margin
    plot.subtitle = nhs_element_text(size = 22,
                                     margin = margin(9, 0, 9, 0)),

    # Set the legend to be aligned at the top with no title and background
    # Note: the legend may need manual tweaking based on plot coordinates
    legend.title = element_blank(),
    legend.text = nhs_element_text(size = 12),
    legend.position = "top",
    legend.text.align = 0,
    legend.background = element_blank(),
    legend.key = element_blank(),

    # Set the axis to have to have no lines or ticks with a small margin on the
    # x axis
    axis.title = nhs_element_text(size = 12),
    axis.text = nhs_element_text(size = 12),
    axis.text.x = element_text(margin = margin(5, 0, 10, 0)),
    axis.ticks = element_blank(),
    axis.line = element_blank(),

    # Remove all minor gridlines and add major y gridlines
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_line(color = "#E8EDEE"),
    panel.grid.major.x = element_blank(),

    # Set the panel background to be blank
    panel.background = element_blank(),

    # For facets, set the title to be larger than other text and left-justified
    # and the panel background to white
    strip.text = nhs_element_text(size = 22,
                                  hjust = 0),
    strip.background = element_rect(fill = "white")
  )
}
