#' Return function to interpolate an Nhs theme colour palette
#'
#' @param palette Character name of section in Nhs theme
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
#' @importFrom grDevices colorRampPalette
getNhsPalette <- function(palette = "blues", reverse = FALSE, ...) {
  pal <- getNhsColours(section = palette)

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}
