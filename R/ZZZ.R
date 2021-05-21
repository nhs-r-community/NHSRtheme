#' \code{nhsrtheme} package
#'
#' NHS Theme
#'
#' #' See the README on
#' \url{https://github.com/tomjemmet/nhsrtheme/}
#'
#' @docType package
#' @name nhsrtheme
NULL

## Prevent R CMD check notes about missing bindings for global variables
if (getRversion() >= "2.15.1")
  utils::globalVariables(c(
    "n",
    "name",
    "section"
  ))

# Install the required font
.onLoad <- function(libname, pkgname) {
  if (Sys.info()[1] == "Linux") {
    dir.create('~/.fonts')
    file.copy("fonts/Frutiger.ttf", "~/.fonts")
    system('fc-cache -f ~/.fonts')
  }
  if (Sys.info()[1] == "Windows") {
    extrafont::font_import(paths = "fonts",
                           prompt = FALSE)
    extrafont::loadfonts(device = "win")
  }
}
