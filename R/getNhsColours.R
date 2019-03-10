#' Get's the NHS identity colours
#'
#' This function gets the colours as defined by the
#' [NHS Identity](https://www.england.nhs.uk/nhsidentity/identity-guidelines/colours/)
#'
#' @param ... optional names of the colours to return
#' @param section optional, name of the colour sections to use
#'
#' @return named vector of hexadecimal strings of colours
#' @importFrom dplyr %>%
#' @importFrom purrr map_lgl
#' @export
#'
#' @examples
#' getNhsColours()
#' getNhsColours("blues")
#' getNhsColours(c("blues", "neutrals"))
getNhsColours <- function (..., section = NULL) {
  dots <- unique(c(...))
  colours <- c()

  if (!is.null(section)) {
    section <- match.arg(section, c("blues",
                                    "neutrals",
                                    "support greens",
                                    "highlights"))
  }

  # Level 1: NHS blues
  if (is.null(section) || section == "blues") {
    colours <- c(colours,
      DarkBlue   = "#003087",
      Blue       = "#005EB8",
      BrightBlue = "#0072CE",
      LightBlue  = "#41B6E6",
      AquaBlue   = "#00A9CE")
  }

  # Level 2: NHS neutrals
  if (is.null(section) || section == "neutrals") {
    colours <- c(colours,
      Black      = "#231f20",
      DarkGrey   = "#425563",
      MidGrey    = "#768692",
      PaleGrey   = "#E8EDEE")
  }

  # Level 3: NHS support greens
  if (is.null(section) || section == "support greens") {
    colours <- c(colours,
      DarkGreen  = "#006747",
      Green      = "#009639",
      LightGreen = "#78BE20",
      AquaGreen  = "#00A499")
  }

  # Level 4: NHS highlights
  if (is.null(section) || section == "highlights") {
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
