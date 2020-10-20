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
#' @return R Markdown output format to pass to \code{\link{render}}
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

  ratio <- match.arg(ratio)

  # get the locations of resource files located within the package
  css <- system.file("rmarkdown/templates/nhsr-presentation",
                     "nhsr_xaringan.css",
                     package = "nhsrtheme"
  )

  dots <- list(...)

  if (is.null(dots$nature)) {
    dots$nature <- list(
      ratio = "16:9",
      highlightLines = TRUE,
      countIncrementalSlides = FALSE,
      highlightStyle = "github"
    )
  }

  if (is.null(dots$self_contained)) {
    dots$self_contained <- TRUE
  }

  # call the base word_document function
  xaringan::moon_reader(
    css = c("default", css),
    dots
  )
}
