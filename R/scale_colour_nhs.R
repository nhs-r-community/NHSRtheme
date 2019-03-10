#' Color scale constructor for NHS theme colours
#'
#' @param palette Character name of palette in NHS theme
#' @param discrete Boolean indicating whether colour aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_colour_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
#' @export
scale_colour_nhs <- function(palette = "blues", discrete = TRUE, reverse = FALSE, ...) {
  pal <- nhstheme_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("nhstheme_", palette), palette = pal, ...)
  } else {
    scale_colour_gradientn(colours = pal(256), ...)
  }
}
