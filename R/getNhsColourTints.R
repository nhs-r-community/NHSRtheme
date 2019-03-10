#' Get's tints of the NHS identity colours
#'
#' This function returns tints of the NHS identity colours
#'
#' @param tints a vector of numbers between 0 and 1 for the percentage colour
#'               tint to use
#' @param section a character, or list of characters of the colour sections to
#'                 use
#'
#' @return named vector of hexadecimal strings of colours
#' @importFrom dplyr %>%
#' @importFrom purrr map_chr map set_names
#' @importFrom scales percent
#' @importFrom grDevices col2rgb
#' @export
#'
#' @examples
#' getNhsColourTints(seq(0.0,0.8,0.2))
#' getNhsColourTints(seq(0.0,0.8,0.2), "blues")
getNhsColourTints <- function (tints, ..., section = NULL) {
  if (!is.numeric(tints) || any(tints < 0) || any(tints > 1))  {
    stop("tints must be a numeric vector between 0 and 1")
  }

  colours <- getNhsColours(..., section = section)

  getTints <- function(colour) {
    colTint <- function(tint) {
      x <- as.vector(col2rgb(colour))
      x <- sum(round(x + (255-x)*tint) * 16^c(4, 2, 0))
      sprintf("#%06X", x)
    }

    map_chr(tints, colTint) %>%
      set_names(percent(tints, 1))
  }

  colours <- map(colours, getTints) %>% unlist

  return (colours)
}
