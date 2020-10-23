#' An R Markdown output format for NHS themed remark.js slides
#'
#' This output format is based off of [xaringan::moon_reader()] and produces an
#' HTML file that contains the Markdown source (knitted from R Markdown) and
#' JavaScript code to render slides.
#'
#' The theme is based off of the [NHS Identity Guidelines](https://www.england.nhs.uk/nhsidentity/)
#' produced by NHS England. It does not follow the guidelines completely, for
#' instance we do not use the fonts suggested by the guidelines for these are
#' proprietary and cannot be included in this package.
#'
#' @param ... additional arguments to pass to [xaringan::moon_reader()]
#'
#' @return R Markdown output format to pass to [rmarkdown::render()]
#'
#' @importFrom xaringan moon_reader
#'
#' @examples
#' \dontrun{
#' library(rmarkdown)
#'
#' # simple invocation
#' render("input.Rmd", su_presentation())
#' }
#' @export
#' @md
nhsr_presentation <- function(...) {
  dots <- list(...)

  if (!is.null(dots$self_contained)) {
    stop("self_contained parameter cannot be set")
  }
  dots$self_contained <- TRUE

  if (!is.null(dots$seal)) {
    stop("seal parameter cannot be set")
  }
  dots$seal <- FALSE

  css_path <- system.file("rmarkdown", "templates", "nhsr-presentation", "css",
                          package = "nhsrtheme")

  # if css has not been passed in as an argument, use the default xaringan css and this themes css files
  if (is.null(dots$css)) {
    files <- dir(css_path, pattern = "\\.css$", full.names = TRUE)
    dots$css <- c("default", files)
  }

  # if nature has not been passed in as an argument, use defaults
  if (is.null(dots$nature)) {
    dots$nature <- list(
      ratio = "16:9",
      highlightLines = TRUE,
      countIncrementalSlides = FALSE,
      highlightLanguage = "R",
      highlightStyle = "github"
    )
  }

  if (is.null(dots$includes)) {
    dots$includes <- list()
  }

  if (is.null(dots$includes$after_body)) {
    dots$includes$after_body <- file.path(css_path, "insert-logo.html")
  }

  # call the main xaringan moon_reader function
  do.call(xaringan::moon_reader, dots)
}
