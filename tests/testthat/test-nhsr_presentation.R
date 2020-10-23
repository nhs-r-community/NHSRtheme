library(testthat)
library(mockery)

test_that("it calls xaringan::moon_reader with default arguments", {
  m <- mock()

  with_mock("moon_reader" = m, .env = "xaringan", {
    nhsr_presentation()
  })

  expect_called(m, 1)

  ma <- mock_args(m)[[1]]

  expect_equal(ma$self_contained, TRUE)
  expect_equal(ma$seal, FALSE)
  expect_true("default" %in% ma$css)
  expect_true("nhsr-fonts.css" %in% gsub(".*/", "", ma$css))
  expect_true("nhsr.css" %in% gsub(".*/", "", ma$css))
  expect_equal(ma$nature, list(
    ratio = "16:9",
    highlightLines = TRUE,
    countIncrementalSlides = FALSE,
    highlightLanguage = "R",
    highlightStyle = "github"
  ))

  expect_true(grepl("inst/rmarkdown/templates/nhsr-presentation/css/insert-logo\\.html$",
                    ma$includes$after_body))
})

test_that("it doesn't allow you to set the seal or self_contained arguments", {
  expect_error(nhsr_presentation(seal = TRUE))
  expect_error(nhsr_presentation(self_contained = FALSE))
})
