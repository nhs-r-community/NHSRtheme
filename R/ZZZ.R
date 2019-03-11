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
if(getRversion() >= "2.15.1")
  utils::globalVariables(c(
    "n",
    "name",
    "section"
  ))
