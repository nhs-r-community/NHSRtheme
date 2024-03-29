#' Return function to interpolate an Nhs theme colour palette
#'
#' @param palette Character name of section in Nhs theme
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
#' @importFrom grDevices colorRampPalette
#' @export
get_nhs_palette <- function(palette = "main", reverse = FALSE, ...) {
  if (palette == "main") {
    pal <- get_nhs_colours("Blue", "Purple", "Red", "Orange", "Green")
  } else {
    pal <- get_nhs_colours(section = palette)
  }

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

