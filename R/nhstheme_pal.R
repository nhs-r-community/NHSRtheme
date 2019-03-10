#' Return function to interpolate a drsimonj color palette
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
#' @importFrom grDevices colorRampPalette
nhstheme_pal <- function(palette = "blues", reverse = FALSE, ...) {
  pal <- getNhsColours(section = palette)

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}
