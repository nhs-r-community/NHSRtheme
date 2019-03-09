#' Get's the NHS identity colours
#'
#' This function gets the colours as defined by the
#' [NHS Identity](https://www.england.nhs.uk/nhsidentity/identity-guidelines/colours/)
#'
#' @param section a character, or list of characters of the colour sections to
#'                 use
#'
#' @return named vector of hexadecimal strings of colours
#' @export
#'
#' @importFrom dplyr %>%
#' @importFrom purrr map_lgl
#'
#' @examples
#' getNhsColours()
#' getNhsColours("blues")
#' getNhsColours(c("blues", "neutrals"))
getNhsColours <- function (..., section = NULL) {
  if (is.null(section)) {
    section <- c("blues",
                 "neutrals",
                 "support greens",
                 "highlights")
  }

  dots <- unique(c(...))
  colours <- c()

  # Level 1: NHS blues
  if ("blues" %in% section) {
    colours <- c(colours,
      DarkBlue   = "#003087",
      Blue       = "#005EB8",
      BrightBlue = "#0072CE",
      LightBlue  = "#41B6E6",
      AquaBlue   = "#00A9CE")
  }

  # Level 2: NHS neutrals
  if ("neutrals" %in% section) {
    colours <- c(colours,
      Black      = "#231f20",
      DarkGrey   = "#425563",
      MidGrey    = "#768692",
      PaleGrey   = "#E8EDEE")
  }

  # Level 3: NHS support greens
  if ("support greens" %in% section) {
    colours <- c(colours,
      Green      = "#009639",
      DarkGreen  = "#006747",
      LightGreen = "#78BE20",
      AquaGreen  = "#00A499")
  }

  # Level 4: NHS highlights
  if ("highlights" %in% section) {
    colours <- c(colours,
      Purple     = "#330072",
      DarkPink   = "#7C2855",
      Pink       = "#AE2573",
      DarkRed    = "#8A1538",
      Red        = "#DA291C",
      Orange     = "#ED8B00",
      WarmYellow = "#FFB81C",
      Yellow     = "#FAE100")
  }

  if (!is.null(dots)) {
    colours <- colours[dots]

    if(colours %>% map_lgl(is.na) %>% any) {
      stop("Invalid colours specified")
    }
  }

  return (colours)
}

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
