# Generate hexagonal logo for the package

# Setup ------------------------------------------------------------------------
p_family <- "Aller_Rg"

main_colour <- NHSRtheme::get_nhs_colours()["DarkBlue"]

# Creating subplot -------------------------------------------------------------
# This is a graph from the README
df <- data.frame(x = c("a", "b", "c", "d"), y = c(3, 4, 1, 2))

bars <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = x)) +
  ggplot2::geom_bar(stat = "identity") +
  NHSRtheme::scale_fill_nhs() +
  ggplot2::theme_void() +
  ggplot2::theme(legend.position = "none") +
  hexSticker::theme_transparent()

# Creating hex logo ------------------------------------------------------------
hexSticker::sticker(
  subplot = bars,
  package = "NHSRtheme",
  h_color = main_colour,
  h_fill = "#ffffff",
  s_x = 1,
  s_y = 1.1,
  s_height = 1,
  s_width = 1.5,
  url = "",
  u_angle = 30,
  u_x = 1.08,
  u_y = 0.1,
  u_size = 4.85,
  dpi = 500,
  p_x = 1.0,
  p_y = 0.5,
  p_size = 28,
  p_color = main_colour,
  p_family = p_family,
  u_color = main_colour,
  u_family = p_family,
  filename = "inst/images/nhsrthemelogo.png"
)
